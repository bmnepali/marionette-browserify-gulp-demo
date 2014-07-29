Backbone = require 'backbone'
Marionette = require 'backbone.marionette'
Radio = require './radio'

ContactsModule = require './modules/contacts/contacts_module'
AboutModule = require './modules/about/about_module'

App = new Marionette.Application()

App.getCurrentRoute = ->
  Backbone.history.fragment

App.on 'start', ->
  if Backbone.history
    Backbone.history.start()

    if @getCurrentRoute() is ""
      Radio.vent.trigger 'global', 'contacts:list'

App.module 'contacts', ContactsModule
App.module 'about', AboutModule

module.exports = App

#############################################
# Todo = require './modules/todo/todo_module'
# App.module 'todo', Todo
