Marionette = require 'backbone.marionette'

module.exports = Marionette.ItemView.extend
  tagName: 'tr'
  template: require './templates/contact'

  events:
    'click': 'highlightName'
    'click button.js-delete': 'deleteClicked'

  highlightName: (e) ->
    @$el.toggleClass('warning')


  deleteClicked: (e) ->
    e.stopPropagation()
    @trigger('contact:delete', @model)

  remove: ->
    self = @
    @$el.fadeOut ->
      Marionette.ItemView.prototype.remove.call(self)

