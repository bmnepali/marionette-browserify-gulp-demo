$ = require 'jquery'
App = require './app'

$(document).ready ->
  App.start()
  console.log 'Started!'
  window.app = App
