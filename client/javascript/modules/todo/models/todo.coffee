Backbone = require 'backbone'
localStorage = require 'backbone.localstorage'

module.exports = Backbone.Model.extend
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

