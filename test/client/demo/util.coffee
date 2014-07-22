exports.instanceOf = (value, constructorName) ->
  Object::toString.apply(value) is "[object " + constructorName + "]"

exports.elm = (id) ->
  document.getElementById id

exports.generateId = (prefix) ->
  prefix + Math.floor(Math.random() * 10000)

exports.isUndefined = (value) ->
  typeof value is "undefined"

exports.isDefined = (value) ->
  not exports.isUndefined(value)

exports.parseQueryParams = (locationSearch) ->
  params = {}
  pairs = locationSearch.substr(1).split("&")
  keyValue = undefined
  i = 0

  while i < pairs.length
    keyValue = pairs[i].split("=")
    params[decodeURIComponent(keyValue[0])] = decodeURIComponent(keyValue[1])
    i++
  params
