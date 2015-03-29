define([
	'jquery',
	'underscore',
	'backbone',
	'hbs!../../template/chatDost/chat',
    'hbs!../../template/chatDost/composeMsgModal',
    'hbs!../../template/chatDost/feedback',
    'hbs!../../template/chatDost/chatWindow',
    'view/basemodal/BaseModal',
	'utils',
	'lib/porthole',
	'event/dispatcher',
	'model/login'
], function($, _, Backbone, chatDostLayout, ComposeMsgModal,feedback, ChatWindow, BaseModalView, Utils,Porthole, Dispatcher, LoginStatus) {
	var chatDostPage = Backbone.View.extend({
		el: "#main-content",
		initialize: function() {
			
			// body...
		},
		events: {
			"click .email":"composeMsg",
			"click .chat": "chatClicked",
			"click .feedback-chat":"feedbackClicked"		},
		render: function() {
			//var guestDomain = '52.74.32.140:80';
			//console.log(1);
			//var windowProxy1;
			//  windowProxy1 = new Porthole.WindowProxy('http://sandbox.ternarylabs.com/porthole/proxy.html');
			//windowProxy1.addEventListener(this.feedbackClicked);

			$.ajax(Utils.contextPath()+"/api/counselors/all").done(function(response){
				$("#main-content").html(chatDostLayout({objects:response}));
				$(".banner").hide();
				$(window).unbind('scroll');
				$('body').css("padding-top", "114px");
				$(".chat-section").html(ChatWindow({"username":LoginStatus.get('username')}));
			});
			/*
				var guestDomain = '52.74.32.140:80';
				
				function onMessage1(messageEvent) {  
					if (messageEvent.origin == "http://" + guestDomain) {
						if (messageEvent.data["color"]) {
							document.body.bgColor = messageEvent.data["color"];
						}
						if (messageEvent.data["expanded"]) {
							el = document.getElementById('chatFrame');
							el.setAttribute('height', "250px");
						} else {
							el = document.getElementById('chatFrame');
							el.setAttribute('height', "150px");
						}
					}
				}

				
				
				var windowProxy1;
				window.onload=function(){ 
						// Create a proxy window to send to and receive message from the guest iframe
						windowProxy1 = new Porthole.WindowProxy('http://' + guestDomain + '/webchat/proxy.html', 'chatFrame');
						windowProxy1.addEventListener(onMessage1);

						
				}; */
			
		},
		chatClicked: function(e){
			e.preventDefault();
			e.stopPropagation();
			console.log($("#chatFrame"));
		},
		feedbackClicked: function(e){
			e.preventDefault();
			e.stopPropagation();
			var self = this;
			$modalBody = $('<div>').html(feedback());
			var msgToDost = new BaseModalView({
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
			msgToDost.show();
		},
		composeMsg: function(e){
			e.preventDefault();
			e.stopPropagation();
			var self = this;
			var status={
					"recipient":$(e.target).closest(".dost").attr("id")
			}
			$modalBody = $('<div>').html(ComposeMsgModal(status));
			var msgToDost = new BaseModalView({
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
			msgToDost.show();
		}
	});

	chatDostPage.prototype.remove = function() {
		$(".banner").show();
		Dispatcher.trigger("header:bindBanner");
	};
	chatDostPage.prototype.clean = function() {

	};
	return chatDostPage;
});
