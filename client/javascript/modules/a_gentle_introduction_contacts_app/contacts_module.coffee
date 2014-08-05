Marionette = require 'backbone.marionette'
ContactsRouter = require './contacts_router'
ContactsController = require './contacts_controller'

module.exports = class ContactsModule extends Marionette.Module
  onStart: ->
    @startMediator()

  startMediator: ->
    @controller = new ContactsController
      mainRegion: @app.mainRegion
      dialogRegion: @app.dialogRegion
    router = new ContactsRouter {@controller}

