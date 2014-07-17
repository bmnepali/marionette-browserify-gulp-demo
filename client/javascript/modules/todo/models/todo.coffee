Backbone = require 'backbone'

module.exports = class Todo extends Backbone.Model
  defaults:
    title: ''
    completed: false
    created: 0

  initialize: ->
    @set 'created', Date.now() if @isNew()

  toggle: ->
    @set 'completed', !@isCompleted()

  isCompleted: ->
    @get 'completed'

