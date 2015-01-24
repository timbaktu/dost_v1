define(['jquery',
        'backbone',
        'underscore',
        'event/dispatcher',
        'hbs!../../template/clients/singleHistoryMessage',
        'hbs!../../template/clients/messageHistoryView',
        'hbs!../../template/messages/addNoteModalBody',
        'view/basemodal/BaseModal',
        'utils'
    ],
function($, Backbone, _, Dispatcher, SingleHistoryMessage, MessageHistoryTemplate, addNoteModalBody, BaseModalView, Utils) {
    var MessageHistoryView = Backbone.View.extend({
        events: {},
        tagName: "div",
        template: MessageHistoryTemplate,
        className: "col-md-12 orange-line",
        initialize: function(options) {
            var self = this;
            self.messages = options.message;
        },
        events: {
        	"click .client-detail-add-note": "addNote",
        	"click .client-detail-reply": "reply"
        },
        addNote: function(e){
        	e.preventDefault();
        	var self = this;
        		msgId = self.messages[0]? self.messages[0].msgId: "",
        		messageId = self.messages[0]? self.messages[0].msgId: "";
    		
    		$modalBody = $('<div>').html(addNoteModalBody);
			var signUpModal = new BaseModalView({
                title: "",
                headerHidden: true,
                className : 'modal fade add-note-modal',
                buttonList: [
                    ['Ok', function(modal, event){
                    	var self = this;
                    	var note = modal.$el.find("textarea").val().replace(/\n/g, '<br/>');
                    	if(note !== ""){
                    		var url = "http://localhost:8800/dost/api/notes/add?userId="+require("model/login").attributes.userId+
                        	"&messageId="+ messageId+
                        	"&note="+note+
                        	"&noteDate="+ moment().format("YYYY-MM-DD h:mm:ss") +
                        	"&msgId=" + msgId;
                        	$.ajax({
                        		type: "POST",
                        		url: url
                        	}).done(function(response){
                        		var note = response,
                        			userName = response.user.username;
                        		
                        		Dispatcher.trigger("clientHistory:noteAdd", response);
                        		//$("<div class='notes-info'>").append("<div class='notes-heading'>"+
                        		//		note.note+"</div><div class='notes-date pull-right'>" +
                        		//		userName +" " + Utils.getDateDiff(note.noteDate) + 
                        		//		"</div>").prependTo("#notesContainer");
                        		
                        	});
                        	
                    	}
                    	
                    	modal.teardown();
                    }.bind(self), 'option-btn pull-right btn']
                ],
                body: $modalBody
            });
        	signUpModal.show();
        },
        reply: function(e){
        	e.preventDefault();
        	var self = this;
	    		msgId = self.messages[0]? self.messages[0].msgId: "",
	    		messageId = self.messages[0]? self.messages[0].messageId: "",
				subject = self.messages[0]? self.messages[0].subject: "",		
	    		userId = require("model/login").attributes.userId,
	    		self.recipientList = "";
	    			
    			_.each(self.messages, function(message){					
					if(require("model/login").attributes.userId != message.sender.userId){
						self.recipientList = self.recipientList ==""? self.recipientList +
								message.sender.userId: self.recipientList +","+ message.sender.userId;
					}					
				});
			
			$modalBody = $('<div>').html(addNoteModalBody);
			var signUpModal = new BaseModalView({
	            title: "",
	            headerHidden: true,
	            className : 'modal fade add-note-modal',
	            buttonList: [
	                ['Ok', function(modal, event){
	                	var self = this;
	                	var content = modal.$el.find("textarea").val().replace(/\n/g, '<br/>');
	                	if(content !== ""){
	                		var url = "http://localhost:8800/dost/api/user/message?subject="+subject+ 
	    					"&content="+content+"&recipients="+self.recipientList+"&senderId="+userId+"&msgId="+ msgId;
	                		
	                    	$.ajax({
	                    		type: "POST",
	                    		url: url
	                    	}).done(function(response){
	                    		var message = {
                					content: content,
                					sentDate: moment().format("YYYY-MM-DD h:mm:ss"),
                					sender: {
                						username: require("model/login").attributes.username
                					}
                				};
	                    		self.$el.append(SingleHistoryMessage(message));
	                    		
	                    	});
	                    	
	                	}
	                	
	                	modal.teardown();
	                }.bind(self), 'option-btn pull-right btn']
	            ],
	            body: $modalBody
	        });
	    	signUpModal.show();
        },
        render: function() {
            var self = this;
            var subject = self.messages[0]? self.messages[0].subject: "",
            	id = self.messages[0]? self.messages[0].msgId: "";
            //get number of messages
            var messageCount = self.messages.length > 0 ? "(" + self.messages.length + ")" : "";
            this.$el.html(this.template({
            	subject: subject,
            	messageCount: messageCount,
            	id: "message" + id
            }));
            _.each(self.messages, function(message){
            	
            	self.$el.append(SingleHistoryMessage(message));
            });
            return this;
        }
    });
    return MessageHistoryView;
});