define([
	'jquery',
	'underscore',
	'backbone',
	'hbs!../../template/parents/layout',
	'utils',
	'event/dispatcher'
], function($, _, Backbone, ForgotPassLayout, Utils, Dispatcher) {
	var Relationshipspage = Backbone.View.extend({
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

	Relationshipspage.prototype.remove = function() {
		$(".banner").show();
		Dispatcher.trigger("header:bindBanner");
	};
	Relationshipspage.prototype.clean = function() {

	};
	return Relationshipspage;
});