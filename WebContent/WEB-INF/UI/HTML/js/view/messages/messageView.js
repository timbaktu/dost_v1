define([ 'jquery', 
         'backbone',
         'underscore',
         'hbs!../../template/messages/message',
         'hbs!../../template/messages/messageExpanded',
         'utils',
         'hbs!../../template/messages/expandedSingleMessage',
         'view/messages/expandedMessageView',
         'event/dispatcher',
         'model/login'
         ],
function($, Backbone, _, messageTemplate, messageExpandedTemplate, Utils, SingleMessage, ExpandedMessageView, Dispatcher, LoginStatus) {
	
	var MessageView = Backbone.View.extend({
		template : messageTemplate,
		tagName : 'div',
		className: "inbox-messages1 col-md-12",
		events : {
			'click .expandTheMessage': 'expandMessage'
		},				
		initialize : function(options) {
			var self = this;
			this.$rootel = options.$rootel;
			this.model.on('change', this.render.bind(this), this.model);
			this.on('destroy', this.removeView, this.model);
			if(this.model.get("messageCount") === undefined){
				$.ajax("http://localhost:8800/dost/api//msgid/"+this.model.get("msgId")+"/count").done(function(response){
					self.model.set("messageCount", response.count);
				});
			}
			
		},	
		render : function() {
			var self = this;			
			this.$el.html(this.template(this.model.toJSON()));
			if(self.model.attributes.recipients[0] && self.model.attributes.recipients[0].viewed == 0 && self.$rootel.selector.indexOf("inbox") > 0){
				self.model.set('isUnread', true);
			}
			return this;
		},
		removeView: function () {
			this.remove();
		},
		expandMessage: function(e){
			//console.log("expandMessage");
			e.preventDefault();
			var self = this;
			if(self.model.attributes.recipients[0] && self.model.attributes.recipients[0].viewed == 0 && self.$rootel.selector.indexOf("inbox") > 0){
				//change model and save.
				self.model.get('recipients')[0].viewed = 1;
				
				// Mark as read.
				//self.model.attributes.recipients[0].viewed = 1;
				
			}
			
			
			
			var isClient = LoginStatus.attributes.dbUserRole.role == "ROLE_USER"? true: false;
			Dispatcher.trigger("message:unbindFetchOnScroll");
			window.scrollTo(0,0);

			new ExpandedMessageView({
				$rootel: self.$rootel,
				msgId: self.model.get("msgId"),
				subject: self.model.get("subject"),
				count: self.model.get("messageCount"),
				isClient: isClient
			});
			
		}
	});
	return MessageView;
});
