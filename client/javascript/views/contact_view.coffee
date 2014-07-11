Marionette = require 'backbone.marionette'

module.exports = class ContactView extends Marionette.ItemView
  template: require './templates/contact'

  initialize: ->
    @listenTo(@model, 'change', @render)

  events:
    'click': 'showDetails'

  showDetails: ->
    ContactsController.details(@model.id)
