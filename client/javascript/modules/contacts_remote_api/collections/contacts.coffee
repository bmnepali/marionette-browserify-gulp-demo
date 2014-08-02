Backbone = require 'backbone'
require 'backbone.paginator'
Contact = require '../models/contact'
_ = require 'underscore'

# module.exports = Backbone.Collection.extend
#   initialize: (options) ->
#     options or (options = {})
# 
#   url: 'http://0.0.0.0:3001/contacts'
# 
#   model: Contact
#   comparator: "firstName"

module.exports = Backbone.Paginator.clientPager.extend
  model: Contact

  initialize: (models, options) ->
    options or (options = {})
    params = options.parameters or page: 1
    @parameters = new Backbone.Model(params)

    self = @
    @listenTo @parameters, "change", (model) ->
      if _.has(model.changed, "criterion")
        self.setFilter([
          "firstName"
          "lastName"
          "phoneNumber"
        ], self.parameters.get "criterion")

      if _.has(model.changed, "page")
        self.goTo(parseInt(self.parameters.get("page"), 10))

      self.trigger "page:change:after"

  comparator: "firstName"

  paginator_core:
    dataType: 'json'
    url: 'http://0.0.0.0:3001/contacts'

  paginator_ui:
    firstPage: 1
    currentPage: 1
    perPage: 10
    pagesInRange: 2
