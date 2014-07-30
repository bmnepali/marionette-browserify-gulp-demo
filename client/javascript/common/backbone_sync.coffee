Backbone = require 'backbone'
$ = require 'jquery'

originalSync = Backbone.sync

Backbone.sync = (method, model, options) ->
  deferred = $.Deferred()
  options or (options = {})
  deferred.then options.success, options.error

  response = originalSync(method, model, _.omit(options, 'success', 'error'))

  response.done(deferred.resolve)
  response.fail(->
    if response.status is 401
      console.log 'this action is not authorized'
    else if response.status is 403
      console.log response.responseJSON.message
    else
      deferred.rejectWith response, arguments
  )

  deferred.promise()

module.exports = Backbone.sync
