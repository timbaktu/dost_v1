define([ 'jquery', 
         'backbone',
         'underscore',
         'hbs!../../template/clients/client',        
         'view/basemodal/BaseModal',     
         'hbs!../../template/messages/composeMsgModal',
         'utils',
         'event/dispatcher',
         'model/login',
         'router/app-router'
         ],
function($, Backbone, _, clientTemplate, BaseModalView, ComposeMsgModal, Utils, Dispatcher, LoginStatus, Router) {
	
	var ClientView = Backbone.View.extend({
		template : clientTemplate,
		tagName : 'div',
		className: "col-md-4 col-sm-6 paddBottom",
		events : {
			'click .message-btn': 'message',
			'click .detail-btn': 'openDetail'
		},
		message: function(e){
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
                    	var recipientsNames=$(".recipients").val().split(",");
                    	$.ajax(Utils.contextPath()+"/api/users").done(function(details){
                        	recipientsNames.pop();
                        	var ids=[];
              		        $.each(details, function(j,key){
                    	        $.each(recipientsNames, function(i,name){
                    	        	name=name.trim();
                        		  if(key.username==name){
                        		    ids.push(key.userId);
                        		  }
                        		});
                    		});
                        	ids=ids.join();
	                    	var url = Utils.contextPath()+"/api/user/message?subject="+subject+"&content="+content+"&recipients="+ids+"&senderId=" +LoginStatus.get('userId');
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
		openDetail: function(){
			Router.__super__.navigate("#clients/" + this.model.get('userId'),{trigger: true});
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
	return ClientView;
});
