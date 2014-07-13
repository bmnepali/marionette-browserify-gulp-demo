Backbone = require 'backbone'
Marionette = require 'backbone.marionette'
ContactsRouter = require './routers/contacts_router'
ContactsController = require './controllers/contacts_controller'

App = new Marionette.Application()

App.addRegions(
  headerRegion: '#header-region'
  mainRegion: '#main-region'
)

App.navigate = (router, options) ->
  options or (options = {})
  Backbone.history.navigate(router, options)

App.getCurrentRoute = ->
  Backbone.history.fragment

App.addInitializer( ->
  App.contactsController = new ContactsController()
  App.contactsRouter = new ContactsRouter(
    controller: App.contactsController
  )
)

App.on('start', ->
  if Backbone.history
    Backbone.history.start()

    if App.getCurrentRoute() is ""
      App.contactsController.listContacts()
)

module.exports = App
