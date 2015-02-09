var gulp       = require('gulp'),
  changed      = require('gulp-cached');

gulp.task('fonts', function() {
  var dest = "./public/"
  gulp.src(['./lib/fonts/*'])
    // .pipe(changed(dest)) // Turn this on for more efficient, but selective compiling.
    .pipe(changed(dest))
    .pipe(gulp.dest(dest));

});
