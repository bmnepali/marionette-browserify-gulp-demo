Backbone = require 'backbone'
Marionette = require 'backbone.marionette'
ContactsModule = require './modules/contacts/contacts_module'
Radio = require './radio'

App = new Marionette.Application()

App.getCurrentRoute = ->
  Backbone.history.fragment

App.on 'start', ->
  if Backbone.history
    Backbone.history.start()

    if @getCurrentRoute() is ""
      Radio.vent.trigger 'global', 'contacts:list'

App.module 'contacts', ContactsModule

module.exports = App

#############################################
# Todo = require './modules/todo/todo_module'
# App.module 'todo', Todo
