var cheerio = require('cheerio');
var util = require('./util');

var addUnique = util.addUnique;

module.exports = {
    getClasses: function (html) {
        var result = [];

        var $ = cheerio.load(html);
        $('*').each(function (index, n) {
            var node = $(n);

            var classes = node.attr('class');
            if (classes) {
                var classNames = classes.split(' ');
                for (var i = 0; i < classNames.length; i++) {
                    addUnique(result, classNames[i]);
                }
            }
        });

        result.sort();
        return result;
    }
};
