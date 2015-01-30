define([
	'jquery',
	'underscore',
	'backbone',
	'hbs!../../template/clients/singleClientLayout',
	'utils',
	'view/basemodal/BaseModal',
    'router/app-router',
    'event/dispatcher',
    'model/login',
    'hbs!../../template/messages/expandedSingleMessage',
    'view/clients/messageHistoryView',
    'view/clients/chatHistoryView',
    'view/clients/noteView',
    'sieve'
], function($, _, Backbone, SingleClientPageLayout, Utils, BaseModalView, Router, Dispatcher, LoginStatus, SingleMessageTemplate, MessageHistoryView, ChatHistoryView, NoteView, Sieve) {
	var SingleClientPage = Backbone.View.extend({
		el: "#main-content",
		initialize: function() {
			if(LoginStatus.get("isLoggedIn") !== true){
				Router.__super__.navigate("#login",{trigger: true});
			}
			var self= this;
			Dispatcher.trigger("header:changeDocumentTitle", "Client Details");
			Dispatcher.on("clientHistory:noteAdd", _.partial(this.noteAdd, self));
		},
		events: {
			'click #gotoClientList': 'gotoClientList',
			'click .add-detailBtn': 'addDetails'
		},
		addDetails: function(){
			var self = this;
			var branch = self.$el.find("#userDetailBranch").val(),
				year =self.$el.find("#userDetailYear").val(),
				fname = self.$el.find("#userFirstName").val(),
				lname = self.$el.find("#userLastName").val(),
				hostel = self.$el.find("#userDetailHostel").val();
			var url = "http://localhost:8800/dost/api/userdetail/add?fname="+fname+
				"&lname="+lname+"&hostel="+hostel+"&year="+year+"&branch="+branch+"&userId="+ this.getId();
			$.ajax({
				type: "POST",
				url: url
			}).done(function(response){
				self.$el.find("#clientDetailsName").text("NAME: "+ response.fname +" "+ response.lname);
				self.$el.find("#clientDetailsYear").text("YEAR: " + response.year);
				self.$el.find("#clientDetailsFirstName").text(response.fname);
				
			});
		},
		gotoClientList: function(){
			Router.__super__.navigate("#clients",{trigger: true});
		},
		render: function() {
			var data = this.getData();			
			$.ajax("http://localhost:8800/dost/api/user/"+this.getId()+"/patienthistory/all").done(function(data){
				console.log(data);
			});
			this.user = data["1412223651665"]["chat"].user;
			this.$el.html(SingleClientPageLayout({
				fname: this.user.fname,
				fullname: this.user.fname + " " + this.user.lname,
				year: this.user.year
			}));
			
			
			this.renderHistory();
			
			$(".banner").hide();
			$(window).unbind('scroll');
			$('body').css("padding-top", "168px");
			
		},
		renderMessages: function(messages){
			var self = this;
			var container = self.$el.find("#messageContainer");
			// loop through all message threads and instantiate a messageHistoryView.
			_.each(messages, function(message) {
				container.append((new MessageHistoryView({model: message})).render().$el);
                // append this to the collectionview
            });
		},
		getId:function(){
			var url= window.location.href.split("/");
			var useridIndex=url.length-1;
			var userId=url[useridIndex];
			return userId;
		},
		renderHistory: function(){
			// loop through all chat threads and instantiate a chatHistoryView
			var self = this;
			var data = self.getData();
			var container = self.$el.find("#historyContainer");
			_.each(data, function(history) {
				if(history.message!= undefined){
					container.append((new MessageHistoryView({message: history.message})).render().$el);
				} else {
					container.append((new ChatHistoryView({chat: history.chat})).render().$el);
					
				}
			
				
                // append this to the collectionview
            });
			var historyContainer = self.$el.find("#historyContainer");
			historyContainer.sieve({ itemSelector: ".sieve-history", searchInput: $("#searchPatientHistory") });
			//var searchDiv = historyContainer.prev();
			//("#historyContainer").prev().hide();
			$.ajax("http://localhost:8800/dost/api/user/141/notes/all").done(function(response){
				_.each(response, function(note){
					self.noteAdd(self, note);
				});
				
			});
		},
		
		noteAdd: function(self, note){
			
			self.$el.find("#noteContainer").prepend((new NoteView({
				note: note
			})).render().$el);
		},
		
		getData: function(){
			return {
			    "1412223651665": {
		        "chat": {
		            "conversationId": null,
		            "user": {
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
		                "branch": "ECE"
		            },
		            "userChatsMap": {},
		            "userChats": [
		                {
		                    "conversationID": 5,
		                    "fromJIDResource": "Spark 2.6.3",
		                    "toJIDResource": "prashant",
		                    "toJID": "agvj9q8@conference.win-kefqjr14ps3",
		                    "sentDate": "2014-10-01 04:25:2",
		                    "body": "Hello...",
		                    "note": null
		                },
		                {
		                    "conversationID": 5,
		                    "fromJIDResource": "4de9bead",
		                    "toJIDResource": "sohil",
		                    "toJID": "agvj9q8@conference.win-kefqjr14ps3",
		                    "sentDate": "2014-10-01 04:25:2",
		                    "body": "hi",
		                    "note": null
		                },
		                {
		                    "conversationID": 5,
		                    "fromJIDResource": "Spark 2.6.3",
		                    "toJIDResource": "prashant",
		                    "toJID": "agvj9q8@conference.win-kefqjr14ps3",
		                    "sentDate": "2014-10-01 04:25:2",
		                    "body": "great",
		                    "note": null
		                }
		            ],
		            "note": ""
		        }
		    },
		    "1412223651667": {
		        "message": [
		            {
		                "messageId": 74,
		                "sender": {
		                    "userId": 141,
		                    "username": "Aarti",
		                    "dbUserRole": {
		                        "userRoleId": 36,
		                        "username": "Aarti",
		                        "role": "ROLE_ADMIN"
		                    },
		                    "avatar": "avatar7",
		                    "userSecurities": [],
		                    "fname": "",
		                    "lname": "",
		                    "hostel": "",
		                    "year": "",
		                    "branch": ""
		                },
		                "subject": "I am not able to concerntrate",
		                "content": "How are you Sohil? Haven't heard from you for a while.",
		                "messageStatus": null,
		                "important": 1,
		                "recipients": [
		                    {
		                        "messageRecipientId": 133,
		                        "viewed": 1
		                    }
		                ],
		                "msgId": 32,
		                "sentDate": "2014-10-16 02:11:49"
		            }
		        ]
		    },
		    "1412223651669": {
		        "message": [
		            {
		                "messageId": 74,
		                "sender": {
		                    "userId": 141,
		                    "username": "Aarti",
		                    "dbUserRole": {
		                        "userRoleId": 36,
		                        "username": "Aarti",
		                        "role": "ROLE_ADMIN"
		                    },
		                    "avatar": "avatar7",
		                    "userSecurities": [],
		                    "fname": "",
		                    "lname": "",
		                    "hostel": "",
		                    "year": "",
		                    "branch": ""
		                },
		                "subject": "I am not able to concerntrate",
		                "content": "How are you Sohil? Haven't heard from you for a while.",
		                "messageStatus": null,
		                "important": 1,
		                "recipients": [
		                    {
		                        "messageRecipientId": 133,
		                        "viewed": 1
		                    }
		                ],
		                "msgId": 33,
		                "sentDate": "2014-10-16 02:11:49"
		            }
		        ]
		    },
		    "1413425509000": {
		        "message": [
		            {
		                "messageId": 74,
		                "sender": {
		                    "userId": 141,
		                    "username": "Aarti",
		                    "dbUserRole": {
		                        "userRoleId": 36,
		                        "username": "Aarti",
		                        "role": "ROLE_ADMIN"
		                    },
		                    "avatar": "avatar7",
		                    "userSecurities": [],
		                    "fname": "",
		                    "lname": "",
		                    "hostel": "",
		                    "year": "",
		                    "branch": ""
		                },
		                "subject": "I am not able to concerntrate",
		                "content": "How are you Sohil? Haven't heard from you for a while.",
		                "messageStatus": null,
		                "important": 1,
		                "recipients": [
		                    {
		                        "messageRecipientId": 133,
		                        "viewed": 1
		                    }
		                ],
		                "msgId": 30,
		                "sentDate": "2014-10-16 02:11:49"
		            },
		            {
		                "messageId": 74,
		                "sender": {
		                    "userId": 141,
		                    "username": "Aarti",
		                    "dbUserRole": {
		                        "userRoleId": 36,
		                        "username": "Aarti",
		                        "role": "ROLE_ADMIN"
		                    },
		                    "avatar": "avatar7",
		                    "userSecurities": [],
		                    "fname": "",
		                    "lname": "",
		                    "hostel": "",
		                    "year": "",
		                    "branch": ""
		                },
		                "subject": "I am not able to concerntrate",
		                "content": "How are you Sohil? Haven't heard from you for a while.",
		                "messageStatus": null,
		                "important": 1,
		                "recipients": [
		                    {
		                        "messageRecipientId": 133,
		                        "viewed": 1
		                    }
		                ],
		                "msgId": 30,
		                "sentDate": "2014-10-16 02:11:49"
		            },
		            {
		                "messageId": 74,
		                "sender": {
		                    "userId": 141,
		                    "username": "Aarti",
		                    "dbUserRole": {
		                        "userRoleId": 36,
		                        "username": "Aarti",
		                        "role": "ROLE_ADMIN"
		                    },
		                    "avatar": "avatar7",
		                    "userSecurities": [],
		                    "fname": "",
		                    "lname": "",
		                    "hostel": "",
		                    "year": "",
		                    "branch": ""
		                },
		                "subject": "I am not able to concerntrate",
		                "content": "How are you Sohil? Haven't heard from you for a while.",
		                "messageStatus": null,
		                "important": 1,
		                "recipients": [
		                    {
		                        "messageRecipientId": 133,
		                        "viewed": 1
		                    }
		                ],
		                "msgId": 30,
		                "sentDate": "2014-10-16 02:11:49"
		            },
		            {
		                "messageId": 74,
		                "sender": {
		                    "userId": 141,
		                    "username": "Aarti",
		                    "dbUserRole": {
		                        "userRoleId": 36,
		                        "username": "Aarti",
		                        "role": "ROLE_ADMIN"
		                    },
		                    "avatar": "avatar7",
		                    "userSecurities": [],
		                    "fname": "",
		                    "lname": "",
		                    "hostel": "",
		                    "year": "",
		                    "branch": ""
		                },
		                "subject": "I am not able to concerntrate",
		                "content": "How are you Sohil? Haven't heard from you for a while.",
		                "messageStatus": null,
		                "important": 1,
		                "recipients": [
		                    {
		                        "messageRecipientId": 133,
		                        "viewed": 1
		                    }
		                ],
		                "msgId": 30,
		                "sentDate": "2014-10-16 02:11:49"
		            },
		            {
		                "messageId": 74,
		                "sender": {
		                    "userId": 141,
		                    "username": "Aarti",
		                    "dbUserRole": {
		                        "userRoleId": 36,
		                        "username": "Aarti",
		                        "role": "ROLE_ADMIN"
		                    },
		                    "avatar": "avatar7",
		                    "userSecurities": [],
		                    "fname": "",
		                    "lname": "",
		                    "hostel": "",
		                    "year": "",
		                    "branch": ""
		                },
		                "subject": "I am not able to concerntrate",
		                "content": "How are you Sohil? Haven't heard from you for a while.",
		                "messageStatus": null,
		                "important": 1,
		                "recipients": [
		                    {
		                        "messageRecipientId": 133,
		                        "viewed": 1
		                    }
		                ],
		                "msgId": 30,
		                "sentDate": "2014-10-16 02:11:49"
		            }
		        ]
		    },
		    "1412223651665": {
		        "chat": {
		            "conversationId": 7,
		            "user": {
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
		                "branch": "ECE"
		            },
		            "userChatsMap": {},
		            "userChats": [
		                {
		                    "conversationID": 7,
		                    "fromJIDResource": "Spark 2.6.3",
		                    "toJIDResource": "prashant",
		                    "toJID": "agvj9q8@conference.win-kefqjr14ps3",
		                    "sentDate": "2014-10-01 04:25:2",
		                    "body": "Hello...",
		                    "note": "Note1"
		                },
		                {
		                    "conversationID": 7,
		                    "fromJIDResource": "4de9bead",
		                    "toJIDResource": "sohil",
		                    "toJID": "agvj9q8@conference.win-kefqjr14ps3",
		                    "sentDate": "2014-10-01 04:25:2",
		                    "body": "hi",
		                    "note": "note2"
		                },
		                {
		                    "conversationID": 7,
		                    "fromJIDResource": "Spark 2.6.3",
		                    "toJIDResource": "prashant",
		                    "toJID": "agvj9q8@conference.win-kefqjr14ps3",
		                    "sentDate": "2014-10-01 04:25:2",
		                    "body": "great",
		                    "note": "note3"
		                }
		            ],
		            "note": "Dummy Note"
		        }
		    }
		    
		};
		}
	
	});

	SingleClientPage.prototype.remove = function() {
		
		if(LoginStatus.get("isLoggedIn")!== true){
			$(".banner").show();
			Dispatcher.trigger("header:changeLoginText", "LOGIN");
			Dispatcher.trigger("header:bindBanner");
			Dispatcher.off("clientHistory:noteAdd");
		}
	};
	SingleClientPage.prototype.clean = function() {
	};
	return SingleClientPage;
});