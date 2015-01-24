define([ 'backbone',
   'model/message', 
   'model/login',
	'backbone-paginator',
  'utils' ], function(Backbone, Message, LoginStatus, BackbonePaginator, Utils) {

  var MessageCollection = Backbone.PageableCollection.extend({	 
    // Reference to this collection's model.
    model : Message,
    
    mode: "infinite",
    queryParams: {
      totalPages: null,
      totalRecords: null
    },
    
    url: '',
    
    parse: function(data){
    	return data;
    },

	state: {
		pageSize: 20,
		order: 1,
		sortKey: 'msgId',
		totalRecords: 1000
	},

    initialize: function (options) {
		this.url = options.url;
    }
	
   });
  return MessageCollection;
});