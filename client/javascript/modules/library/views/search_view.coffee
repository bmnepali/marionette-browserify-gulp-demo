Marionette = require 'backbone.marionette'

module.exports = Marionette.ItemView.extend
  template: require './templates/search_bar'

  events:
    'change #searchTerm': 'search'

  search: ->
    searchTerm = @$('#searchTerm').val().trim()
    console.log searchTerm

