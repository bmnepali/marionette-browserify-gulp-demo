Marionette = require 'backbone.marionette'

module.exports = Marionette.ItemView.extend
  tagName: 'tr'
  template: require '../templates/list_contact'

  events:
    'click': 'highlightName'
    'click td button.js-show': 'showClicked'
    'click td button.js-edit': 'editClicked'
    'click button.js-delete': 'deleteClicked'

  highlightName: (e) ->
    @$el.toggleClass('warning')

  flash: (cssClass) ->
    $view = @$el
    $view.hide().toggleClass(cssClass).fadeIn(800, ->
      setTimeout((->
        $view.toggleClass(cssClass)
      ), 500)
    )

  showClicked: (e) ->
    e.preventDefault()
    e.stopPropagation()
    @trigger('contact:show', @model)

  editClicked: (e) ->
    e.preventDefault()
    e.stopPropagation()
    @trigger('contact:edit', @model)

  deleteClicked: (e) ->
    e.stopPropagation()
    @trigger('contact:delete', @model)

  remove: ->
    self = @
    @$el.fadeOut ->
      Marionette.ItemView.prototype.remove.call(self)

