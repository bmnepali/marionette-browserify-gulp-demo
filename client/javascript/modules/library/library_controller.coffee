Marionette = require 'backbone.marionette'
Radio = require '../../radio'
ListBooks = require './controller_actions/list_books'

module.exports = Marionette.Controller.extend
  initialize: ->
    @setHandlers()

  listBooks: ListBooks

  setHandlers: ->
    Radio.vent.on 'global', 'library:show', =>
      Backbone.history.navigate 'library'
      @listBooks()
