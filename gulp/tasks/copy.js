/*
  Move HTML files out of client and into build.
*/

var gulp = require('gulp');

gulp.task('copy', function() {
  return gulp.src('client/htdocs/**')
    .pipe(gulp.dest('build'));
});
