Marionette Browserify Gulp Demo
============

Includes the following tools, tasks, and workflows:

- Marionette (from bower)
- Browserify (with browserify-shim)
- Watchify (caching version of browserify for super fast rebuilds)
- Nodemon (reloads mock API server)
- Compass
- CoffeeScript (with source mapping!)
- Handlebars (as a backbone dependency)
- Non common-js vendor code (like a jQuery plugin)
- LiveReload
- Static Server
- Image optimization
- Error Notifications in Notification Center
- Express (from npm)
- Karma with Mocha tests using Browserify to bundle a test runner.
- Test coverage using Istanbul through Karma-coverage.

Also includes the following demo apps:

- Todo demo (Marionetteify)
- Library app demonstrating search feature (backbone.marionette-atinux-books)
- Contacts demo using backbone.localStorage("Marionette: A Gentle Introduction" book)
- Contacts demo using a rails remote server ("Marionette: A Serious Progression" book)
- Contacts demo using remote server + backgrid + backbone.paginator

If you've never used Node or npm before, you'll need to install Node.
If you use homebrew, do:
```
brew install node
```

Otherwise, you can download and install from [here](http://nodejs.org/download/).

### Install Gulp Globally
Gulp must be installed globally in order to use the command line tools.
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

### Run gulp with mock API
```
gulp withMockApi
```
Note: Requires MongoDB running in the backgound.

### Run Contacts App with Rails Backend
Download Rails app - https://github.com/dqdinh/marionette-serious-progression-server/tree/make-CORS-work
NOTE: This was forked from David Sulc's repo and modified to make CORS work.
```
bundle install
rake db:migrate
rake fake:contacts
```

### Run gulp with Tests / Coverage Reports
Make sure you've required all your tests in 'test/runner.coffee'.
In a new window, you can run.

TODO: make this run automatically whenever changes occur in src and client
code.

```
gulp test
```

### Testing Mock API endpoints
```
curl http://localhost:3000/api/contacts
curl -X POST -H 'Content-Type: application/json' -d '{"email":"mail@gmail.com","phone":"215-123-1234","name":{"first":"firstName","last":"lastName"}}' http://localhost:3000/api/contacts
curl -X PUT -H 'Content-Type: application/json' -d '{"email":"mail@gmail.com","phone":"215-123-1234","name":{"first":"newFirstName","last":"newLastName"}}' http://localhost:3000/api/contacts/:id
curl -X DELETE -H 'Content-Type: application/json' -d http://localhost:3000/api/contacts/:id
```

### Sources
- http://viget.com/extend/gulp-browserify-starter-faq
- http://kroltech.com/2013/12/boilerplate-web-app-using-backbone-js-expressjs-node-js-mongodb/
- http://scotch.io/tutorials/javascript/build-a-restful-api-using-node-and-express-4
- https://github.com/davidsulc/marionette-gentle-introduction
- https://github.com/davidsulc/marionette-serious-progression-app
- https://github.com/davidsulc/structuring-backbone-with-requirejs-and-marionette
- https://github.com/JSteunou/marionetteify
- https://github.com/davidsulc/backbone.marionette-atinux-books
