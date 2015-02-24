define([
	'jquery',
	'underscore',
	'backbone',
	'hbs!../../template/chatDost/layout',
	'utils',
	'event/dispatcher'
], function($, _, Backbone, chatDostLayout, Utils, Dispatcher) {
	var chatDostPage = Backbone.View.extend({
		el: "#main-content",
		initialize: function() {
			// body...
		},
		events: {},
		render: function() {
			$.ajax("http://localhost:8800/dost/api/counselors/all").done(function(response){
				$("#main-content").html(chatDostLayout({objects:response}));
				$(".banner").hide();
				$(window).unbind('scroll');
				$('body').css("padding-top", "114px");
			});
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