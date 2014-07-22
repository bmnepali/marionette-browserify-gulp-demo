instanceOf = require("./util").instanceOf

module.exports = (obj, depth) ->
  return "..."  if depth is 0
  return "null"  if obj is null
  switch typeof obj
    when "string"
      "'" + obj + "'"
    when "undefined"
      "undefined"
    when "function"
      obj.toString().replace /\{[\s\S]*\}/, "{ ... }"
    when "boolean"
      (if obj then "true" else "false")
    when "object"
      strs = []
      if instanceOf(obj, "Array")
        strs.push "["
        i = 0
        ii = obj.length

        while i < ii
          strs.push ", "  if i
          strs.push stringify(obj[i], depth - 1)
          i++
        strs.push "]"
      else if instanceOf(obj, "Date")
        return obj.toString()
      else if instanceOf(obj, "Text")
        return obj.nodeValue
      else if instanceOf(obj, "Comment")
        return "<!--" + obj.nodeValue + "-->"
      else if obj.outerHTML
        return obj.outerHTML
      else
        strs.push obj.constructor.name
        strs.push "{"
        first = true
        for key of obj
          if obj.hasOwnProperty(key)
            if first
              first = false
            else
              strs.push ", "
            strs.push key + ": " + stringify(obj[key], depth - 1)
        strs.push "}"
      strs.join ""
    else
      obj
