define([
    'backbone',
    'backbone-queryparams',
    'vm',
    'model/login'
], function(Backbone, BackboneQueryparams, Vm, LoginStatus) {

    var AppRouter = Backbone.Router.extend({

        initialize: function() {
            Backbone.history.start({
                root: "/resthub/"
            });
        },

        routes: {
            '': 'main',
            'messages': 'messages',
            'faq': 'faq',
            'faq/:faqId': 'faq',
            'login': 'login',
            'forgotpass': 'forgotpass',
            'dost': 'dost',
            'clients/:clientId': 'clients',
            'clients': 'clients',
            'quotes': 'quotes',
            'articles':'articles',
            'personalitytests':'tests',
            'destressing':'destressing',
            'Relationships':'Relationships',
            'addDetails':'addDetails',
            'changePass':'changePass',
            'talkToDost':'chatDost',
            'talkToDost/:userId':'chatDost',
            'discussions':'discussions',
            'counselling':'counselling',
            'education':'education',
            'experiences':'experiences',
            'marriage':'marriage',
            'parents':'parents'
        },

        main: function() {
            require(['view/app', 'view/home/page'], function(AppView, HomePage) {

                if (this.appMainView) {
                    this.appMainView.remove();
                }

                if (!this.appView) this.appView = new AppView();

                this.appMainView = Vm.create(this.appView, 'page', HomePage);
                this.appMainView.render();
            });
        },

        messages: function() {
            require(['view/app', 'view/messages/page', "backbone-paginator"], function(AppView, MessagePage, Paginator) {

                if (this.appMainView) {
                    this.appMainView.remove();
                }

                if (!this.appView) this.appView = new AppView();

                this.appMainView = Vm.create(this.appView, 'page', MessagePage);
                this.appMainView.render();

            });
        },

        faq: function(id) {
            require(['view/app', 'view/faq/page','view/faq/singleFaqPage'], function(AppView, FaqPage, SingleFaqPage) {

                if (this.appMainView) {
                    this.appMainView.remove();
                }

                if (!this.appView) this.appView = new AppView();

                this.appMainView = Vm.create(this.appView, 'page', FaqPage);
                if(id === undefined){
                    this.appMainView = Vm.create(this.appView, 'page', FaqPage);
                } else {
                	this.appMainView = Vm.create(this.appView, 'page', SingleFaqPage);
                }
                this.appMainView.render();

            });
        },
        login: function(){
        	require(['view/app', 'view/login/page'], function(AppView, LoginPage) {

                if (this.appMainView) {
                    this.appMainView.remove();
                }

                if (!this.appView) this.appView = new AppView();

                this.appMainView = Vm.create(this.appView, 'page', LoginPage);
                this.appMainView.render();

            });
        },
        forgotpass: function(){
        	require(['view/app', 'view/forgotpass/page'], function(AppView, LoginPage) {

                if (this.appMainView) {
                    this.appMainView.remove();
                }

                if (!this.appView) this.appView = new AppView();

                this.appMainView = Vm.create(this.appView, 'page', LoginPage);
                this.appMainView.render();

            });
        },
        dost: function(){
        	require(['view/app', 'view/yourdost/page'], function(AppView, DostPage) {

                if (this.appMainView) {
                    this.appMainView.remove();
                }

                if (!this.appView) this.appView = new AppView();

                this.appMainView = Vm.create(this.appView, 'page', DostPage);
                this.appMainView.render();

            });
        },        
        chatDost: function(id) {
            require(['view/app', 'view/chatDost/page','view/chatDost/chatPage'], function(AppView, chatOptions, chatPage) {

                if (this.appMainView) {
                    this.appMainView.remove();
                }

                if (!this.appView) this.appView = new AppView();

                this.appMainView = Vm.create(this.appView, 'page', chatOptions);
                if(id === undefined){
                    this.appMainView = Vm.create(this.appView, 'page', chatOptions);
                } else {
                	this.appMainView = Vm.create(this.appView, 'page', chatPage);
                }
                this.appMainView.render();

            });
        },
        clients: function(id){
        	require(['view/app', 'view/clients/page', 'view/clients/singleClientPage'], function(AppView, ClientPage, SingleClientPage) {
        		//alert(id);
                if (this.appMainView) {
                    this.appMainView.remove();
                }
                
                if (!this.appView) this.appView = new AppView();
                if(id === undefined){
                    this.appMainView = Vm.create(this.appView, 'page', ClientPage);
                } else {
                	this.appMainView = Vm.create(this.appView, 'page', SingleClientPage);
                }
                this.appMainView.render();
            });
        },
        quotes: function(){
        	require(['view/app', 'view/quotes/page'], function(AppView, DostPage) {

                if (this.appMainView) {
                    this.appMainView.remove();
                }

                if (!this.appView) this.appView = new AppView();

                this.appMainView = Vm.create(this.appView, 'page', DostPage);
                this.appMainView.render();

            });
        },
        articles: function(){
        	require(['view/app', 'view/articles/page'], function(AppView, articles) {

                if (this.appMainView) {
                    this.appMainView.remove();
                }

                if (!this.appView) this.appView = new AppView();

                this.appMainView = Vm.create(this.appView, 'page', articles);
                this.appMainView.render();

            });
        },
        tests: function(){
        	require(['view/app', 'view/personalitytests/page'], function(AppView, tests) {

                if (this.appMainView) {
                    this.appMainView.remove();
                }

                if (!this.appView) this.appView = new AppView();

                this.appMainView = Vm.create(this.appView, 'page', tests);
                this.appMainView.render();

            });
        },
        destressing: function(){
        	require(['view/app', 'view/destressing/page'], function(AppView, tests) {

                if (this.appMainView) {
                    this.appMainView.remove();
                }

                if (!this.appView) this.appView = new AppView();

                this.appMainView = Vm.create(this.appView, 'page', tests);
                this.appMainView.render();

            });
        },
        Relationships: function(){
        	require(['view/app', 'view/Relationships/page'], function(AppView,Relationships) {

                if (this.appMainView) {
                    this.appMainView.remove();
                }

                if (!this.appView) this.appView = new AppView();

                this.appMainView = Vm.create(this.appView, 'page', Relationships);
                this.appMainView.render();

            });
        },
        addDetails: function(){
        	require(['view/app', 'view/addDetails/page'], function(AppView, addDetails) {

                if (this.appMainView) {
                    this.appMainView.remove();
                }

                if (!this.appView) this.appView = new AppView();

                this.appMainView = Vm.create(this.appView, 'page', addDetails);
                this.appMainView.render();

            });
        },
        changePass: function(){
        	require(['view/app', 'view/changePass/page'], function(AppView, changePass) {

                if (this.appMainView) {
                    this.appMainView.remove();
                }

                if (!this.appView) this.appView = new AppView();

                this.appMainView = Vm.create(this.appView, 'page', changePass);
                this.appMainView.render();

            });
        },
        discussions: function(){
        	require(['view/app', 'view/discussions/page'], function(AppView,discussions) {

                if (this.appMainView) {
                    this.appMainView.remove();
                }

                if (!this.appView) this.appView = new AppView();

                this.appMainView = Vm.create(this.appView, 'page',discussions);
                this.appMainView.render();

            });
        },
        counselling: function(){
        	require(['view/app', 'view/counselling/page'], function(AppView,counselling) {

                if (this.appMainView) {
                    this.appMainView.remove();
                }

                if (!this.appView) this.appView = new AppView();

                this.appMainView = Vm.create(this.appView, 'page',counselling);
                this.appMainView.render();

            });
        },
        education: function(){
        	require(['view/app', 'view/education/page'], function(AppView,education) {

                if (this.appMainView) {
                    this.appMainView.remove();
                }

                if (!this.appView) this.appView = new AppView();

                this.appMainView = Vm.create(this.appView, 'page',education);
                this.appMainView.render();

            });
        },
        experiences: function(){
        	require(['view/app', 'view/experiences/page'], function(AppView,experiences) {

                if (this.appMainView) {
                    this.appMainView.remove();
                }

                if (!this.appView) this.appView = new AppView();

                this.appMainView = Vm.create(this.appView, 'page',experiences);
                this.appMainView.render();

            });
        },
        marriage: function(){
        	require(['view/app', 'view/marriage/page'], function(AppView,marriage) {

                if (this.appMainView) {
                    this.appMainView.remove();
                }

                if (!this.appView) this.appView = new AppView();

                this.appMainView = Vm.create(this.appView, 'page',marriage);
                this.appMainView.render();

            });
        },
        parents: function(){
        	require(['view/app', 'view/parents/page'], function(AppView,parents) {

                if (this.appMainView) {
                    this.appMainView.remove();
                }

                if (!this.appView) this.appView = new AppView();

                this.appMainView = Vm.create(this.appView, 'page',parents);
                this.appMainView.render();

            });
        }
    });

    return AppRouter;

});