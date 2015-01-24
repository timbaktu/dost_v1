define([
	'jquery',
	'underscore',
	'backbone',
	'hbs!../../template/home/layout',
	'utils',
	'model/login',
	'event/dispatcher'
], function($, _, Backbone, HomePageLayout, Utils, LoginStatus, Dispatcher) {
	var HomePage = Backbone.View.extend({
		el: "#main-content",
		initialize: function() {
			// body...
			Dispatcher.trigger("header:changeDocumentTitle", "Home");
		},
		events: {},
		render: function() {
			this.$el.html(HomePageLayout({}));
			
			if(LoginStatus.get("isLoggedIn") === "true"){
				$(".banner").hide();
				$(window).unbind('scroll');
				$('body').css("padding-top", "114px");
			}
			$.ajax('http://localhost:8800/dost/api/topics/count/2').done(function(response){
				_.each(response, function(post){
					var time = "~" + Utils.getDateDiff(post.forumPosts[0].postTime);
					
					$(".supportDiscussions").append("<div class='text-left'>"+ post.topicTitle +"<div class='text-right'>" + time + "</div></div>")
				});
			}).fail(function(error){
				
			});
		}
	});

	HomePage.prototype.remove = function() {

	};
	HomePage.prototype.clean = function() {

	};
	return HomePage;
});