Backgrid = require 'backgrid'
DeleteButton = require './delete_button_view'
EditButton = require './edit_button_view'
ShowButton = require './show_button_view'
_ = require 'underscore'

module.exports = (options) ->
  new Backgrid.Grid
    columns: [
      name: 'id'
      label: 'ID'
      cell: 'integer'
    ,
      name: 'firstName'
      label: 'First Name'
      cell: 'string'
    ,
      name: 'lastName'
      label: 'Last Name'
      cell: 'string'
    ,
      cell: DeleteButton
      editable: false
    ,
      cell: ShowButton
      editable: false
    ,
      cell: EditButton
      editable: false
    ]

    collection: options.collection
