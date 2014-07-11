Marionette = require 'backbone.marionette'
# ContactsController = require '../controllers/contacts_controller'

module.exports = class ContactView extends Marionette.ItemView
  template: require './templates/contact'

  initialize: ->
    @listenTo(@model, 'change', @render)

  events:
    'click': 'showDetails'

  showDetails: ->
    # ContactsController.details(@model.id)
    window.contactsController.details(@model.id)

