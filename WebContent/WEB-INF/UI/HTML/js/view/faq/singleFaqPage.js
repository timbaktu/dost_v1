define([
	'jquery',
	'underscore',
	'backbone',
	'hbs!../../template/faq/singleFaqlayout',
	'event/dispatcher',
	'model/login',
	'view/faq/faqCategoryView'
], function($, _, Backbone, SingleFaqPageLayout, Dispatcher, LoginStatus, FaqCategoryView) {
	var SingleFaqPage = Backbone.View.extend({
		el: "#main-content",
		initialize: function() {
			// body...
			Dispatcher.trigger("header:changeDocumentTitle", "FAQ");
		},
		events: {},
		render: function() {
			var self = this;
			this.$el.html(SingleFaqPageLayout({}));
			if(LoginStatus.get("isLoggedIn")!== true){
				$(".banner").show();
				Dispatcher.trigger("header:bindBanner");
			}
			$.ajax("http://localhost:8800/dost/api/faqcategory/all").done(function(response){
				console.dir(response);
				_.each(response, function(category){					
					self.$el.find("#faqCategoryContainer").append(new FaqCategoryView({
						category: category
					}).render().$el);
				});
			});
		}
	});

	SingleFaqPage.prototype.remove = function() {

	};
	SingleFaqPage.prototype.clean = function() {

	};
	return SingleFaqPage;
});