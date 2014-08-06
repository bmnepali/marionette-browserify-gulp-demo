Backgrid = require 'backgrid'
Radio = require '../../../../radio'

module.exports = Backgrid.Cell.extend(
  template: require '../templates/list_contact_edit_button'
  events:
    click: "editRow"

  editRow: (e) ->
    Radio.vent.trigger 'global', 'contact:list:edit', {childView: @, model: @model}

  flash: (cssClass) ->
    $view = @$el
    $view.hide().toggleClass(cssClass).fadeIn(800, ->
      setTimeout((->
        $view.toggleClass(cssClass)
      ), 500)
    )

  render: ->
    @$el.html @template()
    @delegateEvents()
)

