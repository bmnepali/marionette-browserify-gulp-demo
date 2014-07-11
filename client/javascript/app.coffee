Backbone = require 'backbone'
Marionette = require 'backbone.marionette'
ContactsController = require './controllers/contacts_controller'
Router = require './router'

App = new Marionette.Application()

App.on 'before:start', (options) ->
  if Backbone.history
    @controller = ContactsController
    @router = new Router {@controller}
    console.log 'App: Backbone history starting!'
    Backbone.history.start()
    window.contactsController = @controller

module.exports = App
