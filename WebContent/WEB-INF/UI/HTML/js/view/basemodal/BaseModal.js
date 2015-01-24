define( [ 'underscore', 'backbone', 'hbs!template/basemodal/BaseModal',
		'moment' ], function(_, Backbone, template, moment) {
	var BaseModalView = Backbone.View.extend( {

		id : 'base-modal',
		className : 'modal fade',
		template : template,

		events : {
			'hidden' : 'teardown'
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