Marionette = require 'backbone.marionette'
Radio = require '../../../radio'
Backbone = require 'backbone'

BookEntity = require '../entities/book'

module.exports = Marionette.Controller.extend
  initialize: ->
    BookEntity.initialize()
    @setHandlers()

  setHandlers: ->
    Radio.vent.on 'global', 'library:show', =>
      Backbone.history.navigate 'library'
      @listBooks()
