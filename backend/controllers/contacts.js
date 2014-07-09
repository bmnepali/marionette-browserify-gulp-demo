var Contact = require('../models/contacts'),
  md5 = require('MD5');

module.exports = {

  // GET localhost:3000/api/contacts/:id
  getById: function(req, res) {
    Contact.find({ _id: req.params.id }, function(err, contact) {
      if (err) {
        res.json({error: 'Contact not found.'});
      } else {
        res.json(contact);
      }
    });
  },

  // GET localhost:3000/api/contacts
  getAll: function(req, res) {
    Contact.find({}, function(err, contacts) {
      if (err) {
        res.json({error: 'No Contacts found: ' + err});
      } else {
        res.json(contacts);
      }
    });
  },

  // POST localhost:3000/api/contacts
  add: function(req, res) {
    var newContact = new Contact(req.body);
    newContact.gravatar = md5(newContact.email);
    newContact.save(function(err, contact) {
      if (err) {
        res.json({error: 'Error adding contact.'});
      } else {
        res.json(contact);
      }
    });
  },

  // PUT localhost:3000/api/contacts/:id
  update: function(req, res) {
    Contact.update({ _id: req.params.id }, req.body, function(err, updated) {
      if (err) {
        res.json({error: 'Contact not updated: ' + err});
      } else {
        res.json(200, {status: 'Success'});
      }
    })
  },

  // DELETE localhost:3000/api/contacts/:id
  delete: function(req, res) {
    Contact.remove({ _id: req.params.id }, function(err, contact) {
      if (err) {
        res.json({error: 'Contact not found.'});
      } else {
        res.json(200, {status: 'Success'});
      }
    });
  }
};
