define([ 
         'jquery', 
	     'underscore', 
	     'backbone'
], function($, _, Backbone) {

	var Client = Backbone.Model.extend({
		
	    idAttribute : 'userId',
    	
		initialize: function (options) {
			
	    }
	    
	});
	return Client;
});
