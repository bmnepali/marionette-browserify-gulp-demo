Backbone = require 'backbone'
Marionette = require 'backbone.marionette'

ContactManager = new Marionette.Application()

ContactManager.addRegions(
  headerRegion: '#header-region'
  mainRegion: '#main-region'
)

ContactManager.navigate = (router, options) ->
  options or (options = {})
  Backbone.history.navigate(router, options)

ContactManager.getCurrentRoute = ->
  Backbone.history.fragment

ContactManager.on('start', ->
  if Backbone.history
    Backbone.history.start()

    if ContactManager.getCurrentRoute() is ""
      ContactManager.trigger('contacts:list')

module.exports = ContactManager
