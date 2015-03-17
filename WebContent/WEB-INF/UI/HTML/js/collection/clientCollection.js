define([ 'backbone',
   'model/client', 
   'model/login',
	'backbone-paginator',
  'utils' ], function(Backbone, Client, LoginStatus, BackbonePaginator, Utils) {

  var ClientCollection = Backbone.Collection.extend({	 
    // Reference to this collection's model.
    model : Client,
    
    url: Utils.contextPath()+'/api/users',
    
    parse: function(data){
    	return data;
    },

    initialize: function (options) {
		
    }
	
   });
  return ClientCollection;
});