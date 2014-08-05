Backbone = require 'backbone'
Contact = require '../models/contact'
_ = require 'underscore'

module.exports = Backbone.PageableCollection.extend
  mode: "client"

  model: Contact

  url: 'http://0.0.0.0:3001/contacts'

  comparator: "firstName"

  state:
    pageSize: 10
