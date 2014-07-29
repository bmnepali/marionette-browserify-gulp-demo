Marionette = require 'backbone.marionette'
Radio = require '../../../../radio'

module.exports = Marionette.ItemView.extend
  template: require '../templates/list_contacts_panel'

  triggers:
    'click button.js-new': 'contact:new'

  events:
    'submit #filter-form': 'filterContacts'

  ui:
    criterion: 'input.js-filter-criterion'

  filterContacts: (e) ->
    e.preventDefault()
    criterion = @$('.js-filter-criterion').val()
    @trigger('contacts:filter', criterion)

  onSetFilterCriterion: (criterion) ->
    @ui.criterion.val(criterion)
    Radio.vent.trigger 'global', 'contacts:filter', criterion

