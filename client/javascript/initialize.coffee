$ = require 'jquery'
App = require './app'
Repo = require './modules/contacts_remote_api/models/repository'

$(document).ready ->
  App.start()
  window.repo = Repo
  console.log 'Started'
