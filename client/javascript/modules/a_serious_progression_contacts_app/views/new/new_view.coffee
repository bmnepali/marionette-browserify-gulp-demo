CommonFormView = require '../common/form_view'

module.exports = CommonFormView.extend
  title: "new contact"

  onRender: ->
    @$('.js-submit').text('create contact')
