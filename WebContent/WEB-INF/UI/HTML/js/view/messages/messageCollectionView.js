define(['jquery',
        'backbone',
        'underscore',
        'collection/messageCollection',
        'view/messages/messageView',
        'event/dispatcher'
    ],
function($, Backbone, _, MessageCollection, MessageView, Dispatcher) {
    var MessageCollectionView = Backbone.View.extend({
        events: {},
        initialize: function(options) {
            var self = this;
            
            self.collection = new MessageCollection({
            	url: options.url
            });
            
            self.collection.reset();
            this.collection.on("reset", this.render, this);
            
            self.collection.fetch({
            	remove: false,
            	add: true
		    });
            Dispatcher.on("message:bindFetchOnScroll", _.partial(this.bindFetchOnScroll, self));
            Dispatcher.on("message:unbindFetchOnScroll", _.partial(this.unbindFetchOnScroll, self));
        },
        render: function() {
            var self = this;
            self.$el.empty();
            _.each(this.collection.models, function(model) {
                self.$el.append((new MessageView({model: model, $rootel: self.$el})).render().$el);
                // append this to the collectionview
            });
            
            self.bindFetchOnScroll(self);

            return this;
        },
        bindFetchOnScroll: function(self){
        	self.fetchWait = false;
            
            $(window).scroll(self.bindScroll.bind(self));
        },
        unbindFetchOnScroll: function(){
        	$(window).unbind('scroll');
        },
        bindScroll: function(){
        	var self = this;
	    		
    	    if($(window).scrollTop() + $(window).height() > $(document).height() - 100 && !self.fetchWait) {
	    		self.fetchWait = true;
	    		setTimeout(function(){
	    			self.fetchWait = false;
	    		},1000);
	    		
	    		self.collection.getNextPage({
	            	remove: false,
	            	add: true
			    });
	    	}
	    }

    });
    return MessageCollectionView;
});