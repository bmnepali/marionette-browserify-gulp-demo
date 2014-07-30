Backbone = require 'backbone'
_ = require 'underscore'
BaseModel = require './base'

module.exports = BaseModel.extend
  initialize: (options) ->
    options or (options = {})
    @username = options.username or window.username
    @password = options.password or window.password

    self = @
    @on "sync", ->
      self.set(
        { githubName: self.get("name") },
        silent: true
      )

  urlRoot: "https://api.github.com"
  url: ->
    _.result(@, "urlRoot") + "/repos/" + @username + "/" + (@get("githubName") or @get("name"))

  validate: (attrs, options) ->
    errors = {}
    if not attrs.name
      errors.name = "no blank"
    if not _.isEmpty(errors)
      errors

  sync: (method, model, options) ->
    self = @
    config =
      beforeSend: (xhr) ->
        xhr.setRequestHeader "Authorization", "Basic " + btoa(self.username + ":" + self.password)

    switch(method)
      when 'create'
        config = _.extend config,
          method: "POST"
          url: _.result(@, "urlRoot") + "/user/repos"
          data: JSON.stringify model.pick(
            "name"
            "description"
            "homepage"
            "private"
            "has_issues"
            "has_wiki"
            "has_downloads"
            "team_id"
            "auto_init"
            "gitignore_template"
          )
        break

      when 'read'
        config = _.extend config,
          method: "GET"
        break

      when 'update'
        config = _.extend config,
          method: "PATCH"
          data: JSON.stringify model.pick(
            "name"
            "description"
            "homepage"
            "private"
            "has_issues"
            "has_wiki"
            "has_downloads"
            "default_branch"
          )
        break

      when 'delete'
        config = _.extend config,
          method: "DELETE"
        break

    options = _.extend(options, config)

    Backbone.Model::sync.call(@, method, model, options)

