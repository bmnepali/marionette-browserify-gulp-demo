Marionette = require 'backbone.marionette'
LoadingView = require '../views/loading_view'
App = require '../app'
lala = require './../app'
# yo future dave: it's a loading issue ... or i'm 75% certain something to do with dependency loading / cicular depenency... don't stress about it too much. Your goal tommoroow is to first get the tests suite to work then figure out what is wrong with loading app in the controller file ... maybe try look at raw input ??

module.exports = class ContactController extends Marionette.Controller
  listContacts: (criterion) ->
    #loadingView = new LoadingView()
    #App.mainRegion.show(loadingView)
    console.log lala
