define([ 
         'jquery', 
	     'underscore', 
	     'backbone'
], function($, _, Backbone) {

	var Faq = Backbone.Model.extend({
		
	    idAttribute : 'userId',
    	
		initialize: function (options) {
			
	    }
	    
	});
	return Faq;
});
