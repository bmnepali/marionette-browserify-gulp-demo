Marionette = require 'backbone.marionette'

module.exports = class ContactsRouter extends Marionette.AppRouter
  appRoutes:
    "contacts": "listContacts"
