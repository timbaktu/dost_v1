define([ 'backbone',
   'model/counselor', 
   'model/login',
	'backbone-paginator',
  'utils' ], function(Backbone, Counselor, LoginStatus, BackbonePaginator, Utils) {

  var CounselorCollection = Backbone.Collection.extend({	 
    // Reference to this collection's model.
    model : Counselor,
    
    url: Utils.contextPath()+'/api/counselors/all',
    
    parse: function(data){
    	return data;
    },

    initialize: function (options) {
		
    }
	
   });
  return CounselorCollection;
});