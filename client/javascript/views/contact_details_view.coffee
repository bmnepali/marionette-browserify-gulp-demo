Marionette = require 'backbone.marionette'
# ContactsController = require '../controllers/contacts_controller'

module.exports = class ContactDetailsView extends Marionette.ItemView
  template: require './templates/contact_details'

  events:
    'click a.back': 'goBack'
    'click a.delete': 'deleteContact'

  goBack: (e) ->
    e.preventDefault()
    # ContactsController.home()
    window.contactsController.home()

  deleteContact: (e) ->
    e.preventDefault()
    console.log 'deleting contact'
    @collection.remove(@model)
    @model.destroy()
