var mongoose = require('mongoose'),
  Schema = mongoose.Schema;

var Contact = new Schema({
  email:      { type: String },
  name: {
    first:  { type: String },
    last:   { type: String }
  },
  phone:      { type: String },
  gravatar:   { type: String }
});

module.exports = mongoose.model('Contact', Contact);
