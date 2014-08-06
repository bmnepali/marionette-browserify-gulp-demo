Marionette = require 'backbone.marionette'
Radio = require '../../../../radio'

module.exports = Marionette.ItemView.extend
  template: require '../templates/list_contacts_panel'

  triggers:
    'click button.js-new': 'contact:new'
