Marionette = require 'backbone.marionette'
Radio = require '../../radio'

ShowView = require './views/show_view'

module.exports = Marionette.Controller.extend
  initialize: ->
    @setHandlers()

  showAbout: ->
    view = new ShowView()
    @options.mainRegion.show(view)
    Radio.commands.execute "global", "set:active:header", "about"

  setHandlers: ->
    Radio.vent.on 'global', 'about:show', =>
      Backbone.history.navigate 'about'
      @showAbout()
