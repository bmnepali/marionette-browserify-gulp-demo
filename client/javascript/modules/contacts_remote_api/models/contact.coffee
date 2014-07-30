Backbone = require 'backbone'
_ = require 'underscore'
BaseModel = require './base'

module.exports = BaseModel.extend
  initialize: (options) ->
    options or (options = {})

  urlRoot: 'http://localhost:3333'
  url: ->
    _.result(@, "urlRoot") + "/contacts"

  default:
    firstName: ''
    lastName: ''
    phoneNumber: ''

  validate: (attrs, options) ->
    errors = {}
    if not attrs.firstName
      errors.firstName = "can't be blank"
    else
      if attrs.firstName.length < 2
        errors.firstName = "too short"

    if not attrs.lastName
      errors.lastName = "can't be blank"
    else
      if attrs.lastName.length < 2
        errors.lastName = "too short"

    errors if not _.isEmpty errors

  sync: (method, model, options) ->
    self = @
    config = {}

    switch(method)
      when 'create'
        # config = _.extend config,
        #   method: "POST"
        #   url: _.result(@, "urlRoot") + "/user/repos"
        #   data: JSON.stringify model.pick(
        #     "name"
        #     "description"
        #     "homepage"
        #     "private"
        #     "has_issues"
        #     "has_wiki"
        #     "has_downloads"
        #     "team_id"
        #     "auto_init"
        #     "gitignore_template"
        #   )
        break

      when 'read'
        config = _.extend config,
          method: "GET"
        break

      when 'update'
        # config = _.extend config,
        #   method: "PATCH"
        #   data: JSON.stringify model.pick(
        #     "name"
        #     "description"
        #     "homepage"
        #     "private"
        #     "has_issues"
        #     "has_wiki"
        #     "has_downloads"
        #     "default_branch"
        #   )
        break

      when 'delete'
        config = _.extend config,
          method: "DELETE"
        break

    options = _.extend(options, config)

    Backbone.Model::sync.call(@, method, model, options)

