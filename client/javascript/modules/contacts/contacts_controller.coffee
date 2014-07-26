Marionette = require 'backbone.marionette'
ListContactsView = require './views/list/contacts_view'
ShowContactView = require './views/show/contact_view'
EditContactView = require './views/edit/contact_view'
MissingContactView = require './views/show/missing_contact_view'
LoadingView = require './views/common/loading_view'
ContactEntity = require './entities/contact'
Radio = require '../../radio'
Backbone = require 'backbone'
$ = require 'jquery'

module.exports = Marionette.Controller.extend
  initialize: ->
    ContactEntity.initialize()
    @setHandlers()

  editContact: (id) ->
    loadingView = new LoadingView()
    @options.mainRegion.show loadingView

    fetchingContact = Radio.reqres.request 'global', "contact:entity", id
    Backbone.history.navigate "contacts/#{id}/edit"

    $.when(fetchingContact).done (contact) =>
      if contact is undefined
        editContactView = new MissingContactView()
      else
        editContactView = new EditContactView model: contact

      @options.mainRegion.show(editContactView)

      editContactView.on 'form:submit', (data) =>
        if contact.save data
          @showContact contact.get('id')
        else
          editContactView.triggerMethod "form:data:invalid", contact.validationError

  showContact: (id) ->
    loadingView = new LoadingView()
    @options.mainRegion.show loadingView

    fetchingContact = Radio.reqres.request 'global', "contact:entity", id
    Backbone.history.navigate "contacts/#{id}"

    $.when(fetchingContact).done (contact) =>
      if contact is undefined
        showContactView = new MissingContactView()
      else
        showContactView = new ShowContactView model: contact

      @options.mainRegion.show(showContactView)

      showContactView.on 'childview:contact:edit', (childview, model) =>
        @editContact(model.get('id'))

  listContacts: ->
    loadingView = new LoadingView()
    @options.mainRegion.show loadingView

    fetchingContacts = Radio.reqres.request 'global', "contact:entities"
    Backbone.history.navigate "contacts"

    $.when(fetchingContacts).done (contacts) =>
      listContactsView = new ListContactsView collection: contacts

      listContactsView.on 'childview:contact:delete', (childView, model) ->
        model.destroy()

      listContactsView.on 'childview:contact:show', (childView, model) =>
        @showContact(model.get('id'))

      listContactsView.on 'childview:contact:edit', (childView, model) =>
        view = new EditContactView
          model: model
          asModal: true

        view.on "form:submit", (data) =>
          if model.save(data)
            childView.render()
            @options.dialogRegion.empty()
            childView.flash "success"
          else
            view.triggerMethod "form:data:invalid", model.validationError

        @options.dialogRegion.show(view)

      @options.mainRegion.show(listContactsView)

  setHandlers: ->
    Radio.vent.on 'global', 'contacts:list', =>
      Backbone.history.navigate 'contacts'
      @listContacts()
