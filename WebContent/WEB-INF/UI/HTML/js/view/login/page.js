define([
	'jquery',
	'underscore',
	'backbone',
	'hbs!../../template/login/layout',
	'view/header/header',
	'utils',
	'view/basemodal/BaseModal',
    'hbs!../../template/signup/signupmodalbody',
    'router/app-router',
    'event/dispatcher',
    'jCookie',
    'model/login'
], function($, _, Backbone, LoginPageLayout, Header, Utils, BaseModalView, SignupModalBody, Router, Dispatcher, jCookie, LoginStatus) {
	var LoginPage = Backbone.View.extend({
		el: "#main-content",
		initialize: function() {
			if(LoginStatus.get("isLoggedIn") === true){
				Router.__super__.navigate("#messages",{trigger: true});
			}
			Dispatcher.trigger("header:changeDocumentTitle", "Login");
		},
		events: {
			'click .signupAnchor':  'signup',
			'click #forgotpass': 'forgotpass',
			'click #loginSubmit': 'loginSubmit'
		},
		render: function() {
			this.$el.html(LoginPageLayout({}));
			$(".banner").hide();
			$(window).unbind('scroll');
			$('body').css("padding-top", "114px");
			Dispatcher.trigger("header:changeLoginText","SIGNUP NOW");
			
		},
        signup: function(e){
			e.stopPropagation();
			e.preventDefault();
			Dispatcher.trigger("header:showSignUp");        	
        },
        forgotpass: function(e){
        	e.stopPropagation();
			e.preventDefault();
        	Router.__super__.navigate("#forgotpass",{trigger: true});
        },
        loginSubmit: function(e){
        	e.stopPropagation();
			e.preventDefault();
			//if user credentials are authenticated route to messages
			// Set user id in the Login Module. which should be returned by the service.
        	this.loginSuccess();
        },
        loginSuccess: function(){
        	var loggedInUser = {
        	        "userId": 104,
        	        "username": "prashant",
        	        "dbUserRole": {
        	            "userRoleId": 3,
        	            "username": "prashant",
        	            "role": "ROLE_ADMIN",
        	            "token":"abc343aawadw9900"
        	        },
        	        "avatar": "avatar7",
        	        "userSecurities": [],
        	        "fname": "Prashant",
        	        "lname": "",
        	        "hostel": "",
        	        "year": "",
        	        "branch": "",
        	        "isLoggedIn": true
        	    };
        	var username=$(".loginForm #username").val();
			var pwd=$(".loginForm #password").val();
			$.ajax("http://localhost:8800/dost/user/authenticate?username="+username+"&password="+pwd).done(function(data){
				if(data.isLoggedIn=="true"){
					$.ajax("http://localhost:8800/dost/api/user/"+username).done(function(details){
						LoginStatus.set(details);
						LoginStatus.set({"isLoggedIn":true});
						$.cookie("loggedInUser", JSON.stringify(LoginStatus), {expires: 1000});
			        	Dispatcher.trigger("header:loggedIn");
			        	Router.__super__.navigate("#messages",{trigger: true});
					});
				}
			});
        	//LoginStatus.set(loggedInUser);
        	//$.cookie("loggedInUser", JSON.stringify(loggedInUser), {expires: 1000});
        	
        }
	});

	LoginPage.prototype.remove = function() {
		
		if(LoginStatus.get("isLoggedIn")!== true){
			$(".banner").show();
			Dispatcher.trigger("header:changeLoginText", "LOGIN");
			Dispatcher.trigger("header:bindBanner");
		}
	};
	LoginPage.prototype.clean = function() {
	};
	return LoginPage;
});