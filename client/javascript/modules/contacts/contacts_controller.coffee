Marionette = require 'backbone.marionette'
ListContactsView = require './views/list/contacts_view'
ShowContactView = require './views/show/contact_view'
MissingContactView = require './views/show/missing_contact_view'
ContactEntity = require './entities/contact'
Radio = require '../../radio'
Backbone = require 'backbone'

module.exports = Marionette.Controller.extend
  initialize: ->
    ContactEntity.initialize()
    @setHandlers()

  showContact: (id) ->
    contacts = Radio.reqres.request 'global', "contact:entities"
    Backbone.history.navigate "contacts/#{id}"
    model = contacts.get(id)
    if model is undefined
      contactView = new MissingContactView()
    else
      contactView = new ShowContactView {model}

    @options.mainRegion.show(contactView)

  listContacts: ->
    contacts = Radio.reqres.request 'global', "contact:entities"
    listContactsView = new ListContactsView collection: contacts
    listContactsView.on 'childview:contact:delete', (childView, model) ->
      # Since we're now inside the contacts view scope, we call @collection
      # instead of @contactsCollection.
      model.destroy()

    listContactsView.on 'childview:contact:show', (childView, model) =>
      @showContact(model.get('id'))

    @options.mainRegion.show(listContactsView)

  setHandlers: ->
    Radio.vent.on 'global', 'contacts:list', =>
      Backbone.history.navigate 'contacts'
      @listContacts()
