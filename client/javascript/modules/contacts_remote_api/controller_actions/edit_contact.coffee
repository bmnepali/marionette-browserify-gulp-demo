Radio = require '../../../radio'
Backbone = require 'backbone'
$ = require 'jquery'

EditContactView = require '../views/edit/contact_view'
MissingContactView = require '../views/show/missing_contact_view'
LoadingView = require '../views/common/loading_view'

module.exports = (id) ->
  loadingView = new LoadingView()
  @options.mainRegion.show loadingView

  fetchingContact = Radio.reqres.request 'global', "contact:entity", id
  Backbone.history.navigate "contacts/#{id}/edit"

  $.when(fetchingContact).done (contact) =>
    view = new EditContactView
      model: contact
      generateTitle: true

    view.on 'form:submit', (data) =>
      contact.set data, silent: true
      savingContact = contact.save data, wait: true
      if savingContact
        view.onBeforeClose = ->
          contact.set changedOnServer: false

        $.when(savingContact).done =>
          @showContact contact.get('id')

        .fail (response) ->
          if response.status is 422
            keys = ['firstName', 'lastName', 'phoneNumber']
            contact.refresh response.responseJSON.entity, keys
            view.render()
            view.triggerMethod "form:data:invalid", response.responseJSON.errors
            contact.set response.responseJSON.entity, silent: true
          else
            console.log 'an unprocessed error, try again.'
      else
        view.triggerMethod "form:data:invalid", contact.validationError

    @options.mainRegion.show(view)

  .fail (response) =>
    if response.status is 404
      view = new MissingContactView()
      @options.mainRegion.show(view)
    else
      console.log 'unprocessed error'

  Radio.commands.execute "global", "set:active:header", "contacts"
