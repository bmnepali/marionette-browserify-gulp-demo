Backbone = require 'backbone'
Marionette = require 'backbone.marionette'
require 'jqueryui'
$ = require 'jquery'

console.log $.ui

ContactManager = new Marionette.Application()

ContactManager.addRegions(
  headerRegion: '#header-region'
  mainRegion: '#main-region'
)

module.exports = ContactManager
