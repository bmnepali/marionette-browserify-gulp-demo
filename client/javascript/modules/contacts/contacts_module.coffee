Marionette = require 'backbone.marionette'
ContactsRouter = require './contacts_router'
ContactsController = require './contacts_controller'

module.exports = class ContactsModule extends Marionette.Module
  initialize: ->
    @mainRegionId = 'main-region'

  onStart: ->
    # @createContainer()
    @addRegion()
    @startMediator()

  # createContainer: ->
  #   node = document.createElement 'div'
  #   node.id = @contactsRegionId
  #   document.body.appendChild node

  addRegion: ->
    @app.addRegions mainRegion: '#' + @mainRegionId

  startMediator: ->
    @controller = new ContactsController mainRegion: @app.mainRegion
    router = new ContactsRouter {@controller}

  # onStop: ->
  #   @stopMediator()
  #   @removeRegion()
  #   @destroyContainer()

  # stopMediator: ->
  #   @controller.stop()

  # removeRegion: ->
  #   @app.removeRegion 'contactsRegion'

  # destroyContainer: ->
  #   node = document.getElementById this.contactsRegionId
  #   node?.parentElement.removeChild node
