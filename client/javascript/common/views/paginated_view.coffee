Marionette = require 'backbone.marionette'
$ = require 'jquery'
PaginationControls = require './pagination_controls_view'
_ = require 'underscore'

module.exports = Marionette.LayoutView.extend
  template: require './templates/paginated_view'

  regions:
    paginationControlsRegion: ".js-pagination-controls"
    paginationMainRegion: ".js-pagination-main"

  initialize: (options) ->
    @collection = options.collection

    controls = new PaginationControls paginatedCollection: @collection

    listView = new options.mainView {@collection}

    @on "show", =>
      @paginationControlsRegion.show(controls)
      @paginationMainRegion.show(listView)

