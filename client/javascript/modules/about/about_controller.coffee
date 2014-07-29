Marionette = require 'backbone.marionette'

ShowView = require './views/show_view'

module.exports = Marionette.Controller.extend
  showAbout: ->
    view = new ShowView()
    @options.mainRegion.show(view)

