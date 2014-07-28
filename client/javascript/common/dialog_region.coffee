Marionette = require 'backbone.marionette'
require 'jqueryui'

module.exports = Marionette.Region.extend
  onShow: (view) ->
    @listenTo(view, 'dialog:close', @closeDialog)

    self = @
    @$el.dialog
      modal: true
      title: view.title
      width: 'auto'
      close: (e, ui) ->
        self.closeDialog()

  closeDialog: ->
    @stopListening()
    @empty()
    @$el.dialog('destroy')
