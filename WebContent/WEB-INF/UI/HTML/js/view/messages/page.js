define([
	'jquery',
	'underscore',
	'backbone',
	'hbs!../../template/messages/layout',
	'event/dispatcher',
	'model/login',
	'router/app-router',
	'view/messages/messageCollectionView',
	'hbs!../../template/messages/welcomeMessage',
	'hbs!../../template/messages/nomessage',
	'handlebars'
], function($, _, Backbone, MessagesPageLayout, Dispatcher, LoginStatus, Router, MessageCollectionView, WelcomeMessage, NoMessage, Handlebars) {
	var MessagesPage = Backbone.View.extend({
		el: "#main-content",
		initialize: function() {
			if(LoginStatus.get("isLoggedIn") !== true){
				Router.__super__.navigate("#login",{trigger: true});
			}
			$("#main-content").css("height", "700px");
			// if unread message count = 0 then show no message page
			// if unread message count > 0 then show inbox page
			// if signup user, show welcome message
			
			Dispatcher.on("message:decreaseCount", _.partial(this.decreaseCount, self));
			Dispatcher.on("message:updateUnreadCount", this.updateUnreadCount );
			Dispatcher.trigger("header:changeDocumentTitle", "Messages");
			
		},
		events: {
			"click #inboxTab": "inboxClicked",
			"click #sentTab": "sentClicked",
			"click #chatsTab": "chatClicked"
				
		},
		render: function() {
			var self = this;
			this.$el.html(MessagesPageLayout({}));
			$(".banner").hide();
			$(window).unbind('scroll');
			$('body').css("padding-top", "114px");
			var root = $(".wel-message"),
				container = $("#messageBoxContainer");
			if(LoginStatus.get("firstTimeUser") == true){
				// render welcome message
				// remove firstTimeUser from LoginStatus.
				
				if(root.hasClass("inbox-message")){
					root.removeClass("inbox-message");
				}
				if(!container.hasClass("col-md-8")){
					container.addClass("col-md-8");
				}
				
				LoginStatus.unset("firstTimeUser");
				$("#inbox").html(WelcomeMessage({}));
				
				
			} else {
				$.ajax("http://localhost:8800/dost/api/user/"+LoginStatus.get('userId')+"/unreadcount").done(function(data){
					if((data[""+LoginStatus.get('userId')+""] === 0)){
						if(root.hasClass("inbox-message")){
							root.removeClass("inbox-message");
						}
						if(!container.hasClass("col-md-8")){
							container.addClass("col-md-8");
						}
						$("#inbox").html(NoMessage({}));
						$(".load-old").click(function(e){
							e.preventDefault();
							self.changeUnreadCount(data[""+LoginStatus.get('userId')+""]);
							if(!root.hasClass("inbox-message")){
								root.addClass("inbox-message");
							}
							if(container.hasClass("col-md-8")){
								container.removeClass("col-md-8");
							}
							// render inbox
							
							self.inboxCollectionView == new MessageCollectionView({
								el: "#inbox",
								url: "http://localhost:8800/dost/api/user/"+LoginStatus.get('userId')+"/messages?state=closed"
							});
						});
					} else {
						
						self.changeUnreadCount(data[""+LoginStatus.get('userId')+""]);
						if(!root.hasClass("inbox-message")){
							root.addClass("inbox-message");
						}
						if(container.hasClass("col-md-8")){
							container.removeClass("col-md-8");
						}
						// render inbox
						
						self.inboxCollectionView == new MessageCollectionView({
							el: "#inbox",
							url: "http://localhost:8800/dost/api/user/"+LoginStatus.get('userId')+"/messages?state=closed"
						});
					}
				});
			}
			
			
		},
		inboxClicked: function(){
			console.log("Inbox clicked");
			// activate messageCollectionView with inbox messages in #inbox
			$("#inbox").show();
			$("#sent").empty().hide();
			$("#myChats").empty().hide();
			window.scrollTo(0,0);
			var self = this;
			var root = $(".wel-message"),
			container = $("#messageBoxContainer");
			
			$.ajax("http://localhost:8800/dost/api/user/"+LoginStatus.get('userId')+"/unreadcount").done(function(data){
				if((data[""+LoginStatus.get('userId')+""] === 0)){
					if(root.hasClass("inbox-message")){
						root.removeClass("inbox-message");
					}
					if(!container.hasClass("col-md-8")){
						container.addClass("col-md-8");
					}
					$("#inbox").html(NoMessage({}));
					$(".load-old").click(function(e){
						e.preventDefault();
						self.changeUnreadCount(data[""+LoginStatus.get('userId')+""]);
						if(!root.hasClass("inbox-message")){
							root.addClass("inbox-message");
						}
						if(container.hasClass("col-md-8")){
							container.removeClass("col-md-8");
						}
						// render inbox
						
						self.inboxCollectionView == new MessageCollectionView({
							el: "#inbox",
							url: "http://localhost:8800/dost/api/user/"+LoginStatus.get('userId')+"/messages?state=closed"
						});
					});
				} else {
					
					self.changeUnreadCount(data[""+LoginStatus.get('userId')+""]);
					if(!root.hasClass("inbox-message")){
						root.addClass("inbox-message");
					}
					if(container.hasClass("col-md-8")){
						container.removeClass("col-md-8");
					}
					// render inbox
					
					if( !self.inboxCollectionView){
						self.inboxCollectionView = new MessageCollectionView({
							el: "#inbox",
							url: "http://localhost:8800/dost/api/user/"+LoginStatus.get('userId')+"/messages?state=closed"
						});
					} else {
						self.inboxCollectionView.bindFetchOnScroll(self.inboxCollectionView);
						self.inboxCollectionView.collection.fetch({remove: false, add: true});
					}
				}
			});
			
			
		},
		sentClicked: function(){
			console.log("Sent clicked");
			window.scrollTo(0,0);
			//activate messageCollectionView with sent messages in #sent
			$("#inbox").empty().hide();
			$("#sent").show();
			$("#myChats").hide().hide();
			var self = this;
			var root = $(".wel-message"),
			container = $("#messageBoxContainer");
			
			if(!root.hasClass("inbox-message")){
				root.addClass("inbox-message");
			}
			if(container.hasClass("col-md-8")){
				container.removeClass("col-md-8");
			}
			
			if( !self.sentCollectionView){
				self.sentCollectionView = new MessageCollectionView({
					el: "#sent",
					url: 'http://localhost:8800/dost/api/user/'+LoginStatus.get('userId')+'/sentmessages?state=closed'
				});
			} else {
				self.sentCollectionView.bindFetchOnScroll(self.sentCollectionView);
				self.sentCollectionView.collection.fetch({remove: false, add: true});
			}
		},
		chatClicked: function(){
			console.log("Chat clicked");
			window.scrollTo(0,0);
			$("#inbox").empty().hide();
			$("#sent").empty().hide();
			$("#myChats").show();
			//activate messageCollectionView with chat messages in #myChats
		},
		changeUnreadCount: function(count){
			self.unreadCount = count;
			var unreadCountText = count == 0 ? "" : "(" + count + ")";
			$("#unreadCount").text(unreadCountText);
		},
		decreaseCount: function(self){
			self.unreadCount = self.unreadCount - 1;
			self.unreadCount = self.unreadCount < 0? 0: self.unreadCount;
			
			var unreadCountText = self.unreadCount == 0 ? "" : "("+self.unreadCount + ")";
			$("#unreadCount").text(unreadCountText);
		},
		updateUnreadCount: function(){
			$.ajax("http://localhost:8800/dost/api/user/"+LoginStatus.get('userId')+"/unreadcount").done(function(data){
				var unreadCountText = data[LoginStatus.get('userId')] == 0 ? "" : "("+data[LoginStatus.get('userId')]+")";
				$("#unreadCount").text(unreadCountText);
			});
		}
	});

	MessagesPage.prototype.remove = function() {

	};
	MessagesPage.prototype.clean = function() {
		$("#main-content").css("height", "auto");
		//$(".banner").show();
		//Dispatcher.trigger("header:bindBanner");
		Dispatcher.off("message:updateUnreadCount" );
		Dispatcher.off("message:decreaseCount", _.partial(this.decreaseCount, self));
	};
	return MessagesPage;
});