define([ 'jquery', 
         'backbone',
         'underscore',
         'model/login',
         'hbs!../../template/messages/message',
         'hbs!../../template/messages/messageExpanded',
         'utils',
         'hbs!../../template/messages/expandedSingleMessage',
         'hbs!../../template/messages/addNoteModalBody',         
         'view/basemodal/BaseModal',
         'event/dispatcher',
         'jquery-notebook'
         ],
function($, Backbone, _, LoginStatus, messageTemplate, messageExpandedTemplate, Utils, SingleMessage, addNoteModalBody, BaseModalView, Dispatcher, jNotebook) {
	
	var MessageView = Backbone.View.extend({
		template : messageExpandedTemplate,
		tagName : 'div',
		className: "",
		events : {
			'click #expandedMessageReplyBot': 'replyBot',
			'click #expandedMessageDelete': 'deleteMessage',
			'click #expandedMessageReplyTop': 'replyTop',
			'click #addNote': 'addNote'
		},
		replyBot: function(e){
			e.preventDefault();
			var self = this,
				subject = self.subject,
				msgId = self.msgId,
				recipients = self.recipientList,
				userId = require("model/login").attributes.userId,
				content = $(".reply-box").html().replace(/contenteditable="true"/g, ''),
				url = "http://localhost:8800/dost/api/user/message?subject="+subject+ 
					"&content="+content+"&recipients="+recipients+"&senderId="+userId+"&msgId="+ msgId;
			
			$.ajax({
				type: "POST",
				url: url
			}).done(function(){
				//alert("Message sent");
				$(".reply-box").html("");
				var message = {
					content: content,
					sentDate: moment().format("YYYY-MM-DD h:mm:ss"),
					sender: {
						avatar: require("model/login").attributes.avatar,
						username: require("model/login").attributes.username
					}
				};
				$("#expandedMessageContainer").append(SingleMessage(message));
				Dispatcher.trigger("message:updateUnreadCount");
			});
		},
		deleteMessage: function(e){
			e.preventDefault();
			console.log("Delte Clicked");
		},
		replyTop: function(e){
			e.preventDefault();
			e.stopPropagation();
			$('html, body').animate({
		        scrollTop: $(document).height()
		    }, 'slow');
			console.log("Reply Top Clicked");
		},
		addNote: function(e){
			e.preventDefault();
			e.stopPropagation();
			var self = this;
			
			$modalBody = $('<div>').html(addNoteModalBody);
			var signUpModal = new BaseModalView({
                title: "",
                headerHidden: true,
                className : 'modal fade add-note-modal',
                buttonList: [
                    ['Ok', function(modal, event){
                    	var self = this;
                    	var note = modal.$el.find("textarea").val().replace(/\n/g, '<br/>');
                    	
                    	var url = "http://localhost:8800/dost/api/notes/add?userId="+require("model/login").attributes.userId+
                    	"&messageId="+ self.messageId+
                    	"&note="+note+
                    	"&noteDate="+ moment().format("YYYY-MM-DD h:mm:ss") +
                    	"&msgId=" + self.msgId;
                    	$.ajax({
                    		type: "POST",
                    		url: url
                    	}).done(function(response){
                    		var note = response,
                    			userName = response.user.username;
                    		$("<div class='notes-info'>").append("<div class='notes-heading'>"+
                    				note.note+"</div><div class='notes-date pull-right'>" +
                    				userName +" " + Utils.getDateDiff(note.noteDate) + 
                    				"</div>").prependTo("#notesContainer");
                    		
                    	});
                    	modal.teardown();
                    	
                    }.bind(self), 'option-btn pull-right btn']
                ],
                body: $modalBody
            });
        	signUpModal.show();
        	
        	
		},				
		initialize : function(options) {
			var self = this;
			this.$rootel = options.$rootel;
			this.msgId = options.msgId;
			this.subject = options.subject;
			this.count = options.count;
			this.isClient = options.isClient;
			self.recipientList = "";
			self.render();
		},	
		render : function() {
			var self = this;
			self.$rootel.children().hide();
			this.$rootel.append(this.$el.html(this.template({
				subject: this.subject,
				count: this.count,
				isClient: this.isClient
			})));
			$.ajax("http://localhost:8800/dost/api/msgId/"+self.msgId+"/notes/all").done(function(response){
				_.each(response, function(note){					
					$("<div class='notes-info'>").append("<div class='notes-heading'>"+note.note+"</div><div class='notes-date pull-right'>" +note.userName +" " + Utils.getDateDiff(note.noteDate) + "</div>").prependTo("#notesContainer");
				});
			});
			$.ajax("http://localhost:8800/dost/api/message/"+self.msgId+"/").done(function(response){
				_.each(response, function(message){
					//var unreadMessages = 
					_.each(message.recipients, function(recp){
						if(recp.viewed == 0 && recp.messageRecipientId ==require("model/login").attributes.userId){
							//Dispatcher.trigger("message:decreaseCount");
							
						}
					});
					self.messageId = message.messageId;
					$.ajax("http://localhost:8800/dost/api/message/"+message.msgId+"/user/"+require("model/login").attributes.userId+"/markasread").done(function(){
						Dispatcher.trigger("message:updateUnreadCount");
					});
					$("#expandedMessageContainer").append(SingleMessage(message));
					if(require("model/login").attributes.userId != message.sender.userId){
						self.recipientList = self.recipientList ==""? self.recipientList +
								message.sender.userId: self.recipientList +","+ message.sender.userId;
					}
					
				});
			});
			$('.reply-box').notebook({
                autoFocus: false,
                placeholder: '...'
            });
			return this;
		},
		removeView: function () {
			this.remove();
		}
	});
	return MessageView;
});
