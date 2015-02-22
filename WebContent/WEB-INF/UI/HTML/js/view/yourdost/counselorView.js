define([ 'jquery', 
         'backbone',
         'underscore',
         'hbs!../../template/yourdost/counselor',
         'utils',
         'event/dispatcher',
         'model/login',
         'router/app-router'
         ],
function($, Backbone, _, counselorTemplate, Utils, Dispatcher, LoginStatus, Router) {
	
	var CounselorView = Backbone.View.extend({
		template : counselorTemplate,
		tagName : 'div',
		className: "col-md-4 paddBottom counselor",
		events : {
			'click .message-btn': 'message',
			'click .detail-btn': 'openDetail'
		},
		message: function(){
			console.log("message Clicked");
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
