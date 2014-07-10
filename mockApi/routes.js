/*
  Set up routes for mock API.
*/

var contacts = require('./controllers/contacts');

module.exports.init = function(app, router) {
  router.get('/', function(req, res) {
    res.json({ message: 'hooray! welcome to our api!' });
  });

  // Contacts API endpoints
  router.get('/contacts', contacts.getAll);
  router.get('/contacts/:id', contacts.getById);
  router.post('/contacts', contacts.add);
  router.put('/contacts/:id', contacts.update);
  router.delete('/contacts/:id', contacts.delete);

  app.use('/api', router);
};

