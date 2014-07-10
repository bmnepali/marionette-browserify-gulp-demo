/*
  Filters out non .coffee and .js files. Prevents
  accidental inclusion of possible hidden files
*/

var path = require("path");

module.exports = function(name) {
  return /(\.(js|coffee)$)/i.test(path.extname(name));
};
