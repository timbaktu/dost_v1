define([ 
         'jquery', 
	     'underscore', 
	     'backbone',
	     'jCookie'
], function($, _, Backbone, jCookie) {

	var LoginStatus = Backbone.Model.extend({
		
	    idAttribute : 'id',
    	
		initialize: function () {
			var loggedInUserString = $.cookie("loggedInUser");
			if( loggedInUserString != undefined){
				this.set(JSON.parse(loggedInUserString));
			}
			
	    }
	    
	});
	return new LoginStatus();
});
