/*
  Run all build tasks.
*/

var gulp = require('gulp');

gulp.task('build', ['browserifyTests', 'browserify', 'compass', 'images', 'copy']);
