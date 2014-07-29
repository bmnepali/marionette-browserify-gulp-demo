Backbone = require 'backbone'
Backbone.Picky = require 'backbone.picky'
_ = require 'underscore'

module.exports = Backbone.Model.extend
  initialize: ->
    selectable = new Backbone.Picky.Selectable(@)
    _.extend(@, selectable)

