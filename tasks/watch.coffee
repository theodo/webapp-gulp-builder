module.exports = (gulp, config) ->

  gulp.task 'watch', ['compile', 'static'], ->
    gulp.watch config.input.coffee, ['compile:coffee']
    gulp.watch config.input.less.watch, ['compile:less']
    gulp.watch config.input.jade, ['compile:jade']
    gulp.watch config.input.template, ['compile:template']
    gulp.watch config.input.vendor.watch, ['compile:vendor']
    if config.input.loopback.enabled
      gulp.watch config.input.loopback.watch, ['compile:loopback']
    statics = []
    for key, value of config.input.static
      statics = statics.concat value
    gulp.watch statics, ['static']