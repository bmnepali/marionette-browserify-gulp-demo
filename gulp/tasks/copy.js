/*
  Move HTML files out of client and into build.
*/

var gulp = require('gulp');

gulp.task('copy', function() {
  return gulp.src('client/html/**')
    .pipe(gulp.dest('build'));
});
