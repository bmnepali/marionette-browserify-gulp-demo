Marionette = require 'backbone.marionette'

module.exports = class HeaderView extends Marionette.ItemView
  template: require '../templates/header'

  ui:
    input: '#new-todo'

  events:
    'submit form': 'onSubmit'

  onSubmit: (e) ->
    e.preventDefault()

    todoText = @ui.input.val().trim()
    if todoText
      @collection.create(title: todoText)
      @ui.input.val('')
