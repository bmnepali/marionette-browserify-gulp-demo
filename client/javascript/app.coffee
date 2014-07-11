Backbone = require 'backbone'
Marionette = require 'backbone.marionette'

ContactManager = new Marionette.Application()

ContactManager.addRegions(
  headerRegion: '#header-region'
  mainRegion: '#main-region'
)

module.exports = ContactManager
