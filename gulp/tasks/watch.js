/*
  Watch for changes in the sass, images, and html directories and run respective task.
  The browserify task already watches for changes in the client code.
*/

var gulp = require('gulp');

gulp.task('watch', ['setWatch', 'browserSync', 'test'], function() {
  gulp.watch('client/css/**', ['compass']);
  gulp.watch('client/images/**', ['images']);
  gulp.watch('client/html/**', ['copy']);
  gulp.watch(['client/javascript/**/*.coffee', 'mockApi/**/*.js', 'test/**/*.coffee'], ['test']);
  // Note: The browserify task handles js recompiling with watchify
});
