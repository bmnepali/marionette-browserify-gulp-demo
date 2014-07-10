/*
  Refresh browser when build directory is updated.
*/

var browserSync = require('browser-sync');
var gulp        = require('gulp');

gulp.task('browserSync', ['build'], function() {
  browserSync.init(['build/**'], {
    server: {
      baseDir: 'build'
    }
  });
});
