Marionette = require 'backbone.marionette'

module.exports = Marionette.AppRouter.extend
  appRoutes:
    "contacts(/filter/criterion::criterion)": "listContacts"
