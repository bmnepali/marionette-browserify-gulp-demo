Marionette = require 'backbone.marionette'
Radio = require '../../../radio'
Books = require '../collections/books'

books = null

module.exports =
  initialize: ->
    @setHandlers()
    @maxResults = 5
    @page = 0
    @loading = false
    @totalItems = null

  fetchBooks: (searchTerm) ->
    @page = 0
    self = @
    defer = $.Deferred()

    response = @searchBooks(searchTerm)
    Radio.vent.trigger 'global', 'search:start'

    response.done (data) ->
      mungedData = []
      if data.totalItems is 0
        return []

      if data.items
        @page++
        @totalItems = data.totalItems
        _.each(data.items, (item) ->
          thumbnail = null
          thumbnail = item.volumeInfo.imageLinks.thumbnail if item.volumeInfo and item.volumeInfo.imageLinks and item.volumeInfo.imageLinks.thumbnail
          mungedData.push
            thumbnail: thumbnail,
            title: item.volumeInfo.title,
            subtitle: item.volumeInfo.subtitle,
            description: item.volumeInfo.description,
            googleId: item.id
        )

        Radio.vent.trigger 'global', 'search:stop'

        if books
          if mungedData < 1
            Radio.vent.trigger 'global', 'search:noResults'
          else
            books.reset(mungedData)
        else
          books = new Books(mungedData)

        self.loading is false
        defer.resolveWith(response, [books])

    response.fail ->
      defer.rejectWith(response, arguments)

    defer.promise()

  searchBooks: (searchTerm) ->
    return true if @loading is true
    @loading is true
    self = @
    query = encodeURIComponent(searchTerm)+'&maxResults='+this.maxResults+'&startIndex='+(this.page * this.maxResults)+'&fields=totalItems,items(id,volumeInfo/title,volumeInfo/subtitle,volumeInfo/authors,volumeInfo/publishedDate,volumeInfo/description,volumeInfo/imageLinks)'

    $.ajax
      url: 'https://www.googleapis.com/books/v1/volumes'
      dataType: 'jsonp'
      data: 'q=' + query

  setHandlers: ->
    Radio.reqres.setHandler "global", "search:term", (searchTerm) =>
      @fetchBooks(searchTerm)
