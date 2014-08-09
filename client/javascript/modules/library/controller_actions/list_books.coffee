Radio = require '../../../radio'
Backbone = require 'backbone'
$ = require 'jquery'

SearchView = require '../views/search_view'
LayoutView = require '../views/layout_view'

Books = require '../collections/books'

module.exports = ->
  Backbone.history.navigate "library"

  layoutView = new LayoutView()
  searchView = new SearchView()

  fetchBooks = new Books()
  lala = fetchBooks.search('marketing')
  console.log lala

  layoutView.on 'show', ->
    @searchRegion.show searchView
    # @booksRegion.show listContactsView

  @options.mainRegion.show(layoutView)
  Radio.commands.execute "global", "set:active:header", "library"

