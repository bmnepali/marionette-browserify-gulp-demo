Backbone = require 'backbone'
Marionette = require 'backbone.marionette'
ContactsView = require '../views/contacts_view'
ContactDetailsView = require '../views/contact_details_view'
AddContactView = require '../views/add_view'
Contacts = require '../collections/contacts'

module.exports = class ContactsController extends Marionette.Controller
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
    view = new ContactDetailsView {model}
    @renderView(view)
    Backbone.history.navigate('details/' + id)

  add: ->
    view = new AddContactView()
    @renderView(view)
    Backbone.history.navigate('add')
