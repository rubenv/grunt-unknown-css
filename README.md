# grunt-unknown-css

> Detect undeclared CSS classes in your HTML.

[![Build Status](https://travis-ci.org/rubenv/grunt-unknown-css.png?branch=master)](https://travis-ci.org/rubenv/grunt-unknown-css)

```
$ grunt unknown_css
Running "unknown_css:all" (unknown_css) task
Warning: Undefined CSS classes: deprecated, spellign_mistake. Use --force to continue.

Aborted due to warnings.
```

## Getting Started
This plugin requires Grunt `~0.4.0`

If you haven't used [Grunt](http://gruntjs.com/) before, be sure to check out the [Getting Started](http://gruntjs.com/getting-started) guide, as it explains how to create a [Gruntfile](http://gruntjs.com/sample-gruntfile) as well as install and use Grunt plugins. Once you're familiar with that process, you may install this plugin with this command:

```shell
npm install grunt-unknown-css --save-dev
```

One the plugin has been installed, it may be enabled inside your Gruntfile with this line of JavaScript:

```js
grunt.loadNpmTasks('grunt-unknown-css');
```

## The "unknown_css" task

Detect undeclared CSS classes in your HTML.

### Overview
In your project's Gruntfile, add a section named `unknown_css` to the data object passed into `grunt.initConfig()`.

```js
grunt.initConfig({
  unknown_css: {
    all: {
      files: ['views/*.html', 'css/*.css']
    }
  },
})
```

This will parse all the class names from the css files in the `css` folder and match them with all the HTML files in the `views` folder. Any class name that's used in the HTML files, which doesn't exist in the CSS files, will be shown.

### Options

#### options.whitelist
Type: `Array`
Default value: `'[]'`

A set of class names that should be allowed, even though they don't exist in the CSS files. You can also supply regexes here.

```js
grunt.initConfig({
  unknown_css: {
    options: {
      whitelist: [ 'valid', /\{\{.*\}\}/ ]
    },
    all: {
      files: ['views/*.html', 'css/*.css']
    }
  },
})
```

The whitelist above will allow the use of the `valid` class, as well as classes such as `icon-{{name}}`.

## Contributing
In lieu of a formal styleguide, take care to maintain the existing coding style. Add unit tests for any new or changed functionality. Lint and test your code using [Grunt](http://gruntjs.com/).

## License 

    (The MIT License)

    Copyright (C) 2014 by Ruben Vermeersch <ruben@savanne.be>

    Permission is hereby granted, free of charge, to any person obtaining a copy
    of this software and associated documentation files (the "Software"), to deal
    in the Software without restriction, including without limitation the rights
    to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
    copies of the Software, and to permit persons to whom the Software is
    furnished to do so, subject to the following conditions:

    The above copyright notice and this permission notice shall be included in
    all copies or substantial portions of the Software.

    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
    AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
    LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
    OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
    THE SOFTWARE.
