ContactControllerBase = require './controller_actions/base'
EditContact = require './controller_actions/edit_contact'
ShowContact = require './controller_actions/show_contact'
ListContacts = require './controller_actions/list_contacts'

module.exports = ContactControllerBase.extend
  editContact: EditContact
  showContact: ShowContact
  listContacts: ListContacts
