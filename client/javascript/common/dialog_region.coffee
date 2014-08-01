Marionette = require 'backbone.marionette'
require 'jqueryui'

module.exports = Marionette.Region.extend
  onShow: (view) ->
    @listenTo(view, 'dialog:close', @closeDialog)

    self = @
    configureDialog = =>
      @$el.dialog
        modal: true
        title: view.title
        width: 'auto'
        position: 'center'
        close: (e, ui) ->
          self.closeDialog()
    configureDialog()
    @listenTo(view, 'render', configureDialog)

  closeDialog: ->
    @stopListening()
    @empty()
    @$el.dialog('destroy')
