Marionette = require 'backbone.marionette'

module.exports = class FooterView extends Marionette.ItemView
  template: require '../templates/footer'

  ui:
    filters: '#filters a'

  events:
    'click #clear-completed': 'onClearClick'

  collectionEvents:
    'all': 'render'

  templateHelpers:
    activeCountLabel: (@activeCount is 1 ? 'item' : 'items') + 'left'

  # Customize serialization of collection model data
  # for the view.
  serializeData: ->
    active = @collection.getActive().length
    total = @collection.length

    activeCount: active
    totalCount: total
    completedCount: total - active

  update: ->
    # what does 'el.parent' resolve to?
    @$el.parent().toggle(@collection.length > 0)

  onRender: ->
    @update()

  onShow: ->
    @update()

  onClearClick: ->
    completed = @collection.getCompleted()
    completed.forEach( (todo) ->
      todo.destory()
    )

