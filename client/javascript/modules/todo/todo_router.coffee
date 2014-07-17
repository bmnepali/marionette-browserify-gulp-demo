Marionette = require 'backbone.marionette'

module.exports = class TodoRouter extends Marionette.AppRouter
  appRoutes:
    '*filter': 'filterItems'
