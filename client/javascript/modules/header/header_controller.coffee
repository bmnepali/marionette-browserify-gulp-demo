Marionette = require 'backbone.marionette'
Radio = require '../../radio'

HeadersView = require './views/headers_view'
HeaderEntity = require './entities/header'

module.exports = Marionette.Controller.extend
  initialize: ->
    HeaderEntity.initialize()
    @setHandlers()

  setActiveHeader: (headerUrl) ->
    links = Radio.reqres.request "global", "header:entities"
    headerToSelect = links.find( (header) ->
      header.get('url') is headerUrl
    )
    headerToSelect.select()
    links.trigger('reset')

  listHeader: ->
    links = Radio.reqres.request "global", "header:entities"
    headers = new HeadersView collection: links

    headers.on "brand:clicked", ->
      Radio.vent.trigger "global", "contacts:list"

    headers.on "childview:navigate", (childView, model) ->
      trigger = model.get "navigationTrigger"
      Radio.vent.trigger "global", trigger

    @options.headerRegion.show headers

  setHandlers: ->
    Radio.commands.setHandler 'global', 'set:active:header', (name) =>
      @setActiveHeader(name)
