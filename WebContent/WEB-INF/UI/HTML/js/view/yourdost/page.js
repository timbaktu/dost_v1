define([
	'jquery',
	'underscore',
	'backbone',
	'hbs!../../template/yourdost/layout',
	'utils',
	'view/basemodal/BaseModal',
    'router/app-router',
    'event/dispatcher',
    'model/login',
    'view/yourdost/counselorCollectionView'
], function($, _, Backbone, CounselorPageLayout, Utils, BaseModalView, Router, Dispatcher, LoginStatus, CounselorCollectionView) {
	var CounselorPage = Backbone.View.extend({
		el: "#main-content",
		initialize: function() {
			if(LoginStatus.get("isLoggedIn") !== true){
				Router.__super__.navigate("#login",{trigger: true});
			}
			if(LoginStatus.attributes.dbUserRole.role === "ROLE_USER"){
				Router.__super__.navigate("#messages",{trigger: true});
			}
			
			Dispatcher.trigger("header:changeDocumentTitle", "Your Dost");
			
			Handlebars.registerHelper('eq', function(val, val2, opts) {
			      if(val == val2){
			        return opts.fn(this);
			      }
			    });
			
		},
		events: {
			"keydown #filterConselors": "filterConselors"
		},
		render: function() {
			$.ajax("http://localhost:8800/dost/api/codes/all").done(function(response){
				$("#main-content").html(CounselorPageLayout({objects:response}));
				$(".banner").hide();
				$(window).unbind('scroll');
				$('body').css("padding-top", "114px");
				this.collectionView = new CounselorCollectionView();
			});
		},
		filterConselors: function(e){
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

	CounselorPage.prototype.remove = function() {
		
	};
	CounselorPage.prototype.clean = function() {
	};
	return CounselorPage;
});