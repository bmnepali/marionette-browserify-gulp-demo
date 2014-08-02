Marionette = require 'backbone.marionette'
$ = require 'jquery'
PaginationControls = require './pagination_controls_view'
_ = require 'underscore'

module.exports = Marionette.ItemView.extend
  template: require './templates/paginated_view'

  regions:
    paginationControlsRegion: ".js-pagination-controls"
    paginationMainRegion: ".js-pagination-main"

  initialize: (options) ->
    @collection = options.collection
    eventsToPropagate = options.propagatedEvents || []

    controls = new PaginationControls paginatedCollection: @collection

    listView = new options.mainView {@collection}

    self = @
    @listenTo controls, "page:change", (page) ->
      self.trigger "page:change", page

    _.each eventsToPropagate, (evt) ->
      self.listenTo controls, "page:change", (page) ->
        self.trigger "page:change", page

    @on "show", ->
      @paginationControlsRegion.show(controls)
      @paginationMainRegion.show(listView)

