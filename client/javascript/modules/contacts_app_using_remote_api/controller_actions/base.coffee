Marionette = require 'backbone.marionette'
Radio = require '../../../radio'
Backbone = require 'backbone'

EditContactView = require '../views/edit/contact_view'
ContactEntity = require '../entities/contact'

module.exports = Marionette.Controller.extend
  initialize: ->
    ContactEntity.initialize()
    @setHandlers()

  setHandlers: ->
    Radio.vent.on 'global', 'contact:list:show', (options) =>
      @showContact(options.model.get('id'))

    Radio.vent.on 'global', 'contact:list:edit', (options) =>
      model = options.model
      childView = options.childView
      view = new EditContactView
        model: model

      view.on "form:submit", (data) ->
        model.set data, silent: true
        savingContact = model.save data, wait: true
        if savingContact
          view.onBeforeClose = ->
            model.set changedOnServer: false

          $.when(savingContact).done ->
            childView.render()
            delete view.onClose
            view.trigger 'dialog:close'
            childView.flash "success"
          .fail (response) ->
            if response.status is 422
              view.onClose = ->
                model.set(response.responseJSON.entity)

              keys = ['firstName', 'lastName', 'phoneNumber']
              model.refresh response.responseJSON.entity, keys

              view.render()
              newContactView.triggerMethod 'form:data:invalid', response.responseJSON.errors
              model.set response.responseJSON.entity, silent: true
            else
              console.log 'unprocessed error, try again'
        else
          view.onClose = ->
            model.set(model.previousAttributes())
          view.triggerMethod 'form:data:invalid', model.validationError

      @options.dialogRegion.show(view)

    Radio.vent.on 'global', 'contacts:list', =>
      Backbone.history.navigate 'contacts'
      @listContacts()
