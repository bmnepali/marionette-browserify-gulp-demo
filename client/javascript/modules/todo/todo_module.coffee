Marionette = require 'backbone.marionette'
TodoRouter = require './todo_router'
TodoController = require './todo_controller'

module.exports = class TodoModule extends Marionette.Module
  onStart: ->
    @startMediator()

  onStop: ->
    @stopMediator()
    @removeRegion()

  startMediator: ->
    @controller = new TodoController
      mainRegion: @app.mainRegion
    router = new TodoRouter {@controller}

  stopMediator: ->
    @controller.stop()

  removeRegion: ->
    @app.removeRegion 'todoRegion'
