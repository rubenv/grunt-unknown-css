'use strict';

var util = require('../lib/util');
var cssParse = require('../lib/css-parse');
var htmlParse = require('../lib/html-parse');

var addUnique = util.addUnique;
var arrayDifference = util.arrayDifference;

module.exports = function (grunt) {
    grunt.registerMultiTask('unknown_css', 'Detect undeclared CSS classes in your HTML.', function () {
        var cssNames = [];
        var htmlNames = [];

        function extract(parser, result, data) {
            var classes = parser.getClasses(data);
            classes.forEach(function (name) {
                addUnique(result, name);
            });
        }
        
        this.files.forEach(function (file) {
            file.src.forEach(function (filename) {
                if (!grunt.file.isFile(filename)) {
                    return;
                }

                var input = grunt.file.read(filename);
                if (filename.match(/\.(htm(|l)|php|phtml)$/)) {
                    extract(htmlParse, htmlNames, input);
                }
                if (filename.match(/\.css$/)) {
                    extract(cssParse, cssNames, input);
                }
            });
        });

        var useless = arrayDifference(htmlNames, cssNames);
        if (useless.length > 0) {
            grunt.fail.warn("Undefined CSS classes: " + useless.join(", ") + ".");
        }
    });
};
