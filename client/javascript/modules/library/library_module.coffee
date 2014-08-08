Marionette = require 'backbone.marionette'
LibraryRouter = require './library_router'
LibraryController = require './library_controller'

module.exports = class LibraryModule extends Marionette.Module
  onStart: ->
    @startMediator()

  onStop: ->
    @stopMediator()
    @removeRegion()

  startMediator: ->
    @controller = new LibraryController
      mainRegion: @app.mainRegion
    router = new LibraryRouter {@controller}

  stopMediator: ->
    @controller.stop()

  removeRegion: ->
    @app.removeRegion 'mainRegion'
