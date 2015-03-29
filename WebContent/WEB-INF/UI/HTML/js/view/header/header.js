define([
    'jquery',
    'underscore',
    'backbone',
    'jqueryui',
    'bootstrap',
    'hbs!../../template/header/layout',
    'router/app-router',
    'utils',
    'view/basemodal/BaseModal',
    'hbs!../../template/signup/signupmodalbody',
    'event/dispatcher',
    'model/login'
], function($, _, Backbone, JqueryUI, Bootstrap, headerLayoutTemplate, Router, Utils, BaseModalView, SignupModalBody, Dispatcher, LoginStatus) {
    var HeaderView = Backbone.View.extend({
        el: 'header',
        initialize: function() {
	    	var self = this;
	    	self.feedbackShown = false;
	    	Dispatcher.on("header:changeLoginText",this.changeLoginText);
	    	Dispatcher.on("header:bindBanner",this.bindBanner);
	    	Dispatcher.on("header:showSignUp",_.partial(this.showSignUp, this));
	    	Dispatcher.on("header:loggedIn",_.partial(this.loggedIn, this));
	    	Dispatcher.on("header:changeDocumentTitle",this.changeDocumentTitle);
	    	
	    },
        events: {
        	'click .login-btn': 'loginClicked',
        	'click .banner-signup': 'showSignUpBanner',
        	'click .feedback': 'showHideFeedback',
        	'click .navbar-brand': 'homeClicked',
        	'click .navbar-nav>li': 'navLinksClick'
        },
        render: function() {
            this.$el.html(headerLayoutTemplate({}));

            this.bindBanner();
            if(LoginStatus.get("isLoggedIn") == true){
            	console.log(LoginStatus);
            	this.loggedIn(this);
            }
        },
        navLinksClick: function(e,target){
        	 if (window.innerWidth <= 768 ) {
        	    	 //$(".navbar-collapse").collapse('hide');
        		 //alert(2);
        		  }
        		  else {
        			    $('.nav li a').click(function(e) {

        			        $('.nav li').removeClass('active');

        			        var $parent = $(this).parent();
        			        if (!$parent.hasClass('active')) {
        			            $parent.addClass('active');
        			        }
        			        //e.preventDefault();
        			    });
        			}
        	//$(".navbar-collapse").collapse('hide');
        	
        },
        loginClicked: function(e,target){
        	var text = $(e.target).text();
        	if(text == "LOGIN"){
        		Router.__super__.navigate("#login",{trigger: true});
        	} else if (text == "SIGNUP NOW") {
        		this.showSignUp(this);
        	} else if (text == "Logout"){
        		this.logout()
        	}
        	
        },
        showSignUpBanner: function(){        	
        	this.showSignUp(this);
        },
        
        showSignUp: function(self){
        	var signupModalBodyHtml = SignupModalBody({}),
	            $modalBody = $('<div/>').html(signupModalBodyHtml),
	            selectOne = $modalBody.find("#questionOne"),
	            selectTwo = $modalBody.find("#questionTwo"),
	            hiddenQuestionOne,
	            hiddenQuestionTwo;
	    	$modalBody.find("#username").val($(".bannerLargeinput").val());
	    	
			$.ajax(Utils.contextPath()+"/api/securityquestions/all").done(function(response){
				_.each(response, function(question, index){
					var selectedOne = index == 0 ? 'selected="selected"': '';
					var selectedTwo = index == 1 ? 'selected="selected"': '';
					
					selectOne.append('<option value="'+ question.questionId +'" '+ selectedOne +'>'+ question.question +'</option>');
					selectTwo.append('<option value="'+ question.questionId +'" '+ selectedTwo +'>'+ question.question +'</option>');
					
					if(index == 0){						
						hiddenQuestionTwo = selectTwo.find('option[value="'+ question.questionId +'"]').hide();
					} else if (index == 1){
						hiddenQuestionOne = selectOne.find('option[value="'+ question.questionId +'"]').hide();
					}
	
				});
				selectOne.change(function(e){
					if(hiddenQuestionTwo){
						hiddenQuestionTwo.show();
					}
					hiddenQuestionTwo = selectTwo.find('option[value="'+ this.value +'"]').hide();
				});
				selectTwo.change(function(e){
					
					if(hiddenQuestionOne){
						hiddenQuestionOne.show();
					}
					hiddenQuestionOne = selectOne.find('option[value="'+ this.value +'"]').hide();
				});
				
				$modalBody.find("#securityQuestions").hide();
				$modalBody.find("#emailOption").show();
				
				$modalBody.find('input[type=radio][name=optionsRadios]').change(function (e) {
					var currentTarget = $(e.target);
					if(currentTarget.val() == "email"){
						$("#securityQuestions").hide();
						$("#emailOption").show();
					} else {
						$("#securityQuestions").show();
						$("#emailOption").hide();
					}
				});
				$modalBody.find(".tos-open").click(function(e){
					e.preventDefault();
					Dispatcher.trigger("footer:showTos");
				});
				
				
				
	        	var signUpModal = new BaseModalView({
	                title: "Hi,<br/>Don't worry, whatever it is.. we can fix it together. Get Started!",
	                className : 'modal fade signupForm in',
	                buttonList: [
	                    ['SIGNUP NOW', self.signUpSuccess, 'btn btn-lg']
	                ],
	                body: $modalBody
	            });
	        	signUpModal.show();
			}).fail(function(error){
				
			});

        },
        signUpSuccess: function(modal, event){
        	console.log("Sign up");
        	modal.teardown();
        	// router change. add cookie. set firstTimeUser. close the dialog.
        	var self = this;
        	var loggedInUser = {
        	        "userId": 103,
        	        "username": "sohil",
        	        "dbUserRole": {
        	            "userRoleId": 4,
        	            "username": "sohil",
        	            "role": "ROLE_USER"
        	        },
        	        "avatar": "avatar5",
        	        "userSecurities": [],
        	        "fname": "Sohil",
        	        "lname": "Khan",
        	        "hostel": "Kaveri",
        	        "year": "2010",
        	        "branch": "ECE",
        	        "isLoggedIn": true
        	    };
        	
        	
        	LoginStatus.set(loggedInUser);
        	LoginStatus.set({"firstTimeUser": true});
        	$.cookie("loggedInUser", JSON.stringify(loggedInUser), {expires: 1000});
        	Dispatcher.trigger("header:loggedIn");
        	Router.__super__.navigate("#messages",{trigger: true});
        },
        changeLoginText: function(text){
        	$(".login-btn").text(text).addClass("red-btn");
        },
        
        bindBanner: function () {
            var self = this;
            self.headerSmall = false;
            $(window).scroll(function(){
                var scroll = $(window).scrollTop();
                
                if( scroll > 0 && self.headerSmall == false){
                    /*
                    $( ".bannerLarge" ).switchClass( "bannerLarge", "bannerSmall", 1000 );
                    $( ".bannerLargehand" ).switchClass( "bannerLargehand", "bannerSmallhand", 1000 );
                    $( ".bannerLargesadPerson" ).switchClass( "bannerLargesadPerson", "bannerSmallsadPerson", 1000 );
                    $( ".bannerLargep" ).switchClass( "bannerLargep", "bannerSmallp", 1000 );
                    $( ".bannerLargeform" ).switchClass( "bannerLargeform", "bannerSmallform", 1000 );
                    $( ".bannerLargeinput" ).switchClass( "bannerLargeinput", "bannerSmallinput", 1000 );
                    $( ".bannerLargebutton" ).switchClass( "bannerLargebutton", "bannerSmallbutton", 1000 );
                    */
                    
                            
                    $(".banner").stop().animate({'height': '170px'});
                    $("body").stop().animate({'padding-top': '380px'});
                    $(".banner > p").stop().animate({
                        'top': '120px',
                        'font-size': '14px',
                        'height': '100px'
                    });
                    $(".banner > p >span").fadeOut();
                    $(".banner > form").stop().animate({
                        'top': '145px',
                        'left': '378px'
                    });
                    $(".banner > .sadPerson").stop().animate({
                        top: '117px',
                        left: '258px',
                        height: '147px'
                    });

                    $(".banner .bannerLargeinput").stop().animate({
                        'padding': '9px 148px 7px 20px',
                        'font-size': '16px'
                    });
                    $(".banner .banner-signup").stop().animate({
                        'padding': '9px 48px 8px 24px',
                        'font-size': '20px'
                    });
                    $(".banner > .hand").stop().animate({
                        top: '88px',
                        right: '163px',
                        height: '106px'
                    });

                    self.headerSmall = true;
                    
                } else if (scroll === 0){
                    /*
                    $( ".bannerSmall" ).switchClass( "bannerSmall", "bannerLarge", 1000 );
                    $( ".bannerSmallhand" ).switchClass( "bannerSmallhand", "bannerLargehand", 1000 );
                    $( ".bannerSmallsadPerson" ).switchClass( "bannerSmallsadPerson", "bannerLargesadPerson", 1000 );
                    $( ".bannerSmallp" ).switchClass( "bannerSmallp", "bannerLargep", 1000 );
                    $( ".bannerSmallform" ).switchClass( "bannerSmallform", "bannerLargeform", 1000 );
                    $( ".bannerSmallinput" ).switchClass( "bannerSmallinput", "bannerLargeinput", 1000 );
                    $( ".bannerSmallbutton" ).switchClass( "bannerSmallbutton", "bannerLargebutton", 1000 );
                    */
                    $(".banner").stop().animate({'height': '350px'});
                    $("body").stop().animate({'padding-top': '500px'});

                    $(".banner > p").stop().animate({
                        'top': '222px',
                        'font-size': '20px',
                        'left': '27%'
                    });
                    $(".banner > p >span").fadeIn();
                    $(".banner > form").stop().animate({
                        'top': '345px',
                        'left': '378px'
                    });
                    $(".banner > .sadPerson").stop().animate({
                        top: '150px',
                        left: '185px',
                        height: '228px'
                    });
                    $(".banner  .bannerLargeinput").stop().animate({
                        'padding': '20px 160px 15px 20px',
                        'font-size': '20px'
                    });
                    $(".banner .banner-signup").stop().animate({
                        'padding': '19px 48px 16px 24px',
                        'font-size': '20px'
                    });
                    $(".banner > .hand").stop().animate({
                        top: '82px',
                        right: '225px',
                        height: '130px'
                    });
                    self.headerSmall = false;                    
                }
            });
        },
        
        loggedIn: function(self){
        	// show messages,
        	// change name to
        	var messageNav = self.$el.find("#messagesNav"),
        		volunteerNav = self.$el.find("#volunteer"),
        		userDetailsNav = self.$el.find("#userDetails"),
        		clientListNav = self.$el.find("#clientListNav"),
        		yourdostNav = self.$el.find("#yourdost");
        		talkToDostNav=self.$el.find("#talkToDost");
        	
        	if(clientListNav.hasClass("hidden") && !(LoginStatus.attributes.dbUserRole.role == "ROLE_USER")){
        		clientListNav.removeClass("hidden");
        	}
        	if(talkToDostNav.hasClass("hidden") && (LoginStatus.attributes.dbUserRole.role == "ROLE_USER")){
        		talkToDostNav.removeClass("hidden");
        	}
        	if(userDetailsNav.hasClass("hidden")){
        		userDetailsNav.removeClass("hidden");
        	}
        	
        	if(!volunteerNav.hasClass("hidden")){
        		volunteerNav.addClass("hidden");
        	}
        	if(messageNav.hasClass("hidden")){
        		messageNav.removeClass("hidden");
        	}
        	if(LoginStatus.attributes.dbUserRole.role == "ROLE_ADMIN"){
        		yourdostNav.addClass("hidden");
        	}
        	userDetailsNav.find("#dropdownName").text(LoginStatus.get("username"));
        	
        	self.changeLoginText("Logout");
        	$(".banner").hide();
			$(window).unbind('scroll');
			$('body').css("padding-top", "114px");
        },
        logout: function(){
        	var self = this,
        		messageNav = this.$el.find("#messagesNav"),
        		volunteerNav = self.$el.find("#volunteer"),
        		userDetailsNav = self.$el.find("#userDetails"),
        		clientListNav = self.$el.find("#clientListNav"),
        		yourdostNav = self.$el.find("#yourdost");
    			talkToDostNav=self.$el.find("#talkToDost");
        	
        	if(!clientListNav.hasClass("hidden")){
        		clientListNav.addClass("hidden");
        	}
        	if(!talkToDostNav.hasClass("hidden")){
        		talkToDostNav.addClass("hidden");
        	}
        	
        	$.removeCookie("loggedInUser");
        	this.changeLoginText("LOGIN");
        	LoginStatus.clear();
        	if(!messageNav.hasClass("hidden")){
        		messageNav.addClass("hidden");
        	}
        	if(volunteerNav.hasClass("hidden")){
        		volunteerNav.removeClass("hidden");
        	}
        	if(!userDetailsNav.hasClass("hidden")){
        		userDetailsNav.addClass("hidden");
        	}
        	if(yourdostNav.hasClass("hidden")){
        		yourdostNav.removeClass("hidden");
        	}
        	userDetailsNav.find("#dropdownName").empty();
        	Router.__super__.navigate("#login",{trigger: true});
        },
        changeDocumentTitle: function(title){
        	document.title = title;        	
        },
        showHideFeedback: function(){
        	var self = this;
        	
        	if(self.feedbackShown === true){
        		//hide
        		//$(".feedback-container").animate({right:"-500px"});
        		//self.feedbackShown = false;
        		
        	} else {
        		//show
        		//$(".feedback-container").animate({right:"0px"});
        		//self.feedbackShown = true;
        	}
        	
        },
        homeClicked: function(e){
        	e.preventDefault();
        	if(LoginStatus.get("isLoggedIn") === true){
        		Router.__super__.navigate("#messages",{trigger: true});
        	} else {
        		Router.__super__.navigate("#",{trigger: true});
        	}
        	
        }
        
    });
    HeaderView.prototype.remove = function() {
    	
	};
	
	HeaderView.prototype.clean = function() {
		Dispatcher.off("header:changeLoginText");
		Dispatcher.off("header:bindBanner",this.bindBanner);
		Dispatcher.off("header:showSignUp",this.showSignUp);
		Dispatcher.off("header:loggedIn",this.loggedIn);
		Dispatcher.off("header:changeDocumentTitle",this.changeDocumentTitle);
	};
    return HeaderView;
});
