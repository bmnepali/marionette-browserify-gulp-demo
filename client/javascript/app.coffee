Backbone = require 'backbone'
Marionette = require 'backbone.marionette'
ContactsController = require './controllers/contacts_controller'
Router = require './router'
ContactModel = require './models/contact'
ContactsCollection = require './collections/contacts'

App = new Marionette.Application()

App.on 'before:start', (options) ->
  console.log 'App Initializing!'
  if Backbone.history
    @controller = new ContactsController()
    @router = new Router {@controller}
    console.log 'App: Backbone history starting!'
    Backbone.history.start()
    window.ctrl = @controller

module.exports = App
