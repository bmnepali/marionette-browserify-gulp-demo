Marionette = require 'backbone.marionette'
HeaderCollection = require '../collections/headers'
Radio = require '../../../radio'

headers = undefined

module.exports =
  initialize: ->
    @setHandlers()

  initializeHeaders: ->
    headers = new HeaderCollection([
      # { name: "A Gentle Introduction App", url: "contacts", navigationTrigger: "contacts:list" }
      # { name: "A Serious Progression App", url: "contacts", navigationTrigger: "contacts:list" }
      # { name: "Contact App w/ Backgrid", url: "contacts", navigationTrigger: "contacts:list" }
      { name: "Contact", url: "contacts", navigationTrigger: "contacts:list" }
      { name: "About", url: "about", navigationTrigger: "about:show" }
      { name: "Todo", url: "todo", navigationTrigger: "todo:show" }
      { name: "Library", url: "library", navigationTrigger: "library:show" }
    ])

  getHeaders: ->
    if headers is undefined
      @initializeHeaders()
    headers

  setHandlers: ->
    Radio.reqres.setHandler "global", "header:entities", =>
      @getHeaders()

