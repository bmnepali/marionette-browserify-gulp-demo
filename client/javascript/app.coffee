Backbone = require 'backbone'
Marionette = require 'backbone.marionette'
Todo = require './modules/todo/todo_module'

App = new Marionette.Application()

# App.addRegions(
#   headerRegion: '#header-region'
#   mainRegion: '#main-region'
# )

App.navigate = (router, options) ->
  options or (options = {})
  Backbone.history.navigate(router, options)

App.getCurrentRoute = ->
  Backbone.history.fragment

# App.addInitializer( ->
# )

App.on('start', ->
  if Backbone.history
    Backbone.history.start()
)

App.module 'todo', Todo

module.exports = App
