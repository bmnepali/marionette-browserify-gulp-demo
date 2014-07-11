Marionette = require 'backbone.marionette'
Contacts = require '../collections/contacts'
ContactsController = require '../controllers/contacts_controller'

module.exports = class AddView extends Marionette.ItemView
  template: require './templates/add'

  events:
    'click a.save-button': 'save'

  save: (e) ->
    e.preventDefault()
    newContact =
      name:
        first: @$el.find('#name_first').val()
        last: @$el.find('#name_last').val()
      email: @$el.find('#email').val()
      phone: @$el.find('#phone').val()

    Contacts.create(newContact)

    ContactsController.home()
