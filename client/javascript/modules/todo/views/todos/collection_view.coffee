Marionette = require 'backbone.marionette'
TodoItemView = require './item_view'

module.exports = class TodoCollectionView extends Marionette.CompositeView
  template: require '../templates/todo_collection'

  itemView: TodoItemView

  itemViewContainer: '#todo-list'

  ui:
    toggle: '#toggle-all'

  events:
    'click @ui.toggle': 'onToggleAllClick'

  collectionEvents:
    'all': 'update'

  # use onShow rather than onRender because DOM is not ready
  # and this.$el find or parent will return nothing
  onShow: ->
    @update()

  update: ->
    reduceCompleted = (left, right) ->
      left and right.get('completed')

    allCompleted = @collection.reduce(reduceCompleted, true)
    @ui.toggle.prop('checked', allCompleted)
    # If the collection contains elements, return true
    @$el.parent().toggle(!!@collection.length)

  onToggleAllClick: (e) ->
    isChecked = e.currentTarget.checked
    @collection.each( (todo) ->
      todo.save(
        'completed': isChecked
      )
    )
