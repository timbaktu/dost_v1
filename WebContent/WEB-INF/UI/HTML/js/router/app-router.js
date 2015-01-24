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
            'clients': 'clients'
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
        	require(['view/app', 'view/dost/page'], function(AppView, DostPage) {

                if (this.appMainView) {
                    this.appMainView.remove();
                }

                if (!this.appView) this.appView = new AppView();

                this.appMainView = Vm.create(this.appView, 'page', DostPage);
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
        }
    });

    return AppRouter;

});