Marionette = require 'backbone.marionette'

module.exports = Marionette.ItemView.extend(
  tagName: 'tr'
  template: require './templates/contact'
)