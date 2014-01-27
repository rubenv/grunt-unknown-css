assert = require 'assert'

cssParse = require '../lib/css-parse'

describe 'CSS Parser', ->
    it 'Extracts CSS classes correctly', ->
        css = """
        .test {
            color: red;
        }
        """

        classes = cssParse.getClasses(css)
        assert.deepEqual(classes, ['test'])

    it 'Extracts multiple selectors', ->
        css = """
        .test, .test2 {
            color: red;
        }
        """

        classes = cssParse.getClasses(css)
        assert.deepEqual(classes, ['test', 'test2'])

    it 'Does not contain duplicates', ->
        css = """
        .test, .test2 {
            color: red;
        }

        .test {
            color: blue;
        }
        """

        classes = cssParse.getClasses(css)
        assert.deepEqual(classes, ['test', 'test2'])

    it 'Extracts complex selectors', ->
        css = """
        body.test, #bla.test2 {
            color: red;
        }

        p .test3 {
            color: blue;
        }
        """

        classes = cssParse.getClasses(css)
        assert.deepEqual(classes, ['test', 'test2', 'test3'])

    it 'Sorts class names', ->
        css = """
        p.zzz, div.aaa {
            color: red;
        }
        """

        classes = cssParse.getClasses(css)
        assert.deepEqual(classes, ['aaa', 'zzz'])

    it 'Handles comments', ->
        css = """
        /* Test */
        """

        classes = cssParse.getClasses(css)
        assert.deepEqual(classes, [])

    it 'Handles fonts', ->
        css = """
        @font-face {
          font-family: 'OTF Font Regular';
          src: url("../document-assets/fonts/minionpro/MinionPro-Regular.otf") format("opentype");
        }
        """

        classes = cssParse.getClasses(css)
        assert.deepEqual(classes, [])

    it 'Handles *', ->
        css = """
        * {
            color: red;
        }
        """

        classes = cssParse.getClasses(css)
        assert.deepEqual(classes, [])

    it 'Handles media queries', ->
        css = """
        @media (min-width: 768px) {
            .test {
                color: red;
            }
        }
        """

        classes = cssParse.getClasses(css)
        assert.deepEqual(classes, ['test'])

    it 'Handles minified CSS', ->
        css = """@charset "UTF-8";.red{color:red}"""

        classes = cssParse.getClasses(css)
        assert.deepEqual(classes, ['red'])

    describe 'Class extractor', ->
        it '.test', ->
            assert.deepEqual(cssParse.extractClasses('.test'), ['test'])

        it '.test, .test2', ->
            assert.deepEqual(cssParse.extractClasses('.test, .test2'), ['test', 'test2'])

        it 'body.test', ->
            assert.deepEqual(cssParse.extractClasses('body.test'), ['test'])

        it '#bla.test', ->
            assert.deepEqual(cssParse.extractClasses('#bla.test'), ['test'])

        it 'div.test + #id.test2', ->
            assert.deepEqual(cssParse.extractClasses('div.test + #id.test2'), ['test', 'test2'])
