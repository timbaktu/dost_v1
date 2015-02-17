define([ 
         'jquery', 
	     'underscore', 
	     'backbone'
], function($, _, Backbone) {

	var Counselor = Backbone.Model.extend({
		
	    idAttribute : 'userId',
    	
		initialize: function (options) {
			
	    }
	    
	});
	return Counselor;
});
