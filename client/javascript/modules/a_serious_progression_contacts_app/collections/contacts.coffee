Backbone = require 'backbone'
Contact = require '../models/contact'

module.exports = Backbone.Collection.extend
  initialize: (options) ->
    options or (options = {})

  url: 'http://0.0.0.0:3001/contacts'

  model: Contact
  comparator: "firstName"
