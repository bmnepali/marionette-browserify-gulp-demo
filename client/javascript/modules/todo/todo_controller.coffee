Marionette = require 'backbone.marionette'
TodoLayout = require './views/layout/layout'
TodosCollection = require './models/todos'


module.exports = class TodoController extends Marionette.Controller
  onStart: ->
    @todosCollection = new TodosCollection()
    @todosLayout = new TodoLayout {@todosCollection}

    onSuccess = ( ->
      @options.todoRegion.show(@todosLayout)
    ).bind(@)
    @todosCollection.fetch(success: onSuccess)

  filterItems: (filter) ->
    filter = filter and filter.trim() or 'all
    @todosLayout.updateFilter(filter)
