Marionette = require 'backbone.marionette'

module.exports = Marionette.ItemView.extend
  template: require '../templates/header'

  ui:
    input: '#new-todo'

  events:
    'submit form': 'onSubmit'

  onSubmit: (e) ->
    e.preventDefault()

    todoText = @ui.input.val().trim()
    if todoText
      console.log @collection
      @collection.create(title: todoText)
      @ui.input.val('')
