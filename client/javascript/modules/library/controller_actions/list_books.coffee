Radio = require '../../../radio'
Backbone = require 'backbone'
$ = require 'jquery'

SearchView = require '../views/search_view'
LayoutView = require '../views/layout_view'

module.exports = ->
  Backbone.history.navigate "library"

  layoutView = new LayoutView()
  searchView = new SearchView()

  layoutView.on 'show', ->
    @searchRegion.show searchView
    # @booksRegion.show listContactsView

  @options.mainRegion.show(layoutView)
  Radio.commands.execute "global", "set:active:header", "library"

