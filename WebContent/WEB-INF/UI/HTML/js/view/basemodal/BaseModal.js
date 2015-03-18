define( [ 'underscore', 'backbone', 'hbs!template/basemodal/BaseModal',
          'hbs!../../template/chatDost/composeMsgModal','utils',
		'moment' ], function(_, Backbone, template, ComposeMsgModal, Utils, moment) {
	var BaseModalView = Backbone.View.extend( {

		id : 'base-modal',
		className : 'modal fade',
		template : template,

		events : {
			'hidden' : 'teardown',
		    "focus .recipients":"autoComplete",
		    "blur #username":"usernameCheck",
		    'click .close':'teardown',
		    'click .message-btn':'composeMessage',//for dost details modal window
		    'click .chat-btn':'hide',//for dost details modal window
		    'click .close-modal':'hide'
		    
		},
		
		composeMessage:function(e){
			this.hide();
			e.preventDefault();
			e.stopPropagation();
			var self = this;
			$modalBody = $('<div>').html(ComposeMsgModal());
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

		initialize : function(options) {
			options = options || {};
			this.modalProperties = {
				title : options.title || '',
				headerHidden: options.headerHidden || false
			};
			
			
			//this.id = options.id || this.id;
			this.buttonList = options.buttonList || [];

			this.body = options.body || '';
			var self = this;

			this.render();
			this.stackedModals();
			setTimeout(function() {
				self.$el.find(".modal-body").append(self.body);
				_.each(self.buttonList, function(button) {
					$('<button/>', {
						text : button[0],
						click : _.partial(button[1], self),
						class : button[2]
					}).appendTo(self.$el.find(".modal-footer"));
				});
				self.$el.on('hidden.bs.modal', function () {
				    self.teardown();
				});
				self.$el.on( 'shown.bs.modal', function ( event ) {
					
					// keep track of the number of open modals
					
					if ( typeof( $('body').data( 'fv_open_modals' ) ) == 'undefined' ) {
					  $('body').data( 'fv_open_modals', 0 );
					}
					
					  
					// if the z-index of this modal has been set, ignore.
					         
					 if ( $(this).hasClass( 'fv-modal-stack' ) ) {
						 return;
					 }
					
					 $(this).addClass( 'fv-modal-stack' );
					
					 $('body').data( 'fv_open_modals', $('body').data( 'fv_open_modals' ) + 1 );
					
					 $(this).css('z-index', 1040 + (10 * $('body').data( 'fv_open_modals' )));
					 $(this).find(".modal-dialog").css('z-index', 1040 + (10 * $('body').data( 'fv_open_modals' )));
					
					 $( '.modal-backdrop' ).not( '.fv-modal-stack' )
					         .css( 'z-index', 1039 + (10 * $('body').data( 'fv_open_modals' )));
					
					
					 $( '.modal-backdrop' ).not( 'fv-modal-stack' )
					         .addClass( 'fv-modal-stack' );
					 });
			}, 400);
			console.log("");
		},

		show : function() {
			
			this.$el.modal('show');
			
		},
		
		stackedModals: function(){
			
			

		},

		teardown : function() {
			var self = this;
			this.$el.modal('hide');
			this.$el.data('modal', null);
		    self.$el.removeClass( 'fv-modal-stack' );
		    var maxzIndex = Math.max.apply(null, $(".modal").map(function () {
		        return $(this).zIndex();
		    }).get());
		    $(".modal").filter(function(){
		    	console.log($(this).zIndex());
		    	console.log(maxzIndex);
		    	return $(this).zIndex() == maxzIndex;
		    }).css("overflow-y", "auto");
            $('body').data( 'fv_open_modals', $('body').data( 'fv_open_modals' ) - 1 );
			if($('body').data( 'fv_open_modals') > 0 ){
				$("body").addClass("modal-open");
			} else {
				$("body").removeClass("modal-open");
			}
			this.remove();
		},
		autoComplete:function(usersnames){
			var usernames=[];
			$.ajax(Utils.contextPath()+"/api/users").done(function(users){
				$.each(users, function(i,key){
				  usernames.push(key.username);
					console.log(i);
				});
			});
			$( ".recipients" ).autocomplete({
				source:usernames
			    });
			$(".ui-autocomplete").css("z-index","1060");
		},
		usernameCheck:function(){
			$(".signupForm #username").css("border-color","black");
			$(".error").remove();
			var text=$(".signupForm #username").val();
			$.ajax(Utils.contextPath()+"/api/user/"+text+"/exists").done(function(response){
				if(response.userexists=="true"){
					$(".signupForm #username").css("border-color","red");
					$(".signupForm #username").parent().parent().append('<span style="color:red" class="error">username exists</span>')
				}
				else{
					$(".signupForm #username").css("border-color","green")
				}
			});
		},
		
		hide: function(){
			this.$el.modal('hide');
			this.$el.data('modal', null);
			this.remove();
		},

		render : function() {
			this.$el.html(this.template(this.modalProperties));
			this.$el.modal( {
				show : false
			}); // dont show modal on instantiation
			return this;
		},

		renderView : function(template) {
			this.$el.html(template());
			this.$el.modal( {
				show : false
			}); // dont show modal on instantiation
		}
	});

	return BaseModalView;
});