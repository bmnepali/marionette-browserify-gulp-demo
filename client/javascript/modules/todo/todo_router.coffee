Marionette = require 'backbone.marionette'

module.exports = Marionette.AppRouter.extend
  appRoutes:
    'todo/:filter': 'filterItems'
