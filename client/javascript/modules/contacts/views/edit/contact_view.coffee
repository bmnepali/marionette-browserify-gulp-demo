Marionette = require 'backbone.marionette'

module.exports = Marionette.ItemView.extend
  template: require '../templates/edit_contact_form'

  events:
    'click button.js-submit': 'submitClicked'

  submitClicked: (e) ->
    e.preventDefault()
    console.log 'edit contact'
