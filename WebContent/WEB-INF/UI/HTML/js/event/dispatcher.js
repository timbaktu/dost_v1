define(['backbone', 'underscore'], function (Backbone, _) {
    var EventBus = _.extend({}, Backbone.Events); 
    return EventBus;
});