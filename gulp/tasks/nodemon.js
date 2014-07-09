var gulp = require('gulp'),
  nodemon = require('gulp-nodemon');

gulp.task('nodemon', function() {
  nodemon({
    script: './backend/server.js',
    ext: 'js',
    env: {
      'NODE_ENV': 'development'
    }
  })
  .on('restart', function () {
    console.log('restarted!')
  })
});
