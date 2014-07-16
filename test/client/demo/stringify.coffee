stringify = require "../../../client/javascript/demo/stringify"

describe "stringify", ->
  it "should serialize string", ->
    expect(stringify("aaa")).to.equal "'aaa'"

  it "should serialize booleans", ->
    expect(stringify(true)).to.equal "true"
    expect(stringify(false)).to.equal "false"

  it "should serialize null and undefined", ->
    expect(stringify(null)).to.equal "null"
    expect(stringify()).to.equal "undefined"

  it "should serialize functions", ->
    abc = (a, b, c) ->
      "whatever"
    def = (d, e, f) ->
      "whatever"

    expect(stringify(abc)).to.equal "function (a, b, c) { ... }"
    console.log(stringify(abc))
    expect(stringify(def)).to.equal "function (d, e, f) { ... }"

  it "should serialize arrays", ->
    expect(stringify([
      'a'
      'b'
    ])).to.equal "['a', 'b', null, true, false]"

  it "should serialize html", ->
    div = document.createElement("div")
    expect(stringify(div)).to.equal "<div></div>"
    div.innerHTML = "some <span>text</span>"
    expect(stringify(div)).to.equal "<div>some <span>text</span></div>"

  it "should serialize across iframes", ->
    div = document.createElement("div")
    expect(__karma__.stringify(div)).to.equal "<div></div>"
    expect(__karma__.stringify([
      1
      2
    ])).to.equal "[1, 2]"
