Marionette = require 'backbone.marionette'
ContactsCollection = require '../collections/contacts'
ContactModel = require '../models/contact'
Radio = require '../../../radio'

contacts = 'undefined'

module.exports =
  initialize: ->
    # @setStorage()
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
    contacts.forEach (contact) ->
      contact.save()
    contacts

  getContactEntities: ->
    contacts = new ContactsCollection()
    contacts.fetch()
    if contacts.length is 0
      @initializeContacts()
    contacts

  getContactEntity: (id) ->
    contact = new ContactModel {id}
    contact.fetch()
    contacts

  setHandlers: ->
    Radio.reqres.setHandler "global", "contact:entities", =>
      @getContactEntities()
    Radio.reqres.setHandler "global", "contact:entity", (id) =>
      @getContactEntity(id)

