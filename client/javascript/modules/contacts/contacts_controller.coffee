Marionette = require 'backbone.marionette'
LoadingView = require '../views/loading_view'
App = require '../app'

class ContactsController extends Marionette.Controller
  listContacts: (criterion) ->
    console.log App
    loadingView = new LoadingView()
    App.mainRegion.show(loadingView)

module.exports = ContactsController
