Backbone = require 'backbone'
Contact = require '../models/contact'

module.exports = Backbone.Collection.extend
  initialize: (options) ->
    options or (options = {})

  urlRoot: 'http://localhost:3333'
  url: ->
    _.result(@, "urlRoot") + "/contacts"

  model: Contact
  comparator: "firstName"
