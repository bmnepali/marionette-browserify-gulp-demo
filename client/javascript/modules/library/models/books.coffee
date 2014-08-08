Backbone = require 'backbone'
localStorage = require 'backbone.localstorage'
Books = require './books'

module.exports = Backbone.Collection.extend
  model: Books

  localStorage: new localStorage('books-module')
