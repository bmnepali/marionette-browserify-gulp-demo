CommonFormView = require '../common/form_view'

module.exports = CommonFormView.extend
  initialize: ->
    @title = "Edit " + @model.get('firstName') + " " + @model.get('lastName')

  onRender: ->
    if not @options.asModal
      $title = $("<h1>", { text: @title })
      @$el.prepend($title)

