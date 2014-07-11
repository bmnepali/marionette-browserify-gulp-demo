Marionette = require 'backbone.marionette'
ContactView = require './contact_view'

module.exports = class ContactsView extends Marionette.CollectionView
  initialize: ->
    @listenTo(@collection, 'change', @render)

  childView: ContactView
