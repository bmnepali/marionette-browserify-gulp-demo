Backgrid = require 'backgrid'

module.exports = (options) ->
  new Backgrid.Extension.ClientSideFilter
    collection: options.collection
    fields: options.fields
