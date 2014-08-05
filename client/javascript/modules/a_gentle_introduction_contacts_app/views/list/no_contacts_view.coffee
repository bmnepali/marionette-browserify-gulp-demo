Marionette = require 'backbone.marionette'

module.exports = Marionette.ItemView.extend
  template: require '../templates/no_contacts'
  tagName: 'tr'
  className: 'alert'
