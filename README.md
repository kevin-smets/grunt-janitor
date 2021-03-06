# Disclaimer - alpha state

This project is still very much a WIP, the API can change drastically at any time until we consider it stable enough to label it as a beta.

[![Build Status](https://travis-ci.org/kevin-smets/grunt-janitor.png?branch=master)](https://travis-ci.org/kevin-smets/grunt-janitor)

# grunt-janitor

> Code pattern checker for grunt. Cleanup on aisle 4!

## Getting Started
This plugin requires Grunt `~0.4.0`

If you haven't used [Grunt](http://gruntjs.com/) before, be sure to check out the [Getting Started](http://gruntjs.com/getting-started) guide, as it explains how to create a [Gruntfile](http://gruntjs.com/sample-gruntfile) as well as install and use Grunt plugins. Once you're familiar with that process, you may install this plugin with this command:

```shell
npm install grunt-janitor --save-dev
```

Once the plugin has been installed, it may be enabled inside your Gruntfile with this line of JavaScript:

```js
grunt.loadNpmTasks('grunt-janitor');
```

## The "janitor" task

### Overview
In your project's Gruntfile, add a section named `janitor` to the data object passed into `grunt.initConfig()`.

```js
grunt.initConfig({
  janitor: {
    options: {
      // Task-specific options go here.
    },
    your_target: {
      // Target-specific file lists and/or options go here.
    },
  },
});
```

### Options

#### options.separator
Type: `String`
Default value: `',  '`

A string value that is used to do something with whatever.

#### options.punctuation
Type: `String`
Default value: `'.'`

A string value that is used to do something else with whatever else.

### Usage Examples

#### Default Options
In this example, the default options are used to do something with whatever. So if the `testing` file has the content `Testing` and the `123` file had the content `1 2 3`, the generated result would be `Testing, 1 2 3.`

```js
grunt.initConfig({
  janitor: {
    options: {},
    files: {
      'dest/default_options': ['src/testing', 'src/123'],
    },
  },
});
```

#### Custom Options
In this example, custom options are used to do something else with whatever else. So if the `testing` file has the content `Testing` and the `123` file had the content `1 2 3`, the generated result in this case would be `Testing: 1 2 3 !!!`

```js
grunt.initConfig({
  janitor: {
    options: {
      separator: ': ',
      punctuation: ' !!!',
    },
    files: {
      'dest/default_options': ['src/testing', 'src/123'],
    },
  },
});
```
## Report

```
npm install -g http-server
http-server
```

Then point your favorite browser to http://localhost:8080 (or 808X, depending on the one http-server reports).

TODO: The serve path has to become configurable

## Contributing
In lieu of a formal styleguide, take care to maintain the existing coding style. Add unit tests for any new or changed functionality. Lint and test your code using [Grunt](http://gruntjs.com/).

## Release History
v0.2.0 - refactor of the config
v0.1.1 - reporter v1
v0.1.0 - initial release
