_ = require 'underscore'
Backbone.Validation = require 'backbone-validation'

_.extend Backbone.Validation.messages,
  required: 'is required'
  minLength: 'is too short (min {1} characters'

module.exports = Backbone.Validation
