Backbone = require 'backbone'
Contact = require '../models/contact'

module.exports = Backbone.Collection.extend
  url: 'contacts'
  model: Contact
  comparator: "firstName"
