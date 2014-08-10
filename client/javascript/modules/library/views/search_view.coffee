Marionette = require 'backbone.marionette'
Radio = require '../../../radio'

module.exports = Marionette.ItemView.extend
  template: require './templates/search_bar'

  events:
    'change #searchTerm': 'search'

  search: ->
    searchTerm = @$('#searchTerm').val().trim()
    console.log searchTerm

  search: (e) ->
    e.preventDefault()
    searchTerm = @$('#searchTerm').val().trim()
    @trigger('books:search', searchTerm)
