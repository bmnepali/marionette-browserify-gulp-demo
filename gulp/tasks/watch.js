var gulp = require('gulp');

gulp.task('watch', ['setWatch', 'browserSync'], function() {
  gulp.watch('client/sass/**', ['compass']);
  gulp.watch('client/images/**', ['images']);
  gulp.watch('client/htdocs/**', ['copy']);
  // Note: The browserify task handles js recompiling with watchify
});
