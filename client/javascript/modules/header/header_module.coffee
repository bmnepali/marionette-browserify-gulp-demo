Marionette = require 'backbone.marionette'
HeaderController = require './header_controller'

module.exports = class HeaderModule extends Marionette.Module
  onStart: ->
    @startMediator()
    @controller.listHeader()

  startMediator: ->
    @controller = new HeaderController
      headerRegion: @app.headerRegion

