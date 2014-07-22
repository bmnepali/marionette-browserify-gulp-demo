Backbone = require 'backbone'
Contact = require '../models/contact'

module.exports = class Contacts extends Backbone.Collection
  model: Contact
  url: 'http://localhost:3300/api/contacts'
