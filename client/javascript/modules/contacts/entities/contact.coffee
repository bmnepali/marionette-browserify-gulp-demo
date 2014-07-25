Marionette = require 'backbone.marionette'
ContactsCollection = require '../collections/contacts'
ContactModel = require '../models/contact'
Radio = require '../../../radio'
$ = require 'jquery'

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

    contacts.forEach (contact) ->
      contact.save()

    contacts.models

  getContactEntities: ->
    contacts = new ContactsCollection()
    defer = $.Deferred()

    contacts.fetch
      success: (data) ->
        defer.resolve(data)

    promise = defer.promise()

    $.when(promise).done (contacts) =>
      if contacts.length is 0
        models = @initializeContacts()
        contacts.reset(models)

    promise

  getContactEntity: (id) ->
    contact = new ContactModel {id}
    defer = $.Deferred()

    setTimeout((->
      contact.fetch
        success: (data) ->
          defer.resolve data
        error: (data) ->
          defer.resolve 'undefined'
    ), 500)

    defer.promise()

  setHandlers: ->
    Radio.reqres.setHandler "global", "contact:entities", =>
      @getContactEntities()

    Radio.reqres.setHandler "global", "contact:entity", (id) =>
      @getContactEntity(id)

