Radio = require '../../../radio'
Backbone = require 'backbone'
$ = require 'jquery'

SearchView = require '../views/search_view'
LayoutView = require '../views/layout_view'
BookListView = require '../views/book_list_view'

Books = require '../collections/books'

module.exports = ->
  Backbone.history.navigate "library"

  layoutView = new LayoutView()
  searchView = new SearchView()

  fetchingBooks = Radio.reqres.request 'global', "books:search", 'marketing'

  $.when(fetchingBooks).done (collection) =>
    bookListView = new BookListView {collection}

    layoutView.on 'show', ->
      @searchRegion.show searchView
      @booksRegion.show bookListView
    @options.mainRegion.show(layoutView)

    searchView.on 'books:search', (searchTerm) ->
      Radio.vent.trigger 'global', 'search:term', searchTerm
  .fail ->
    console.log 'unprocessed error'

  Radio.commands.execute "global", "set:active:header", "library"

