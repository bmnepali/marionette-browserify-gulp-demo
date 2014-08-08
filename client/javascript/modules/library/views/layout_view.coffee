Marionette = require 'backbone.marionette'

module.exports = Marionette.LayoutView.extend
  template: require './templates/library_layout'

  regions:
    searchRegion: '#searchBar'
    booksRegion: '#bookContainer'
