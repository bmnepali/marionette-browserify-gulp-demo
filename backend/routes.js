var contacts = require('./controllers/contacts');

module.exports.init = function(app, router) {
  router.get('/', function(req, res) {
    res.json({ message: 'hooray! welcome to our api!' });
  });

  // Contacts endpoints
  //
  router.get('/contacts', contacts.index);
  router.get('/contacts/:id', contacts.getById);
  router.post('/contacts', contacts.add);
  router.delete('/contacts/:id', contacts.delete);

  app.use('/api', router);
};

