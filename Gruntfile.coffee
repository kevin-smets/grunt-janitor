#
# * grunt-janitor
# * https://github.com/kevin/grunt-janitor
# *
# * Copyright (c) 2014 Kevin Smets
# * Licensed under the MIT license.
# 
"use strict"
module.exports = (grunt) ->
  grunt.initConfig
    jshint:
      all: [
        "Gruntfile.js"
        "tasks/*.coffee"
        "<%= nodeunit.tests %>"
      ]
      options:
        jshintrc: ".jshintrc"

    clean:
      tests: ["tmp"]

  # Configuration to be run (and then tested).
    janitor:
      sass:
        options: {
          tests:
            noId:
              pattern: new RegExp('([^:] #|^#)')
              severity: 'error'
              condition: 'excluded'
              justifiable: 'yes'
              description: "Don't use ID selectors"

            noUnbufferedComments:
              pattern: new RegExp('(\/\\*)|(\\*\/)')
              severity: 'warning'
              condition: 'excluded'
              justifiable: 'no'
              description: "Only use unbuffered comments (// not /*)"

        }
        files: [
          expand: true
          src: ["**/*.sass"]
          cwd: "test/fixtures/"
        ]

      coffee:
        options: {
          tests:
            useStrict:
              pattern: 'use strict'
              severity: 'critical'
              condition: 'included'
              lines: [1]
              justifiable: 'no'
              description: "use strict has to be declared"

            noUnbufferedComments:
              pattern: '###'
              severity: 'warning'
              condition: 'excluded'
              justifiable: 'no'
              description: "Only use unbuffered comments (# not ###)"

        }
        files: [
          expand: true
          src: ["**/*.coffee"]
          cwd: "test/fixtures/"
        ]

  # Unit tests.
    nodeunit:
      tests: ["test/*_test.js"]

  grunt.loadTasks "tasks"
  grunt.loadNpmTasks "grunt-contrib-jshint"
  grunt.loadNpmTasks "grunt-contrib-clean"
  grunt.loadNpmTasks "grunt-contrib-nodeunit"

  #  grunt.registerTask('test', ['clean', 'janitor', 'nodeunit']);
  grunt.registerTask "test", [
#    "clean"
    "janitor:sass"
  ]
  return