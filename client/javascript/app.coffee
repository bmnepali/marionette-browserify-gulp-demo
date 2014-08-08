Backbone = require 'backbone'
Marionette = require 'backbone.marionette'
Radio = require './radio'
require 'backbone.paginator'
require 'backgrid-paginator'
require 'backgrid-filter'
require 'lunr'
require './common/hbs_helpers'

GentleContactsModule = require './modules/a_gentle_introduction_contacts_app/contacts_module'
SeriousContactsModule = require './modules/a_serious_progression_contacts_app/contacts_module'
ContactsRemoteApi = require './modules/contacts_app_using_remote_api/contacts_module'
AboutModule = require './modules/about/about_module'
HeaderModule = require './modules/header/header_module'
TodoModule = require './modules/todo/todo_module'
LibraryModule = require './modules/library/library_module'
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
# App.module 'contacts', GentleContactsModule
#App.module 'seriousContactsModule', SeriousContactsModule
App.module 'contacts', ContactsRemoteApi
App.module 'about', AboutModule
App.module 'todo', TodoModule
App.module 'library', LibraryModule

module.exports = App
