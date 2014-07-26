Marionette = require 'backbone.marionette'
Backbone.Syphon = require 'backbone.syphon'
_ = require 'underscore'
Radio = require '../../../../radio'
require 'jqueryui'

module.exports = Marionette.ItemView.extend
  initialize: ->
    @title = "Edit" + @model.get 'firstName' + " " + @model.get 'lastName'

  template: require '../templates/edit_contact_form'

  events:
    'click button.js-submit': 'submitClicked'

  onRender: ->
    if not @options.asModal
      $title = $("<h1>", { text: @title })
      @$el.prepend($title)

  onShow: ->
    if @options.asModal
      @$el.dialog
        modal: true
        title: @title
        width: 'auto'

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




