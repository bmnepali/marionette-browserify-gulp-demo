Backbone = require 'backbone'
Backbone.Picky = require 'backbone.picky'
_ = require 'underscore'

Header = require '../models/header'

module.exports = Backbone.Collection.extend
  model: Header
  initialize: ->
    singleSelect = new Backbone.Picky.SingleSelect(@)
    _.extend(@, singleSelect)
