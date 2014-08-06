Marionette = require 'backbone.marionette'
$ = require 'jquery'
_ = require 'underscore'

module.exports = Marionette.LayoutView.extend
  template: require './templates/paginated_view'

  regions:
    filterBoxRegion: ".js-filter"
    paginationControlsRegion: ".js-pagination-controls"
    paginationMainRegion: ".js-pagination-main"

  initialize: (options) ->
    @collection = options.collection
    controls = new Backgrid.Extension.Paginator {@collection}
    listView = options.mainView
    filterView = options.filterView

    @on "show", =>
      @paginationControlsRegion.show(controls)
      @paginationMainRegion.show(listView)
      @filterBoxRegion.show(filterView)

