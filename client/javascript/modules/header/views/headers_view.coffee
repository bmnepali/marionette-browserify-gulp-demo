Marionette = require 'backbone.marionette'
HeaderView = require './header_view'

module.exports = Marionette.CompositeView.extend
  template: require './templates/header_template'
  childView: HeaderView
  childViewContainer: "ul"

  events:
    "click a.brand": "brandClicked"

  brandClicked: (e) ->
    e.preventDefault()
    @trigger('brand:clicked')
