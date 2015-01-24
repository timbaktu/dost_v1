define([
	'jquery',
	'underscore',
	'backbone',
	'hbs!../../template/forgotpass/layout',
	'utils',
	'event/dispatcher'
], function($, _, Backbone, ForgotPassLayout, Utils, Dispatcher) {
	var ForgotPass = Backbone.View.extend({
		el: "#main-content",
		initialize: function() {
			// body...
		},
		events: {},
		render: function() {
			this.$el.html(ForgotPassLayout({}));
			$(".banner").hide();
			$(window).unbind('scroll');
			$('body').css("padding-top", "114px");
		}
	});

	ForgotPass.prototype.remove = function() {
		$(".banner").show();
		Dispatcher.trigger("header:bindBanner");
	};
	ForgotPass.prototype.clean = function() {

	};
	return ForgotPass;
});