Marionette = require 'backbone.marionette'
TodosLayout = require './views/layout/layoutView'
TodosCollection = require './models/todos'
Radio = require '../../radio'

module.exports = Marionette.Controller.extend
  initialize: ->
    @setHandlers()
    @showTodo()

  showTodo: ->
    @todosCollection = new TodosCollection
    @todosLayout = new TodosLayout {@todosCollection}
    onSuccess = ( ->
      @options.mainRegion.show(@todosLayout)
    ).bind(@)
    @todosCollection.fetch(success: onSuccess)

  filterItems: (filter) ->
    filter = (filter and filter.trim() or 'all')
    @todosLayout.updateFilter(filter)

  setHandlers: ->
    Radio.vent.on 'global', 'todo:show', =>
      Backbone.history.navigate 'todo'
      @showTodo()
