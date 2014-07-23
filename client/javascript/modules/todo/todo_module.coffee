Marionette = require 'backbone.marionette'
TodoRouter = require './todo_router'
TodoController = require './todo_controller'

module.exports = class TodoModule extends Marionette.Module
  initialize: ->
    @regionId = 'todo-module-region'

  onStart: ->
    @createContainer()
    @addRegion()
    @startMediator()
    @listCollection

  onStop: ->
    @stopMediator()
    @removeRegion()
    @destroyContainer()

  createContainer: ->
    node = document.createElement 'div'
    node.id = @regionId
    document.body.appendChild node

  addRegion: ->
    @app.addRegions todoRegion: '#' + @regionId

  startMediator: ->
    @controller = new TodoController todoRegion: @app.todoRegion
    router = new TodoRouter {@controller}

  stopMediator: ->
    @controller.stop()

  removeRegion: ->
    @app.removeRegion 'todoRegion'

  destroyContainer: ->
    node = document.getElementById @regionId
    node?.parentElement.removeChild node
