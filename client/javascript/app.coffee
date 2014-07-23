Backbone = require 'backbone'
Marionette = require 'backbone.marionette'
StaticView = require './modules/contacts/views/static_view'
Contact = require './modules/contacts/models/contact'
Contacts = require './modules/contacts/models/contacts'

App = new Marionette.Application()

lala = new Contacts(
  [
    { id: 1, firstName: "Alice", lastName: "Arten", phoneNumber: "555-0184" },
    { id: 2, firstName: "Bob", lastName: "Brigham", phoneNumber: "555-0163" }
  ]
)


module.exports = App






###########################
# Todo = require './modules/todo/todo_module'

# App.navigate = (router, options) ->
#   options or (options = {})
#   Backbone.history.navigate(router, options)
#
# App.getCurrentRoute = ->
#   Backbone.history.fragment
#
# App.on('start', ->
#   if Backbone.history
#     Backbone.history.start()
# )
# App.module 'todo', Todo
