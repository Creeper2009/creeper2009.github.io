gulp      = require "gulp"
stylus    = require "gulp-stylus"
plumber   = require "gulp-plumber"
jade      = require "gulp-jade"
csso      = require "gulp-csso"
locals    = require "./locals"

gulp.task "stylus", ->
  gulp.src "stylus/*.styl"
    .pipe(do plumber)
    .pipe(stylus
      compress: yes)
    .pipe(do csso)
    .pipe(gulp.dest "css/")
 
gulp.task "jade", ->
  gulp.src '*.jade'
    .pipe(jade
      pretty: true
      locals: {locals: locals})
    .pipe(gulp.dest '.')

gulp.task "watch", ->
  gulp.watch "stylus/*.styl", ["stylus"]
  gulp.watch "*.jade", ["jade"]

gulp.task "default", ["stylus", "jade"]
