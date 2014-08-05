Marionette = require 'backbone.marionette'
$ = require 'jquery'

module.exports = Marionette.ItemView.extend
  template: require './templates/pagination_controls'
  className: 'pagination'

  initialize: (options) ->
    @paginatedCollection = options.paginatedCollection

    serializeData: ->
      @paginatedCollection.info()
