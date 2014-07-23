Marionette = require 'backbone.marionette'
TodosLayout = require './views/layout/layoutView'
TodosCollection = require './models/todos'

module.exports = Marionette.Controller.extend
  initialize: ->
    @todosCollection = new TodosCollection
    @todosLayout = new TodosLayout {@todosCollection}
    onSuccess = ( ->
      @options.todoRegion.show(@todosLayout)
    ).bind(@)
    @todosCollection.fetch(success: onSuccess)

  filterItems: (filter) ->
    filter = (filter and filter.trim() or 'all')
    @todosLayout.updateFilter(filter)
