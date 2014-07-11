Marionette = require 'backbone.marionette'

module.exports = class Router extends Marionette.AppRouter
  appRoutes:
    'home' : 'home'
    'details/:id' : 'details'
    'add' : 'add'
