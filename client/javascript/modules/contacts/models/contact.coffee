Backbone = require 'backbone'
localStorage = require 'backbone.localstorage'

module.exports = Backbone.Model.extend
  urlRoot: 'contacts'
  localStorage: new localStorage('contacts-module')
