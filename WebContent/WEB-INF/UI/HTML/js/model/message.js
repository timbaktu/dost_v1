define([ 
         'jquery', 
	     'underscore', 
	     'backbone'
], function($, _, Backbone) {

	var Message = Backbone.Model.extend({
		
	    idAttribute : 'messageId',
	    
	    
    	
		initialize: function (options) {
			
	    }
	    
	});
	return Message;
});
