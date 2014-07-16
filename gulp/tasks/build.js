/*
  Run all build tasks.
*/

var gulp = require('gulp');

// gulp.task('build', ['browserify', 'compass', 'images', 'copy']);

gulp.task('build', ['browserifyDevelopment', 'compass', 'images', 'copy']);
