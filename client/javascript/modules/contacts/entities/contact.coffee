Marionette = require 'backbone.marionette'
ContactsCollection = require '../collections/contacts'
Radio = require '../../../radio'

contacts = 'undefined'

module.exports =
  initialize: ->
    @setHandlers()

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

  getContactEntities: ->
    if contacts is 'undefined'
      @initializeContacts()
    contacts

  setHandlers: ->
    Radio.reqres.setHandler "global", "contact:entities", =>
      @getContactEntities()

