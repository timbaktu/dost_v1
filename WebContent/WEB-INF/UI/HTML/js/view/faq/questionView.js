define([
	'jquery',
	'underscore',
	'backbone',
	'hbs!../../template/faq/question',
	'event/dispatcher',
	'model/login',
	'router/app-router',
], function($, _, Backbone, QuestionTemplate, Dispatcher, LoginStatus, Router) {
	var QuestionView = Backbone.View.extend({
		template: QuestionTemplate,
		initialize: function(options) {
			this.question = options.question;
		},
		events: {
			'click .faqQuestion': 'openQuestion'
		},
		openQuestion: function(e){
			Router.__super__.navigate("#faq/"+ this.question.faqId,{trigger: true});
		},
		render: function() {
			this.$el.append(this.template(this.question));
			return this;
		},
		renderQuestions: function(){
			
		}
	});

	QuestionView.prototype.remove = function() {

	};
	QuestionView.prototype.clean = function() {

	};
	return QuestionView;
});