CommonFormView = require '../common/form_view'

module.exports = CommonFormView.extend
  initialize: ->
    @title = "Edit " + @model.get('firstName') + " " + @model.get('lastName')

  onRender: ->
    if not @options.generateTitle
      $title = $("<h1>", { text: @title })
      @$el.prepend($title)

    @$('.js-submit').text('Update contact')

