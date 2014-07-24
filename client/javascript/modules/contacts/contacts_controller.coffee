Marionette = require 'backbone.marionette'
App = require '../../initialize'
ContactsCollection = require './models/contacts'
ContactsView = require './views/contacts_view'

module.exports = Marionette.Controller.extend
  initialize: ->
    @contactsCollection = new ContactsCollection
    @contactsView = new ContactsView collection: @contactsCollection
    @startEventListeners()

  listContacts: ->
    if @contactsCollection.length is 0
      @contactsCollection = @initializeContacts()
      @contactsView.collection = @contactsCollection
    @options.mainRegion.show(@contactsView)

  startEventListeners: ->
    @contactsView.on 'childview:contact:delete', (childView, model) ->
      @collection.remove(model)

  initializeContacts: ->
    contacts = new ContactsCollection([
      {
        id: 1
        firstName: "Alice"
        lastName: "Arten"
        phoneNumber: "555-0184"
      }
      {
        id: 2
        firstName: "Bob"
        lastName: "Brigham"
        phoneNumber: "555-0163"
      }
      {
        id: 3
        firstName: "Charlie"
        lastName: "Campbell"
        phoneNumber: "555-0129"
      }
    ])
