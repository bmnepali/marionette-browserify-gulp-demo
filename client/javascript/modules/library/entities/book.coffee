Marionette = require 'backbone.marionette'
Radio = require '../../../radio'

books = 'undefined'

module.exports =
  initialize: ->
    @setHandlers()

  setHandlers: ->
    Radio.reqres.setHandler "global", "books:search", (options) =>
      @searchBooks(options)
