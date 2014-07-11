/*
  Compile sass and output into build.
*/

var compass      = require('gulp-compass');
var gulp         = require('gulp');
var notify       = require('gulp-notify');
var handleErrors = require('../util/handleErrors');

gulp.task('compass', function() {
  return gulp.src('./client/css/*.sass')
    .pipe(compass({
      config_file: 'compass.rb',
      css: 'build',
      sass: 'client/css'
    }))
    .on('error', handleErrors);
});
