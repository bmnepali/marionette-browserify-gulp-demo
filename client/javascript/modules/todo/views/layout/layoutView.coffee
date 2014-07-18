Marionette = require 'backbone.marionette'
HeaderView = require './headerView'
FooterView = require './footerView'
TodosCollectionView = require '../todos/collection_view'

module.exports = class LayoutView extends Marionette.LayoutView
  template: require '../templates/layout'

  ui:
    app: '#todoapp'

  regions:
    header: '#header'
    main: '#main'
    footer: '#footer'

  updateFilter: (filter) ->
    @ui.app.attr('class', 'filter-' + filter)

  onShow: ->
    options =
      collection: @options.todosCollection

    @header.show(new HeaderView(options))
    @footer.show(new FooterView(options))
    @main.show(new TodosCollectionView(options))
