/*
  Run all build tasks.
*/

var gulp = require('gulp');

gulp.task('build', ['browserify', 'compass', 'images', 'fonts', 'copy']);
