assert = require 'assert'

{arrayDifference} = require '../lib/util'

describe 'Unknown CSS', ->
    it 'Compares used classes to declarations.', ->
        cssNames = ['a', 'b']
        htmlNames = ['a', 'b', 'c']

        diff = arrayDifference(htmlNames, cssNames)
        assert.deepEqual(diff, ['c'])
