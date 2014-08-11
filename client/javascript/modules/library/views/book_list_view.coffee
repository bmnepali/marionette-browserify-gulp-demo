Marionette = require 'backbone.marionette'
BookView = require './book_view'
Radio = require '../../../radio'

module.exports = Marionette.CompositeView.extend
  id: 'bookList'
  template: require './templates/book_list'
  childView: BookView

  initialize: ->
    @setHandlers()

  showMessage: (message) ->
    @$('.books').html('<h1 class="alert-danger">' + message + '</h1>')

  removeMessage: ->
    @$('.books').empty()

  setHandlers: ->
    Radio.vent.on 'global', 'search:noSearchTerm', =>
      @showMessage("Please enter a search term.")

    Radio.vent.on 'global', 'search:noResults', =>
      @showMessage("No books found.")

    Radio.vent.on 'global', 'search:removeMessage', =>
      @removeMessage()



