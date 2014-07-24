Marionette = require 'backbone.marionette'

module.exports = Marionette.ItemView.extend
  tagName: 'tr'
  template: require '../templates/list_contact'

  events:
    'click': 'highlightName'
    'click td a.js-show': 'showClicked'
    'click button.js-delete': 'deleteClicked'

  highlightName: (e) ->
    @$el.toggleClass('warning')

  showClicked: (e) ->
    e.preventDefault()
    e.stopPropagation()
    @trigger('contact:show', @model)

  deleteClicked: (e) ->
    e.stopPropagation()
    @trigger('contact:delete', @model)

  remove: ->
    self = @
    @$el.fadeOut ->
      Marionette.ItemView.prototype.remove.call(self)

