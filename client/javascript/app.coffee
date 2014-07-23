Backbone = require 'backbone'
Marionette = require 'backbone.marionette'
ContactsModule = require './modules/contacts/contacts_module'

App = new Marionette.Application()

App.navigate = (router, options) ->
  options or (options = {})
  Backbone.history.navigate(router, options)

App.getCurrentRoute = ->
  Backbone.history.fragment

App.on 'start', ->
  if Backbone.history
    Backbone.history.start()

App.module 'contacts', ContactsModule

module.exports = App

###########################
# Todo = require './modules/todo/todo_module'
# App.module 'todo', Todo
