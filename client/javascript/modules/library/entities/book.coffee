Marionette = require 'backbone.marionette'
Radio = require '../../../radio'
Books = require '../collections/books'

books = 'undefined'

module.exports =
  initialize: ->
    @maxResults = 40
    @page = 0
    @loading = false
    @totalItems = null
    @setHandlers()

  searchBooks: (options) ->
    @page = 0
    self = @
    searchTerm = options.searchTerm
    defer = $.Deferred()

    books = new Books()

    response = @fetchBooks(searchTerm)

    response.done (res) ->
      if res.totalItems is 0
        return []

      if res.items
        @page++
        @totalItems = res.totalItems
        # searchResults = []
        _.each(res.items, (item) ->
          thumbnail = null
          thumbnail = item.volumeInfo.imageLinks.thumbnail if item.volumeInfo and item.volumeInfo.imageLinks and item.volumeInfo.imageLinks.thumbnail
          books.add
            thumbnail: thumbnail
            title: item.volumeInfo.title
            publishedDate: item.volumeInfo.publishedDate
            description: item.volumeInfo.description
            googleId: item.id
          # book = new Book
          #   thumbnail: thumbnail
          #   title: item.volumeInfo.title
          #   publishedDate: item.volumeInfo.publishedDate
          #   description: item.volumeInfo.description
          #   googleId: item.id
          # searchResults[searchResults.length] = book
        )
        self.loading is false
        # defer.resolveWith(response, [searchResults])
        defer.resolveWith(response, [books])

    response.fail ->
      defer.rejectWith(response, arguments)

    defer.promise()

  fetchBooks: (searchTerm) ->
    return true if @loading is true
    @loading is true
    self = @
    query = encodeURIComponent(searchTerm)+'&maxResults='+this.maxResults+'&startIndex='+(this.page * this.maxResults)+'&fields=totalItems,items(id,volumeInfo/title,volumeInfo/subtitle,volumeInfo/authors,volumeInfo/publishedDate,volumeInfo/description,volumeInfo/imageLinks)'

    $.ajax
      url: 'https://www.googleapis.com/books/v1/volumes'
      dataType: 'jsonp'
      data: 'q=' + query

  setHandlers: ->
    Radio.reqres.setHandler "global", "books:search", (options) =>
      @searchBooks(options)
