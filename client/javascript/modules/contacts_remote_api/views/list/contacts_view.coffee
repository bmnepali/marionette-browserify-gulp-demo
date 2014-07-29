Marionette = require 'backbone.marionette'
ContactView = require './contact_view'
NoContactsView = require './no_contacts_view'

module.exports = Marionette.CompositeView.extend
  tagName: 'table'
  className: 'table table-hover'
  template: require '../templates/list_contacts_table'
  emptyView: NoContactsView
  childView: ContactView
  childViewContainer: 'tbody'

  initialize: ->
    @listenTo(@collection, 'reset', ->
      @appendHtml = (collectionView, itemView, index) ->
        collectionView.$el.append itemView.el
    )

  onCompositeCollectionRendered: ->
    @appendHtml = (collectionView, itemView, index) ->
      collectionView.$el.prepend itemView.el


