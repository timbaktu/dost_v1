define([
	'jquery',
	'underscore',
	'backbone',
	'hbs!../../template/articles/layout',
	'utils',
	'event/dispatcher'
], function($, _, Backbone, articlesLayout, Utils, Dispatcher) {
	var dostpage = Backbone.View.extend({
		el: "#main-content",
		initialize: function() {
			// body...
		},
		events: {},
		render: function() {
			this.$el.html(articlesLayout({}));
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