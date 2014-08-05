Marionette = require 'backbone.marionette'
Radio = require '../../../radio'
Backbone = require 'backbone'

ContactEntity = require '../entities/contact'

module.exports = Marionette.Controller.extend
  initialize: ->
    ContactEntity.initialize()
    @setHandlers()

  setHandlers: ->
    Radio.vent.on 'global', 'contacts:filter', (criterion) ->
      if criterion
        Backbone.history.navigate 'contacts/filter/criterion:' + criterion
      else
        Backbone.history.navigate 'contacts'

    Radio.vent.on 'global', 'contacts:list', =>
      Backbone.history.navigate 'contacts'
      @listContacts()
