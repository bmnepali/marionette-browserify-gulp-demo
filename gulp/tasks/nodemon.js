/*
  Watch for changes in the mock API server and reload the node server.
*/

var gulp = require('gulp'),
  nodemon = require('gulp-nodemon');

gulp.task('nodemon', function() {
  nodemon({
    script: './mockApi/server.js',
    ext: 'js',
    env: {
      'NODE_ENV': 'development'
    }
  })
  .on('restart', function () {
    console.log('restarted!')
  })
});
