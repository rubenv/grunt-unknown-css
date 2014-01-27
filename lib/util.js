module.exports = {
    addUnique: function (array, value) {
        if (array.indexOf(value) === -1) {
            array.push(value);
        }
    },

    arrayDifference: function (orig, diff) {
        var result = [];

        for (var i = 0; i < orig.length; i++) {
            var val = orig[i];
            if (diff.indexOf(val) === -1) {
                result.push(val);
            }
        }

        return result;
    }
};
