Marionette = require 'backbone.marionette'

module.exports = Marionette.ItemView.extend
  tagName: 'li'

  template: require '../templates/todo_item'

  ui:
    edit: '.edit'

  events:
    'click .destroy': 'destroy'
    'click .toggle': 'toggle'
    'dbclick label': 'onEditClick'
    'keydown @ui.edit': 'onEditKeypress'
    'focusout @ui.edit': 'onEditFocusout'

  modelEvents:
    'change': 'render'

  onRender: ->
    @$el.removeClass 'active completed'
    if @model.get 'completed'
      @$el.addClass 'completed'
    else
      @$el.addClass 'active'

  destroy: ->
    @model.destroy()

  toggle: ->
    @model.toggle().save()

  onEditClick: ->
    @$el.addClass 'editing'
    @ui.edit.focus()
    # taking the new val and replacing the old?
    @ui.edit.val(@ui.edit.val())

  onEditFocusout: ->
    todoText = @ui.text.val().trim()
    if todoText
      @model.set('title', todoText).save()
      @$el.removeClass 'editing'
    else
      @destroy()

  onEditKeypress: (e) ->
    ENTER_KEY = 13
    ESC_KEY = 27
    if e.which is ENTER_KEY
      @onEditFocusout

    if e.which is ESC_KEY
      @ui.edit.val(@model.get('title'))
      @$el.removeClass('editing')


