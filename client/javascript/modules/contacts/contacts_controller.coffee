Marionette = require 'backbone.marionette'
ListContactsView = require './views/list/contacts_view'
ShowContactView = require './views/show/contact_view'
ContactEntity = require './entities/contact'
Radio = require '../../radio'

module.exports = Marionette.Controller.extend
  initialize: ->
    ContactEntity.initialize()

  showContact: (model) ->
    showContactView = new ShowContactView {model}
    @options.mainRegion.show(showContactView)

  listContacts: ->
    contacts = Radio.reqres.request 'global', "contact:entities"
    listContactsView = new ListContactsView collection: contacts
    listContactsView.on 'childview:contact:delete', (childView, model) ->
      # Since we're now inside the contacts view scope, we call @collection
      # instead of @contactsCollection.
      @collection.remove(model)

    listContactsView.on 'childview:contact:show', (childView, model) =>
      @showContact(model)

    @options.mainRegion.show(listContactsView)
