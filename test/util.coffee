assert = require 'assert'

{arrayDifference} = require '../lib/util'

describe 'Util', ->
    it 'Can diff arrays', ->
        assert.deepEqual(arrayDifference([], []), [])
        assert.deepEqual(arrayDifference([3], []), [3])
        assert.deepEqual(arrayDifference([3], [3]), [])
        assert.deepEqual(arrayDifference([], [3]), [])

    it 'Can diff with regexes', ->
        assert.deepEqual(arrayDifference([3], [/3/]), [])
