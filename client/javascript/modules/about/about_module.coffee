Marionette = require 'backbone.marionette'
AboutRouter = require './about_router'
AboutController = require './about_controller'

module.exports = class AboutModule extends Marionette.Module
  onStart: ->
    @startMediator()

  startMediator: ->
    @controller = new AboutController
      mainRegion: @app.mainRegion
    router = new AboutRouter {@controller}

