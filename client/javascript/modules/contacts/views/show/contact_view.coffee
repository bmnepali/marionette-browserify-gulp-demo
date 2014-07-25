Marionette = require 'backbone.marionette'

module.exports = Marionette.ItemView.extend
  template: require '../templates/show_contact'

  events:
    'click a.js-edit': 'editClicked'

  editClicked: (e) ->
    # e.preventDefault()
    @trigger 'contact:edit', @model

