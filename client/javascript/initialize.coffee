$ = require 'jquery'
App = require './app'
hh = require './common/hbs_helpers'

source = '{{#is 1 1}}<div>Some HTML</div>{{/is}}'
template = Handlebars.compile(source)
content = template()

console.log content

$(document).ready ->
  App.start()
  console.log 'Started'
