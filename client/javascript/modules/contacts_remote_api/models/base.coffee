Backbone = require 'backbone'
require '../../../common/backbone_sync'

module.exports = Backbone.Model.extend
  sync: (method, model, options) ->
    Backbone.Model::sync.call(this, method, model, options)
