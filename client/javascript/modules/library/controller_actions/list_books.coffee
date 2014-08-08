Radio = require '../../../radio'
Backbone = require 'backbone'
$ = require 'jquery'

LayoutView = require '../views/layout_view'

module.exports = ->
  Backbone.history.navigate "library"

  layoutView = new LayoutView()

  @options.mainRegion.show(layoutView)
  Radio.commands.execute "global", "set:active:header", "library"

