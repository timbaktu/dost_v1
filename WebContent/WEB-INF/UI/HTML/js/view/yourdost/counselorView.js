define([ 'jquery', 
         'backbone',
         'underscore',
         'hbs!../../template/yourdost/counselor',
         'hbs!../../template/yourdost/composeMsgModal',
         'hbs!../../template/yourdost/counselorInfo',         
         'view/basemodal/BaseModal',
         'utils',
         'event/dispatcher',
         'model/login',
         'router/app-router'
         ],
function($, Backbone, _, counselorTemplate, ComposeMsgModal, counselorInfo, BaseModalView, Utils, Dispatcher, LoginStatus, Router) {
	
	var CounselorView = Backbone.View.extend({
		template : counselorTemplate,
		tagName : 'div',
		className: "col-md-4 paddBottom counselor",
		events : {
			'click .message-btn': 'message',
			'click .viewDetail': 'openDetail',
			'click .chat-btn':'chat'
		},
		chat: function(e){
			e.preventDefault();
			e.stopPropagation();
			if(LoginStatus.get("isLoggedIn")){
				window.location.href=$(e.target).attr("href");
			}
			else{
				this.askLogin();				
			}
			
		},
		message: function(e){
			e.preventDefault();
			e.stopPropagation();
			var self = this;
			var status={"isLoggedIn":LoginStatus.get("isLoggedIn")}
			$modalBody = $('<div>').html(ComposeMsgModal(status));
			if(!LoginStatus.get("isLoggedIn")){
				this.askLogin();				
			}
			else{
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
		},
		openDetail: function(e){
			e.preventDefault();
			e.stopPropagation();
			var self = this;
			var username=$(e.target).closest(".viewDetail").attr("id");
			$.ajax(Utils.contextPath()+"/api/counselors/all").done(function(response){
				var a = response;
				var found;
				a.some(function(entry) {
				    if (entry.username == username) {
				        found = entry;
				        return true;
				    }
				});
				console.log(found);
				$modalBody = $('<div>').html(counselorInfo(found));
				var msgToDost = new BaseModalView({
	                title: "",
	                headerHidden: true,
	                className : 'modal fade compose-message-modal',                
	                body: $modalBody,
	                //data: usernames
	            });
				msgToDost.show();
			});
			
		},
		askLogin: function(){
			var status={"isLoggedIn":LoginStatus.get("isLoggedIn")}
			$modalBody = $('<div>').html(ComposeMsgModal(status));
			var msgToDost = new BaseModalView({
                title: "",
                headerHidden: true,
                className : 'modal fade compose-message-modal',
                buttonList: [
					
					 /*['LOGIN', function(modal, event){ 	                    	
					 	modal.teardown(); 
					 	window.location.href="#login"
					 }.bind(self), 'option-btn composeMsg-send btn'],*/
					 
	                    ['Don\'t have an account? SIGNUP NOW', function(modal, event){ 	                    	
	                    	modal.teardown(); 
	                    	Dispatcher.trigger("header:showSignUp"); 
	                    }.bind(self), 'option-btn composeMsg-send btn']
	                    
	                ],
                body: $modalBody,
            });
			msgToDost.show();
		},
		initialize : function(options) {
			var self = this;
			var fullname = this.model.get("fname") && this.model.get("fname") ?  this.model.get("fname") + " " + this.model.get("lname"): "";
			this.model.set("fullname", fullname);
			this.model.on('change', this.render.bind(this), this.model);
			this.on('destroy', this.removeView, this.model);
			
		},	
		render : function() {
			var self = this;			
			this.$el.html(this.template(this.model.toJSON()));
			return this;
		},
		removeView: function () {
			this.remove();
		}
	});
	return CounselorView;
});
