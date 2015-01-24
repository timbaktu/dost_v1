define([
	'jquery',
	'underscore',
	'backbone',
	'hbs!../../template/clients/layout',
	'utils',
	'view/basemodal/BaseModal',
    'router/app-router',
    'event/dispatcher',
    'model/login',
    'view/clients/clientCollectionView'
], function($, _, Backbone, ClientPageLayout, Utils, BaseModalView, Router, Dispatcher, LoginStatus, ClientCollectionView) {
	var ClientPage = Backbone.View.extend({
		el: "#main-content",
		initialize: function() {
			if(LoginStatus.get("isLoggedIn") !== true){
				Router.__super__.navigate("#login",{trigger: true});
			}
			if(LoginStatus.attributes.dbUserRole.role === "ROLE_USER"){
				Router.__super__.navigate("#messages",{trigger: true});
			}
			
			Dispatcher.trigger("header:changeDocumentTitle", "Client List");
			
		},
		events: {
			"keydown #filterClients": "filterClients"
		},
		render: function() {
			this.$el.html(ClientPageLayout({}));
			$(".banner").hide();
			$(window).unbind('scroll');
			$('body').css("padding-top", "114px");
			this.collectionView = new ClientCollectionView();
		},
		filterClients: function(e){
			console.log("textChanged");
			var self = this;
			_.defer(function(){
				var c = String.fromCharCode(e.which),
					
					fullString = $(e.target).val().toUpperCase(),
					
					filteredUsers = self.collectionView.collection.filter(function(user) {
						var fullname = user.get("fullname").toUpperCase(),
							username = user.get("username").toUpperCase();
						return fullname ? fullname.indexOf(fullString) >= 0 ? true: false: username.indexOf(fullString) >= 0 ? true: false;
				});
				
				self.collectionView.renderCollection(filteredUsers);
			});
			
		}
		
	});

	ClientPage.prototype.remove = function() {
		
	};
	ClientPage.prototype.clean = function() {
	};
	return ClientPage;
});