Marionette = require 'backbone.marionette'
Radio = require '../../../radio'

module.exports = Marionette.ItemView.extend
  onRender: ->
    self = @
    $spinner = self.$('#spinner')
    Radio.vent.on 'global', 'search:start', -> $spinner.toggleClass('hidden').fadeIn()
    Radio.vent.on 'global', 'search:stop', -> $spinner.toggleClass('hidden').fadeOut()

  template: require './templates/search_bar'

  events:
    'change #searchTerm': 'search'

  search: (e) ->
    e.preventDefault()
    searchTerm = @$('#searchTerm').val().trim()
    @trigger('books:search', searchTerm)
