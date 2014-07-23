Marionette = require 'backbone.marionette'
ContactView = require './contact_view'

module.exports = Marionette.CompositeView.extend
  tagName: 'table'
  className: 'table table-hover'
  template: require './templates/contacts_table'
  childView: ContactView
  childViewContainer: 'tbody'
