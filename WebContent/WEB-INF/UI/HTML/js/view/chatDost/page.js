define([
	'jquery',
	'underscore',
	'backbone',
	'hbs!../../template/chatDost/layout',
    'hbs!../../template/chatDost/composeMsgModal',         
    'view/basemodal/BaseModal',     
	'utils',
	'event/dispatcher'
], function($, _, Backbone, chatDostLayout, ComposeMsgModal, BaseModalView, Utils, Dispatcher) {
	var chatDostPage = Backbone.View.extend({
		el: "#main-content",
		initialize: function() {
			// body...
		},
		events: {
			"click #leaveMsg":"composeMsg"
		},
		render: function() {
			$.ajax("http://localhost:8800/dost/api/counselors/all").done(function(response){
				$("#main-content").html(chatDostLayout({objects:response}));
				$(".banner").hide();
				$(window).unbind('scroll');
				$('body').css("padding-top", "114px");
			});
		},
		composeMsg: function(e){
			e.preventDefault();
			e.stopPropagation();
			var self = this;			
			$modalBody = $('<div>').html(ComposeMsgModal);
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
                    	$.ajax("http://localhost:8800/dost/api/user/"+$(".recipients").val()).done(function(details){
	                    	var url = "http://localhost:8800/dost/api/user/message?subject="+subject+"&content="+content+"&recipients="+details.userId+"&senderId=" +LoginStatus.get('userId');
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