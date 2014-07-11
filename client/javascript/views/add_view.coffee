Marionette = require 'backbone.marionette'
Contacts = require '../collections/contacts'
# ContactsController = require '../controllers/contacts_controller'

module.exports = class AddView extends Marionette.ItemView
  template: require './templates/add'

  events:
    'click a.save-button': 'save'

  save: (e) ->
    window.cnt = Contacts
    e.preventDefault()
    newContact =
      name:
        first: @$el.find('#name_first').val()
        last: @$el.find('#name_last').val()
      email: @$el.find('#email').val()
      phone: @$el.find('#phone').val()
    @collection.create(newContact)
    console.log 'contact saved'
    # ContactsController.home()
    window.contactsController.home()
