Backbone = require 'backbone'
Contact = require '../models/contact'
localStorage = require 'backbone.localstorage'

module.exports = Backbone.Collection.extend
  url: 'contacts'
  model: Contact
  comparator: "firstName"
  localStorage: new localStorage('contacts-module')
