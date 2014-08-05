Backbone = require 'backbone'
_ = require 'underscore'
BaseModel = require './base'
Backbone.Validation = require '../../../common/extend_backbone_validation'

_.extend BaseModel::, Backbone.Validation.mixin

module.exports = BaseModel.extend
  initialize: (options) ->
    options or (options = {})
    @on "change", ->
      @set 'fullName', @get('firstName') + " " + @get('lastName')

  urlRoot: 'http://0.0.0.0:3001/contacts'

  default:
    firstName: ''
    lastName: ''
    phoneNumber: ''
    changedOnServer: false

  validation:
    firstName:
      required: true

    lastName:
      required: true
      minLength: 2

  sync: (method, model, options) ->
    console.log "Contact's sync function called."
    self = @
    config = {}

    switch(method)
      when 'create'
        break

      when 'read'
        config = _.extend config,
          url: _.result(@, "urlRoot") + "/" + @get('id')
          method: "GET"
        break

      when 'update'
        config = _.extend config,
          method: "PATCH"
          url: _.result(@, "urlRoot") + "/" + @get('id')
        break

      when 'delete'
        config = _.extend config,
          method: "DELETE"
        break

    options = _.extend(options, config)

    Backbone.Model::sync.call(@, method, model, options)

