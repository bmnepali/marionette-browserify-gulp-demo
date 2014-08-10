Marionette = require 'backbone.marionette'
Radio = require '../../radio'
BookControllerBase = require './controller_actions/base'
ListBooks = require './controller_actions/list_books'

module.exports = BookControllerBase.extend
  listBooks: ListBooks

