var assert = require('assert');
var parse = require('css-parse');
var CssSelectorParser = require('css-selector-parser').CssSelectorParser;
var util = require('./util');

var parseSelector = new CssSelectorParser();
parseSelector.registerNestingOperators('>', '+', '~');
parseSelector.registerAttrEqualityMods('^', '$', '*', '~');

var addUnique = util.addUnique;

function extractClassNames(obj, result) {
    if (obj.type === 'selectors') {
        for (var i = 0; i < obj.selectors.length; i++) {
            extractClassNames(obj.selectors[i], result);
        }
    } else if (obj.type === 'ruleSet') {
        extractClassNames(obj.rule, result);
    } else if (obj.type === 'rule') {
        if (obj.classNames) {
            for (var j = 0; j < obj.classNames.length; j++) {
                addUnique(result, obj.classNames[j]);
            }
        }

        if (obj.rule) {
            extractClassNames(obj.rule, result);
        }
    } else {
        throw new Error("Unknown type: " + obj.type);
    }
}

function extractClasses(selector) {
    var classes = [];

    var data = parseSelector.parse(selector);
    extractClassNames(data, classes);

    return classes;
}

module.exports = {
    getClasses: function (css) {
        var data = parse(css);
        var result = [];

        assert.equal(data.type, 'stylesheet');

        for (var i = 0; i < data.stylesheet.rules.length; i++) {
            var rule = data.stylesheet.rules[i];

            for (var j = 0; j < rule.selectors.length; j++) {
                var selector = rule.selectors[j];
                var names = extractClasses(selector);

                for (var k = 0; k < names.length; k++) {
                    addUnique(result, names[k]);
                }
            }
        }

        result.sort();
        return result;
    },

    extractClasses: extractClasses
};
