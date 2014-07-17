Backbone = require 'backbone'
localStorage = require 'backbone.localstorage'
Todo = require './todo'

module.exports = class Todos extends Backbone.Collection
  model: Todo

  localStorage: new localStorage('todos-module')

  getCompleted: ->
    @filter(@isCompleted)

  getActive: ->
    @reject(@isCompleted)

  comparator: (todo) ->
    todo.get('created')

  isCompleted: (todo) ->
    todo.isCompleted()
