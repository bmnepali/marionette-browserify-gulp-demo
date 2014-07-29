Backbone = require 'backbone'
Marionette = require 'backbone.marionette'
Radio = require './radio'

ContactsModule = require './modules/contacts/contacts_module'
AboutModule = require './modules/about/about_module'
HeaderModule = require './modules/header/header_module'
TodoModule = require './modules/todo/todo_module'
DialogRegion = require './common/dialog_region'

App = new Marionette.Application()

App.getCurrentRoute = ->
  Backbone.history.fragment

App.addRegions
  headerRegion: "#header-region"
  mainRegion: "#main-region"
  dialogRegion: DialogRegion.extend
    el: "#dialog-region"

App.on 'start', ->
  if Backbone.history
    Backbone.history.start()

    if @getCurrentRoute() is ""
      Radio.vent.trigger 'global', 'contacts:list'

App.module 'header', HeaderModule
App.module 'contacts', ContactsModule
App.module 'about', AboutModule
App.module 'todo', TodoModule

module.exports = App
