Backbone = require 'backbone'

module.exports = class Contact extends Backbone.Model
  url: 'http://localhost:3300/api/contacts'
  idAttribute: '_id'
