Backbone = require 'backbone'
Book = require '../models/book'
$ = require 'jquery'

module.exports = Backbone.Collection.extend
  model: Book
