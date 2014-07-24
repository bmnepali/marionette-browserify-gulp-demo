Marionette = require 'backbone.marionette'
ContactsView = require './views/contacts_view'
ContactEntity = require './entities/contact'
Radio = require '../../radio'

module.exports = Marionette.Controller.extend
  initialize: ->
    ContactEntity.initialize()

  listContacts: ->
    contacts = Radio.reqres.request 'global', "contact:entities"
    contactsView = new ContactsView collection: contacts
    contactsView.on 'childview:contact:delete', (childView, model) ->
      # Since we're now inside the contacts view scope, we call @collection
      # instead of @contactsCollection.
      @collection.remove(model)

    @options.mainRegion.show(contactsView)
