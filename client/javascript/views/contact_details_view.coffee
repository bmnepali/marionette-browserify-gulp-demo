Marionette = require 'backbone.marionette'
ContactsController = require '../controllers/contacts_controller'
Contacts = require '../collections/contacts'

module.exports = class ContactDetailsView extends Marionette.ItemView
  template: require './templates/contact_details'

  events:
    'click a.back': 'goBack'
    'click a.delete': 'deleteContact'

  goBack: (e) ->
    e.preventDefault()
    console.log 'deleting contact'
    Contacts.remove(@model)

    @model.destroy()

    ContactsController.home()
