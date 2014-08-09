Backbone = require 'backbone'
Book = require '../models/book'
$ = require 'jquery'

module.exports = Backbone.Collection.extend
  model: Book

  initialize: ->
    @maxResults = 40
    @page = 0
    @loading = false
    @totalItems = null

  search: (searchTerm) ->
    @page = 0
    self = @

    @fetchBooks(searchTerm, (books) ->
      console.log books
    )

  fetchBooks: (searchTerm, callback) ->
    return true if @loading is true
    @loading is true
    self = @
    query = encodeURIComponent(searchTerm)+'&maxResults='+this.maxResults+'&startIndex='+(this.page * this.maxResults)+'&fields=totalItems,items(id,volumeInfo/title,volumeInfo/subtitle,volumeInfo/authors,volumeInfo/publishedDate,volumeInfo/description,volumeInfo/imageLinks)'

    $.ajax
      url: 'https://www.googleapis.com/books/v1/volumes'
      dataType: 'jsonp'
      data: 'q=' + query
      success: (res) ->
        if res.totalItems is 0
          callback([])
          return []

        if res.items
          @page++
          @totalItems = res.totalItems
          searchResults = []
          _.each(res.items, (item) ->
            thumbnail = null
            thumbnail = item.volumeInfo.imageLinks.thumbnail if item.volumeInfo and item.volumeInfo.imageLinks and item.volumeInfo.imageLinks.thumbnail
            book = new Book
                thumbnail: thumbnail
                title: item.volumeInfo.title
                publishedDate: item.volumeInfo.publishedDate
                description: item.volumeInfo.description
                googleId: item.id
            searchResults[searchResults.length] = book
          )
          callback(searchResults)
          self.loading is false
          searchResults
        else if res.error
          self.loading is false
