/*
  Run tests using tape and show output using faucet.
*/

var gulp = require('gulp');
var shell = require('gulp-shell');

gulp.task('test', function () {
  return gulp.src('tests/*.js', {read: false})
    .pipe(shell([
      'tape tests/* | faucet'
    ]))
})
