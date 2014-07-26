Marionette = require 'backbone.marionette'
ContactsRouter = require './contacts_router'
ContactsController = require './contacts_controller'

module.exports = class TodoModule extends Marionette.Module
  onStart: ->
    @addRegion()
    @startMediator()

  addRegion: ->
    @app.addRegions
      mainRegion: "#main-region"
      dialogRegion: "#dialog-region"

  startMediator: ->
    @controller = new ContactsController
      mainRegion: @app.mainRegion
      dialogRegion: @app.dialogRegion
    router = new ContactsRouter {@controller}

