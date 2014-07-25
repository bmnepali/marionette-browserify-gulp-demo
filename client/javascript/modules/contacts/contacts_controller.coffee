Marionette = require 'backbone.marionette'
ListContactsView = require './views/list/contacts_view'
ShowContactView = require './views/show/contact_view'
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

  showContact: (id) ->
    loadingView = new LoadingView()
    @options.mainRegion.show loadingView

    fetchingContacts = Radio.reqres.request 'global', "contact:entity", id
    Backbone.history.navigate "contacts/#{id}"
    $.when(fetchingContacts).done (contact) =>
      if contact is undefined
        contactView = new MissingContactView()
      else
        contactView = new ShowContactView model: contact

      @options.mainRegion.show(contactView)

  listContacts: ->
    fetchingContacts = Radio.reqres.request 'global', "contact:entities"
    $.when(fetchingContacts).done (contacts) =>
      listContactsView = new ListContactsView collection: contacts

      listContactsView.on 'childview:contact:delete', (childView, model) ->
        model.destroy()

      listContactsView.on 'childview:contact:show', (childView, model) =>
        @showContact(model.get('id'))

      @options.mainRegion.show(listContactsView)

  setHandlers: ->
    Radio.vent.on 'global', 'contacts:list', =>
      Backbone.history.navigate 'contacts'
      @listContacts()
