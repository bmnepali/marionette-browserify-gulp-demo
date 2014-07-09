var gulp = require('gulp');

gulp.task('copy', function() {
	return gulp.src('client/htdocs/**')
		.pipe(gulp.dest('build'));
});
