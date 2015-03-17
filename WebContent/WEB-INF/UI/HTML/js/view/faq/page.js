define([
	'jquery',
	'underscore',
	'backbone',
	'hbs!../../template/faq/layout',
	'event/dispatcher',
	'model/login',
	'utils',
	'view/faq/faqCategoryView'
], function($, _, Backbone, FaqPageLayout, Dispatcher, LoginStatus, Utils, FaqCategoryView) {
	var FaqPage = Backbone.View.extend({
		el: "#main-content",
		initialize: function() {
			// body...
			Dispatcher.trigger("header:changeDocumentTitle", "FAQ");
		},
		events: {
			'keyup #searchFaq':'searchFaq'
		},
		searchFaq: function(e){
			$('.question').show();
			var userString=$("#searchFaq").val();
			$('.question a:not(:contains('+ userString +'))').parent().hide(); 
		},
		render: function() {
			var self = this;
			this.$el.html(FaqPageLayout({}));
			if(LoginStatus.get("isLoggedIn")!== true){
				$(".banner").show();
				Dispatcher.trigger("header:bindBanner");
			}
			$.ajax(Utils.contextPath()+"/api/faqcategory/all").done(function(response){
				_.each(response, function(category){					
					self.$el.find("#faqCategoryContainer").append(new FaqCategoryView({
						category: category
					}).render().$el);
				});
			});
		}
	});

	FaqPage.prototype.remove = function() {

	};
	FaqPage.prototype.clean = function() {

	};
	return FaqPage;
});