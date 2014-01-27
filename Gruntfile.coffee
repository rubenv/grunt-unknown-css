module.exports = (grunt) ->
    @loadNpmTasks('grunt-contrib-jshint')
    @loadNpmTasks('grunt-contrib-watch')
    @loadNpmTasks('grunt-mocha-cli')
    @loadNpmTasks('grunt-release')

    @loadTasks('tasks')

    @initConfig
        jshint:
            all: [ 'tasks/**.js', 'lib/**.js' ]
            options:
                jshintrc: '.jshintrc'

        watch:
            options:
                atBegin: true
            test:
                files: ['tasks/**.js', 'lib/**.js', 'test/*{,/*}.coffee']
                tasks: ['test']

        unknown_css:
            test: ['test/fixtures/**']

        mochacli:
            options:
                files: 'test/*_test.coffee'
                compilers: ['coffee:coffee-script']
            spec:
                options:
                    reporter: 'spec'

    @registerTask 'default', ['test']
    @registerTask 'build', ['jshint']
    @registerTask 'test', ['build', 'unknown_css', 'mochacli']
