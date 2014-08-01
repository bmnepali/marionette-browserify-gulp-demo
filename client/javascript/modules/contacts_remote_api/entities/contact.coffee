Marionette = require 'backbone.marionette'
ContactsCollection = require '../collections/contacts'
ContactModel = require '../models/contact'
Radio = require '../../../radio'
$ = require 'jquery'
_ = require 'underscore'

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

  getContactEntity: (id, options) ->
    contact = new ContactModel {id}
    defer = $.Deferred()

    options or (options = {})
    defer.then(options.success, options.error)

    response = contact.fetch(_.omit(options, 'success', 'error'))

    response.done ->
      defer.resolveWith response, [contact]
      console.log "success: " + response.status

    response.fail ->
      defer.rejectWith response, arguments
      console.log "fail: " + response.status

    defer.promise()

  setHandlers: ->
    Radio.reqres.setHandler "global", "contact:entities", =>
      @getContactEntities()

    Radio.reqres.setHandler "global", "contact:entity", (id, options) =>
      @getContactEntity(id, options)

