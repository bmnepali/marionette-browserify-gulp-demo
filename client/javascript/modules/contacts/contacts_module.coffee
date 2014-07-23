Marionette = require 'backbone.marionette'
ContactsRouter = require './contacts_router'
ContactsController = require './contacts_controller'

module.exports = class TodoModule extends Marionette.Module
  initialize: ->
    @mainRegionId = 'main-region'

  onStart: ->
    @addRegion()
    @startMediator()

  addRegion: ->
    @app.addRegions mainRegion: '#' + @mainRegionId

  startMediator: ->
    @controller = new ContactsController mainRegion: @app.mainRegion
    router = new ContactsRouter {@controller}

