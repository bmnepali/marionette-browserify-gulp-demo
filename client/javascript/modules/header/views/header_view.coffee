Marionette = require 'backbone.marionette'

module.exports = Marionette.ItemView.extend
  tagName: 'li'
  template: require './templates/header_link'

  events:
    'click a': 'navigate'

  navigate: (e) ->
    e.preventDefault()
    @trigger 'navigate', @model

  onRender: ->
    if @model.selected
      @$el.addClass "active"

