Marionette = require 'backbone.marionette'
ContactsCollection = require '../collections/contacts'
ContactModel = require '../models/contact'
Radio = require '../../../radio'
$ = require 'jquery'

contacts = 'undefined'

module.exports =
  initialize: ->
    @setHandlers()

  getContactEntities: ->
    contacts = new ContactsCollection()
    defer = $.Deferred()

    contacts.fetch
      success: (data) ->
        defer.resolve(data)

    defer.promise()

  getContactEntity: (id) ->
    contact = new ContactModel {id}
    defer = $.Deferred()

    contact.fetch
      success: (data) ->
        defer.resolve data
      error: (data) ->
        defer.resolve 'undefined'

    defer.promise()

  setHandlers: ->
    Radio.reqres.setHandler "global", "contact:entities", =>
      @getContactEntities()

    Radio.reqres.setHandler "global", "contact:entity", (id) =>
      @getContactEntity(id)

