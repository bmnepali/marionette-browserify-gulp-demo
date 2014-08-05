$ = require 'jquery'
App = require './app'
require('./common/hbs_helpers')

$(document).ready ->
  App.start()
  console.log 'Started'
