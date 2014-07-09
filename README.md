marionette-browserify-gulp-express-starter
============

Sources:
http://viget.com/extend/gulp-browserify-starter-faq
http://kroltech.com/2013/12/boilerplate-web-app-using-backbone-js-expressjs-node-js-mongodb/
http://scotch.io/tutorials/javascript/build-a-restful-api-using-node-and-express-4

Includes the following tools, tasks, and workflows:

- Marionette (from bower)
- Browserify (with browserify-shim)
- Watchify (caching version of browserify for super fast rebuilds)
- Compass
- CoffeeScript (with source mapping!)
- Handlebars (as a backbone dependency)
- Non common-js vendor code (like a jQuery plugin)
- LiveReload
- Static Server
- Image optimization
- Error Notifications in Notification Center
- Express (from npm)

If you've never used Node or npm before, you'll need to install Node.
If you use homebrew, do:
```
brew install node
```

Otherwise, you can download and install from [here](http://nodejs.org/download/).

### Install Gulp Globally
Gulp must be installed globally in order to use the command line tools. *You may need to use `sudo`*
```
npm install -g gulp
```

### Install Compass
The gulp-compass module relies on Compass already being installed on your system.
```
gem update --system
gem install compass
```
### Install npm dependencies
```
npm install
```
This runs through all dependencies listed in `package.json` and downloads them
to a `node_modules` folder in your project directory.

### Install bower dependencies
```
bower install
```

### Run gulp
```
gulp
```

### Run Express to fake a REST API
Install and start Mongodb.
Start server.
```
node backend/server.js
```

### Testing Contacts API endpoints
Note: Replace ':id' with MongoDB id for the PUT and DELETE requests.
```
curl http://localhost:3000/api/contacts
curl -X POST -H 'Content-Type: application/json' -d '{"email":"mail@gmail.com","phone":"215-123-1234","name":{"first":"firstName","last":"lastName"}}' http://localhost:3000/api/contacts
curl -X PUT -H 'Content-Type: application/json' -d '{"email":"mail@gmail.com","phone":"215-123-1234","name":{"first":"newFirstName","last":"newLastName"}}' http://localhost:3000/api/contacts/:id
curl -X DELETE -H 'Content-Type: application/json' -d http://localhost:3000/api/contacts/:id
```
