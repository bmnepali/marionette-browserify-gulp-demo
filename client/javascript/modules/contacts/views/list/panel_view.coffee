Marionette = require 'backbone.marionette'

module.exports = Marionette.ItemView.extend
  template: require '../templates/list_contacts_panel'

  triggers:
    'click button.js-new': 'contact:new'

  events:
    'submit #filter-form': 'filterContacts'

  filterContacts: (e) ->
    e.preventDefault()
    criterion = @$('.js-filter-criterion').val()
    @trigger('contacts:filter', criterion)

