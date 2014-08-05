Backbone = require 'backbone'
_ = require 'underscore'

module.exports = Backbone.Model.extend
  refresh: (serverData, keys) ->
    previousAttributes = @previousAttributes()
    changed = @changedAttributes()

    @set(serverData)
    if changed
      @set(changed, silent: true)
      keys = _.difference(keys, _.keys(changed))
    clientSide = _.pick(previousAttributes, keys)
    serverSide = _.pick(serverData, keys)
    @set(
      changedOnServer: not _.isEqual clientSide, serverSide
      silent: true
    )

  sync: (method, model, options) ->
    Backbone.Model::sync.call(this, method, model, options)
