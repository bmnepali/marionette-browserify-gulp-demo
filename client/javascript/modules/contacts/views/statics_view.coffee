Marionette = require 'backbone.marionette'
StaticView = require './static_view'

module.exports = Marionette.Collection.extend(
  tagName: 'ul'
  childView: StaticView
)
