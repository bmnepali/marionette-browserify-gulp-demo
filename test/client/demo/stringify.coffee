stringify = require("../../../client/javascript/demo/stringify")

# module.exports = describe "stringify", ->
describe "stringify", ->
  it "should serialize string", ->
    expect(stringify("aaa")).toBe "'aaa'"

  it "should serialize booleans", ->
    expect(stringify(true)).toBe "true"
    expect(stringify(false)).toBe "false"

  it "should serialize null and undefined", ->
    expect(stringify(null)).toBe "null"
    expect(stringify()).toBe "undefined"

  it "should serialize functions", ->
    abc = (a, b, c) ->
      "whatever"
    def = (d, e, f) ->
      "whatever"

    expect(stringify(abc)).toBe "function (a, b, c) { ... }"
    console.log(stringify(abc))
    expect(stringify(def)).toBe "function (d, e, f) { ... }"

  it "should serialize arrays", ->
    expect(stringify(["a","b"])).toBe "['a', 'b', null, true, false]"

  it "should serialize html", ->
    div = document.createElement("div")
    expect(stringify(div)).toBe "<div></div>"
    div.innerHTML = "some <span>text</span>"
    expect(stringify(div)).toBe "<div>some <span>text</span></div>"

  it "should serialize across iframes", ->
    div = document.createElement("div")
    expect(__karma__.stringify(div)).toBe "<div></div>"
    expect(__karma__.stringify([
      1
      2
    ])).toBe "[1, 2]"
