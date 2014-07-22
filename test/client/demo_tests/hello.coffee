greet = require "../demo/hello"

describe "greeter", ->
  it "should say Hello to the World", ->
    expect(greet("World")).to.equal "Hello, World!"
