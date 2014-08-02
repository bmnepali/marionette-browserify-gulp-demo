Marionette = require 'backbone.marionette'
$ = require 'jquery'

module.exports = Marionette.ItemView.extend
  template: require './templates/pagination_controls'
  className: 'pagination'

  initialize: (options) ->
    @paginatedCollection = options.paginatedCollection
    @listenTo @paginatedCollection, "page:change:after", @render

    events:
      "click a[class=navigatable]": "navigateToPage"

    navigateToPage: (e) ->
      e.preventDefault()
      page = parseInt($(e.target).data('page'), 10)
      @paginatedCollection.parameters.set('page', page)
      @trigger "page:change", page

    serializeData: ->
      @paginatedCollection.info()
