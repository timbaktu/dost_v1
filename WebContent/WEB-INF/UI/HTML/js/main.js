// Set the require.js configuration for your application.
require.config({

    shim: {
        'underscore': {
            exports: '_'
        },
        'underscore-string': {
            deps: [
                'underscore'
            ]
        },
        'handlebars-orig': {
            exports: 'Handlebars'
        },
        'jqueryui': {
            deps: ['jquery']
        },
        'backbone': {
            deps: [
                'underscore',
                'underscore-string',
                'jquery'
            ],
            exports: 'Backbone'
        },
        'backbone-datagrid': {
            deps: [
                'backbone'
            ],
            exports: 'Backbone.Datagrid'
        },
        'backbone-paginator': {
            deps: [
                'backbone'
            ],
            exports: 'Backbone.Paginator'
        },
        'bootstrap': {
            deps: [
                'jquery'
            ]
        },
        'backbone-queryparams': {
            deps: [
                'backbone'
            ]
        },
        'backbone-associations': {
            deps: [
                'backbone'
            ]
        },
        'keymaster': {
            exports: 'key'
        },
        'async': {
            exports: 'async'
        },
        'jCookie': {
        	deps: ['jquery']
        },
        'jquery-notebook':{
        	deps: ['jquery']
        },
        'sieve':{
        	deps:['jquery']
        }
    },

    // Libraries
    paths: {
        jquery: 'lib/jquery',
        jqueryui: 'lib/jquery-ui.min',
        "jCookie": 'lib/jquery.cookie',
        underscore: 'lib/underscore',
        'underscore-string': 'lib/underscore-string',
        backbone: 'lib/backbone',
        resthub: 'lib/resthub/resthub',
        
        text: 'lib/text',
        i18n: 'lib/i18n',
        'utils': 'utils',
        'bootstrap': 'lib/bootstrap',
        'backbone-validation-orig': 'lib/backbone-validation',
        'backbone-validation': 'lib/resthub/backbone-validation-ext',
        'handlebars-orig': 'lib/handlebars',
        'handlebars': 'lib/resthub/handlebars-helpers',
        'backbone-queryparams': 'lib/backbone-queryparams',
        'backbone-datagrid': 'lib/backbone-datagrid',
        'backbone-paginator': 'lib/backbone.paginator',
        'backbone-associations': 'lib/backbone-associations',
        'backbone-localstorage': 'lib/backbone-localstorage',
        'jquery-notebook': 'lib/jquery-notebook',
        'vm':'vm',
        'sieve': 'lib/jquery.sieve.min',
        async: 'lib/async',
        keymaster: 'lib/keymaster',
        hbs: 'lib/resthub/require-handlebars',
        moment: 'lib/moment',
        template: '../template',
		json2: 'lib/json2',
        console: 'lib/resthub/console'
    }
    //urlArgs: "bust=" + (new Date()).getTime()
});

// Load our app module and pass it to our definition function
require(['console', 'app']);
