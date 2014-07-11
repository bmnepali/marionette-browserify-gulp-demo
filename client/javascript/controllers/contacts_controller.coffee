Backbone = require 'backbone'
_ = require 'underscore'
Marionette = require 'backbone.marionette'
ContactsView = require '../views/contacts_view'
ContactDetailsView = require '../views/contact_details_view'
AddContactView = require '../views/add_view'
Contacts = require '../collections/contacts'

class ContactsController extends Marionette.Controller
  initialize: ->
    console.log 'controller initializing'
    @collection = new Contacts()
    @collection.fetch(
      success: ->
        console.log 'successful contacts fetch'
    )

  renderView: (view) =>
    $('#main').html(view.render().el)

  home: ->
    view = new ContactsView {@collection}
    @renderView(view)
    Backbone.history.navigate('home')

  details: (id) ->
    model = @collection.get(id)
    view = new ContactDetailsView {@collection, model}
    @renderView(view)
    Backbone.history.navigate('details/' + id)

  add: ->
    view = new AddContactView {@collection}
    @renderView(view)
    Backbone.history.navigate('add')

  destroyCurrentView: (view) ->
    if !_.isUndefined(@currentView)
      @currentView.destroy()
    @currentView = view

controller = new ContactsController()
module.exports = controller

