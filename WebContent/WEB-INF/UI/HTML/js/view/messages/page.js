define([
	'jquery',
	'underscore',
	'backbone',
	'lib/jquery-ui',
	'hbs!../../template/messages/layout',
	
	'event/dispatcher',
	'model/login',
	'utils',
	'router/app-router',
	'view/messages/messageCollectionView',
	'hbs!../../template/messages/welcomeMessage',
	'hbs!../../template/messages/nomessage',
    'hbs!../../template/messages/composeMsgModal',         
    'view/basemodal/BaseModal',     
	'handlebars'
], function($, _, Backbone,jqueryUi,MessagesPageLayout, Dispatcher, LoginStatus, Utils, Router, MessageCollectionView, WelcomeMessage, NoMessage, ComposeMsgModal, BaseModalView, Handlebars) {
	var MessagesPage = Backbone.View.extend({
		el: "#main-content",
		initialize: function() {
			if(LoginStatus.get("isLoggedIn") !== true){
				Router.__super__.navigate("#login",{trigger: true});
			}
			//$("#main-content").css("height", "700px");
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
			"click #chatsTab": "chatClicked",
			"click .compose-btn": "composeClicked",
		},
		render: function() {
			var self = this;
			this.$el.html(MessagesPageLayout({}));
			//console.log(LoginStatus);
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
				$.ajax(Utils.contextPath()+"/api/user/"+LoginStatus.get('userId')+"/unreadcount").done(function(data){
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
								url: Utils.contextPath()+"/api/user/"+LoginStatus.get('userId')+"/messages?state=closed"
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
							url: Utils.contextPath()+"/api/user/"+LoginStatus.get('userId')+"/messages?state=closed"
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
			
			$.ajax(Utils.contextPath()+"/api/user/"+LoginStatus.get('userId')+"/unreadcount").done(function(data){
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
							url: Utils.contextPath()+"/api/user/"+LoginStatus.get('userId')+"/messages?state=closed"
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
							url: Utils.contextPath()+"/api/user/"+LoginStatus.get('userId')+"/messages?state=closed"
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
					url: Utils.contextPath()+'/api/user/'+LoginStatus.get('userId')+'/sentmessages?state=closed'
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
		
		composeClicked: function(e){
			e.preventDefault();
			e.stopPropagation();
			var self = this;
			$modalBody = $('<div>').html(ComposeMsgModal);
			var signUpModal = new BaseModalView({
                title: "",
                headerHidden: true,
                className : 'modal fade compose-message-modal',
                buttonList: [
                    ['SEND NOW', function(modal, event){
                    	var self = this;
                    	var content = modal.$el.find("textarea").val().replace(/\n/g, '<br/>');
                    	var subject= modal.$el.find(".subject").val().replace(/\n/g, '<br/>');
                    	var recipients;
                    	$.ajax(Utils.contextPath()+"/api/user/"+$(".recipients").val()).done(function(details){
	                    	var url = Utils.contextPath()+"/api/user/message?subject="+subject+"&content="+content+"&recipients="+details.userId+"&senderId=" +LoginStatus.get('userId');
	                    	$.ajax({
	                    		type: "POST",
	                    		url: url
	                    	}).done(function(response){
	                    		console.log(response);
	                    		var note = response,
	                    			userName = response.user.username;
	                    		$("<div class='notes-info'>").append("<div class='notes-heading'>"+
	                    				note.note+"</div><div class='notes-date pull-right'>" +
	                    				userName +" " + Utils.getDateDiff(note.noteDate) + 
	                    				"</div>").prependTo("#notesContainer");
	                    		
	                    	});
	    				});
                    	modal.teardown();                    	
                    }.bind(self), 'option-btn composeMsg-send btn']
                ],
                body: $modalBody,
                //data: usernames
            });
        	signUpModal.show();
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
			$.ajax(Utils.contextPath()+"/api/user/"+LoginStatus.get('userId')+"/unreadcount").done(function(data){
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