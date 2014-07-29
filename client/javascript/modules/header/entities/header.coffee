Marionette = require 'backbone.marionette'
HeaderCollection = require '../collections/headers'
Radio = require '../../../radio'

headers = undefined

module.exports =
  initialize: ->
    @setHandlers()

  initializeHeaders: ->
    headers = new HeaderCollection([
      { name: "contacts", url: "contacts", navigationTrigger: "contacts:list" }
      { name: "about", url: "about", navigationTrigger: "about:show" }
      { name: "todo", url: "todo", navigationTrigger: "todo:show" }
    ])

  getHeaders: ->
    if headers is undefined
      @initializeHeaders()
    headers

  setHandlers: ->
    Radio.reqres.setHandler "global", "header:entities", =>
      @getHeaders()

