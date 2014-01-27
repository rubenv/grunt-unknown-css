module.exports = {
    addUnique: function (array, value) {
        if (array.indexOf(value) === -1) {
            array.push(value);
        }
    },

    arrayDifference: function (orig, diff) {
        var result = [];
        var excludes = [];
        var regexes = [];

        diff.forEach(function (exclude) {
            if (exclude instanceof RegExp) {
                regexes.push(exclude);
            } else {
                excludes.push(exclude);
            }
        });

        orig.forEach(function (val) {
            if (excludes.indexOf(val) > -1) {
                return;
            }

            var excluded = regexes.some(function (regex) {
                return regex.test(val);
            });

            if (!excluded) {
                result.push(val);
            }
        });

        return result;
    }
};
