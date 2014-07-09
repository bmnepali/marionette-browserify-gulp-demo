var express = require('express'),
  app = express(),
  port = process.env.PORT || 3000,
  router = express.Router(),
  routes = require('./routes'),
  Contact = require('./models/contacts'),
  bodyParser = require('body-parser');

// set app to parse application/json.
//
app.use(bodyParser.json());

// initialize routes
routes.init(app, router);

// Start server
app.listen(port);
console.log('magic on port: ' + port);


