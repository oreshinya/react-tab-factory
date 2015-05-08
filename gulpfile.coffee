#gulp = require "gulp"
#
#gulp.task "build", ->
#  source     = require "vinyl-source-stream"
#  browserify = require "browserify"
#
#  browserify "index.js", paths: ['./node_modules', './src']
#    .transform "coffee-reactify"
#    .bundle()
#    .pipe source("bundle.js")
#    .pipe gulp.dest("./example")
