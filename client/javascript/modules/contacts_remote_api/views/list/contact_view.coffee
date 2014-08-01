Marionette = require 'backbone.marionette'

module.exports = Marionette.ItemView.extend
  tagName: 'tr'
  template: require '../templates/list_contact'

  events:
    'click': 'highlightName'

  triggers:
    'click td button.js-show': 'contact:show'
    'click button.js-edit': 'contact:edit'
    'click button.js-delete': 'contact:delete'

  highlightName: (e) ->
    @$el.toggleClass('warning')

  flash: (cssClass) ->
    $view = @$el
    $view.hide().toggleClass(cssClass).fadeIn(800, ->
      setTimeout((->
        $view.toggleClass(cssClass)
      ), 500)
    )

  modelEvents:
    "change": "render"

  remove: ->
    self = @
    @$el.fadeOut ->
      Marionette.ItemView.prototype.remove.call(self)

