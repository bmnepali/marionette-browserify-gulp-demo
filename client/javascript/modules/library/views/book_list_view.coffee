Marionette = require 'backbone.marionette'
BookView = require './book_view'

module.exports = Marionette.CompositeView.extend
  id: 'bookList'
  template: require './templates/book_list'
  childView: BookView

