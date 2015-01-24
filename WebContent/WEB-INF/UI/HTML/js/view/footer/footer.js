define([
  'jquery',
  'underscore',
  'backbone',
  'hbs!../../template/footer/layout',
  'bootstrap',
  'event/dispatcher',
  'view/basemodal/BaseModal',
  'hbs!../../template/footer/tos'
], function($, _, Backbone, template, Bootstrap, Dispatcher, BaseModalView, tosModalBody){
  var FooterView = Backbone.View.extend({
    el: 'footer',
    events: {
		'click .tos-open': 'showTermsOfServices'  
	},
	showTos: function(self){
		var $modalBody = $('<div/>').html(tosModalBody);
		var signUpModal = new BaseModalView({
            title: "Terms of Services",
            className : 'modal fade tos in',
            buttonList: [],
            body: $modalBody,
            id:'tos'
        });
    	signUpModal.show();
	},
	showTermsOfServices: function(e){
		e.preventDefault();
		this.showTos(this);
	},
	
    initialize: function () {
		var self = this;
		Dispatcher.on("footer:showTos", _.partial(this.showTos), self);
   	},
    render: function () {
	  	this.$el.html(template({}));	    
    }
  });
  FooterView.prototype.clean = function(){
	  Dispatcher.off("footer:showTos");
  };
  return FooterView;
});
