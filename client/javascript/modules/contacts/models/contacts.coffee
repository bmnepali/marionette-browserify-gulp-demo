Backbone = require 'backbone'
Contact = require '../models/contact'

module.exports = Backbone.Collection.extend
  model: Contact
  comparator: "firstName"
