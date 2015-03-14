define([
	'jquery',
	'underscore',
	'backbone',
	'hbs!../../template/discussions/disc',
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
			var src=window.location.hash.split("discussions/")[1];
			//src=src.replace(/-/g,"/");
			console.log(src);
			var url={"url1":src}
			this.$el.html(ForgotPassLayout(url));
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