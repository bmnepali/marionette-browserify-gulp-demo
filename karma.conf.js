module.exports = {
// module.exports = function(config) {
  // config.set({
  // base path, that will be used to resolve files and exclude
  basePath: '.',

  frameworks: ['jasmine'],
  // frameworks: ['jasmine', 'browserify'],

  // list of files / patterns to load in the browser
  files: [
    // 'build/test/app.js'
    'build/test/app.js'
  ],

  // list of files to exclude
  // exclude: [
  //   'client/javascript/initialize.js'
  // ],

  preprocessors: {
    // '**/*.coffee': ['coffee']
    // 'test/**/*': ['browserify'],
    // 'client/javascript/**/*': ['browserify']
    // '**/*.js': ['commonjs']
    // 'client/javascript/**/*.js': ['commonjs', 'coverage'],
    // 'client/javascript/demo/**/*.coffee': ['coffee', 'commonjs', 'coverage'],
    // 'test/client/**/*.coffee': ['coffee', 'commonjs', 'coverage']
  },

  // use dots reporter, as travis terminal does not support escaping sequences
  // possible values: 'dots', 'progress'
  // CLI --reporters progress
  reporters: ['mocha', 'coverage'],

  // web server port
  // CLI --port 9876
  port: 9876,

  // enable / disable colors in the output (reporters and logs)
  // CLI --colors --no-colors
  colors: true,

  // enable / disable watching file and executing tests whenever any file changes
  // CLI --auto-watch --no-auto-watch
  autoWatch: true,

  // Start these browsers, currently available:
  // - Chrome
  // - ChromeCanary
  // - Firefox
  // - Opera
  // - Safari (only Mac)
  // - PhantomJS
  // - IE (only Windows)
  // CLI --browsers Chrome,Firefox,Safari
  // browsers: [process.env.TRAVIS ? 'Firefox' : 'Chrome'],
  browsers: ['PhantomJS'],

  // If browser does not capture in given timeout [ms], kill it
  // CLI --capture-timeout 5000
  captureTimeout: 20000,

  // Auto run tests on start (when browsers are captured) and exit
  // CLI --single-run --no-single-run
  singleRun: false,

  // report which specs are slower than 500ms
  // CLI --report-slower-than 500
  reportSlowerThan: 500,

  // coffeePreprocessor: {
  //   // options passed to the coffee compiler
  //   options: {
  //     bare: true,
  //     sourceMap: false
  //   },
  //   // transforming the filenames
  //   transformPath: function(path) {
  //     return path.replace(/\.coffee$/, '.js');
  //   }
  // },

  // browserify: {
  //   extensions: ['.coffee'],
  //   transform: ['coffeeify'],
  //   watch: true,
  //   debug: true
  // },

  plugins: [
    'karma-jasmine',
    "karma-coverage",
    // "karma-browserify",
    "karma-coffee-preprocessor",
    "karma-phantomjs-launcher",
    "karma-mocha-reporter",
    'karma-commonjs'
  ]
};
                // });
                //   };
