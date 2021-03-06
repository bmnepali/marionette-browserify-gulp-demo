Marionette = require 'backbone.marionette'
Backbone.Syphon = require 'backbone.syphon'
require 'jqueryui'
_ = require 'underscore'

module.exports = Marionette.ItemView.extend
  template: require '../templates/contact_form'

  events:
    'click button.js-submit': 'submitClicked'

  submitClicked: (e) ->
    e.preventDefault()
    data = Backbone.Syphon.serialize(this)
    @trigger 'form:submit', data

  onFormDataInvalid: (errors) ->
    $view = @$el
    clearFormErrors = ->
      $form = $view.find('form')
      $form.find('.help-inline.has-error').each ->
        $(@).remove()
      $form.find('.form-group.has-error').each ->
        $(@).removeClass('has-error')

    markErrors = (value, key) ->
      $controlGroup = $view.find('#contact-' + key).parent()
      $errorEl = $("<span>", class: "help-inline has-error", text: value)
      $controlGroup.append($errorEl).addClass "has-error"

    clearFormErrors()
    _.each(errors, markErrors)
