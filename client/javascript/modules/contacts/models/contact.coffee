Backbone = require 'backbone'
localStorage = require 'backbone.localstorage'
_ = require 'underscore'

module.exports = Backbone.Model.extend
  urlRoot: 'contacts'
  localStorage: new localStorage('contacts-module')

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

