define(['jquery',
        'backbone',
        'underscore',
        'collection/clientCollection',
        'view/clients/clientView',
        'event/dispatcher'
    ],
function($, Backbone, _, MessageCollection, ClientView, Dispatcher) {
    var ClientCollectionView = Backbone.View.extend({
        events: {},
        el: ".clientCards-area",
        initialize: function(options) {
            var self = this;
            
            self.collection = new MessageCollection({});
            this.collection.bind("change reset add remove", this.render, this);
            self.collection.reset();
            self.collection.fetch({
            	remove: false
		    });
        },
        render: function() {
            var self = this;
            self.$el.empty();
            _.each(this.collection.models, function(model) {
                self.$el.append((new ClientView({model: model, $rootel: self.$el})).render().$el);
                // append this to the collectionview
            });

            return this;
        },
        renderCollection: function(models){
        	var self = this;
        	self.$el.empty();
            _.each(models, function(model) {
                self.$el.append((new ClientView({model: model, $rootel: self.$el})).render().$el);
                // append this to the collectionview
            });

            return this;
        }
    });
    return ClientCollectionView;
});