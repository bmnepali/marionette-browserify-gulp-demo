Backgrid = require 'backgrid'
Radio = require '../../../../radio'

module.exports = Backgrid.Cell.extend(
  template: require '../templates/list_contact_show_button'
  events:
    click: "showRow"

  showRow: (e) ->
    e.preventDefault()
    Radio.vent.trigger 'global', 'contact:list:show', {@model}

  render: ->
    @$el.html @template()
    @delegateEvents()
)

