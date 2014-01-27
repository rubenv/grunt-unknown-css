assert = require 'assert'

htmlParse = require '../lib/html-parse'

describe 'HTML Parser', ->
    it 'Extracts HTML classes', ->
        html = """
        <!DOCTYPE html>
        <html class="htmlclass">
            <head>
            </head>
            <body class="bodyclass">
                <div class="class1 class2">
                </div>
            </body>
        </html>
        """

        classes = htmlParse.getClasses(html)
        assert.deepEqual(classes, ['bodyclass', 'class1', 'class2', 'htmlclass'])

