Marionette = require 'backbone.marionette'

module.exports = class ContactsRouter extends Marionette.AppRouter
  appRoutes:
    "contacts(/filter/criterion::criterion)": "listContacts"
