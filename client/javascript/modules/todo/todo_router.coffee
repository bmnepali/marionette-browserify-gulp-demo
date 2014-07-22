Marionette = require 'backbone.marionette'

module.exports = Marionette.AppRouter.extend
  appRoutes:
    '*filter': 'filterItems'
