define([ 'jquery', 
         'backbone',
         'underscore',
         'hbs!../../template/clients/client',
         'utils',
         'event/dispatcher',
         'model/login',
         'router/app-router'
         ],
function($, Backbone, _, clientTemplate, Utils, Dispatcher, LoginStatus, Router) {
	
	var ClientView = Backbone.View.extend({
		template : clientTemplate,
		tagName : 'div',
		className: "col-md-4 paddBottom",
		events : {
			'click .message-btn': 'message',
			'click .detail-btn': 'openDetail'
		},
		message: function(){
			console.log("message Clicked");
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
