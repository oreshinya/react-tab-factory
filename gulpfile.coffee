gulp = require "gulp"

gulp.task "buildExample", ->
  source     = require "vinyl-source-stream"
  browserify = require "browserify"

  browserify "./example/index.cjsx", extensions: [".cjsx"]
    .transform "coffee-reactify"
    .bundle()
    .pipe source("bundle.js")
    .pipe gulp.dest("./example")
