Marionette = require 'backbone.marionette'
ContactsRouter = require './contacts_router'
ContactsController = require './contacts_controller'
DialogRegion = require '../../common/dialog_region'

module.exports = class TodoModule extends Marionette.Module
  onStart: ->
    @addRegion()
    @startMediator()

  addRegion: ->
    @app.addRegions
      mainRegion: "#main-region"
      dialogRegion: DialogRegion.extend
        el: "#dialog-region"

  startMediator: ->
    @controller = new ContactsController
      mainRegion: @app.mainRegion
      dialogRegion: @app.dialogRegion
    router = new ContactsRouter {@controller}

