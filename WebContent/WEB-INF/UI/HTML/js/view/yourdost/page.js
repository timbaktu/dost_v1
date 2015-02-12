define([
	'jquery',
	'underscore',
	'backbone',
	'hbs!../../template/yourdost/layout',
	'utils',
	'event/dispatcher'
], function($, _, Backbone, ForgotPassLayout, Utils, Dispatcher) {
	var dostpage = Backbone.View.extend({
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

	dostpage.prototype.remove = function() {
		$(".banner").show();
		Dispatcher.trigger("header:bindBanner");
	};
	dostpage.prototype.clean = function() {

	};
	return dostpage;
});