Marionette = require 'backbone.marionette'

module.exports = Marionette.LayoutView.extend
  template: require '../templates/list_contacts_layout'

  regions:
    panelRegion: '#panel-region'
    contactsRegion: '#contacts-region'
