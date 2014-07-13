Marionette = require 'backbone.marionette'
LoadingView = require '../views/loading_view'
App = require '../app'

module.exports = class ContactController extends Marionette.Controller
  listContacts: (criterion) ->
    #loadingView = new LoadingView()
    #App.mainRegion.show(loadingView)
    console.log App
