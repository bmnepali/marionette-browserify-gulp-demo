Backgrid = require 'backgrid'

module.exports = Backgrid.Cell.extend(
  template: require '../templates/list_contact_delete_button'
  events:
    click: "deleteRow"

  deleteRow: (e) ->
    e.preventDefault()
    @model.destroy()

  render: ->
    @$el.html @template()
    @delegateEvents()
)

