var test = require('tape');

test('fibwibblers and xyrscawlers', function (t) {
  t.plan(1);

  var x = function (a) { return a * 2; };
  t.equal(x(2), 4);
})
