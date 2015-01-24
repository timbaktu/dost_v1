define([
	'jquery',
	'underscore',
	'backbone',
	'hbs!../../template/faq/faqCategory',
	'event/dispatcher',
	'model/login',
	'view/faq/questionView'
], function($, _, Backbone, FaqCategory, Dispatcher, LoginStatus, QuestionView) {
	var FaqCategoryView = Backbone.View.extend({
		initialize: function(options) {
			this.category = options.category;
			this.render();
		},
		events: {},
		render: function() {
			this.$el.html(FaqCategory(this.category));
			this.renderQuestions();
			return this;
		},
		renderQuestions: function(){
			var self = this;
			_.each(self.category.faqs, function(question){
				self.$el.find(".questions").append(new QuestionView({
					question: question
				}).render().$el);
			});
		}
	});

	FaqCategoryView.prototype.remove = function() {

	};
	FaqCategoryView.prototype.clean = function() {

	};
	return FaqCategoryView;
});