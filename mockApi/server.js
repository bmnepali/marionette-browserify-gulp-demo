/*
  Seed mongoDB with contacts if none exists.
*/

var express = require('express'),
  mongoose = require('mongoose'),
  app = express(),
  port = process.env.PORT || 3000,
  router = express.Router(),
  routes = require('./routes'),
  seeder = require('./seeder'),
  Contact = require('./models/contacts'),
  bodyParser = require('body-parser');

// set app to parse application/json.
app.use(bodyParser.json());

//connect to the db server:
mongoose.connect('mongodb://localhost/MyApp');
mongoose.connection.on('open', function() {
  console.log("Connected to Mongoose...");

  // check if the db is empty, if so seed it with some contacts:
  seeder.check();
});

// initialize routes
routes.init(app, router);

// Start server
app.listen(port);
console.log('Check for magic on port: ' + port);


