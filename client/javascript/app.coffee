Backbone = require 'backbone'
Marionette = require 'backbone.marionette'

App = new Marionette.Application()

App.on 'before:start', (options) ->
  console.log 'Executing things before start'

App.vent.bind 'app:start', (options) ->
  if Backbone.history
    console.log 'App: Backbone history starting'
    Backbone.history.start()

module.exports = App
