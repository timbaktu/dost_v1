define([
  'jquery',
  'underscore',
  'backbone',
  'view/header/header',
  'view/footer/footer',
  'text!template/layout.hbs'
], function($, _, Backbone, HeaderView, FooterView, LayoutTemplate){
  var AppView = Backbone.View.extend({
	  layoutTemplate : LayoutTemplate,
      el: 'body',
    initialize: function () {
//    	console.log(" App View initialized");
    	this.render();
    },
    render: function () {

    	  $(this.el).html(LayoutTemplate);
          
	      this.footerView = new FooterView();
	      this.headerView = new HeaderView();
	      this.headerView.render();
	      this.footerView.render();
    },
    events: {
    }

	});
  return AppView;
});
