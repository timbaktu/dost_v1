define(['jquery',
        'backbone',
        'underscore',
        'event/dispatcher',
        'hbs!../../template/clients/singleHistoryChat',
        'hbs!../../template/clients/chatHistoryView'
    ],
function($, Backbone, _, Dispatcher, SingleHistoryChat, ChatHistoryTemplate) {
    var ChatHistoryView = Backbone.View.extend({
        events: {},
        tagName: "div",
        template: ChatHistoryTemplate,
        className: "col-md-12 orange-line",
        initialize: function(options) {
            var self = this;
            self.chats = options.chat;
        },
        render: function() {
            var self = this;
            //get number of messages
            var sendDate = self.chats.userChats[0].sentDate;
            this.$el.html(this.template({
            	sendDate: sendDate
            }));
            _.each(self.chats.userChats, function(chat){
            	
            	self.$el.append(SingleHistoryChat(chat));
            });
            //Dispatcher.trigger("",{
            //	userName: self.chats.note,
            //	noteDate:  chat.sendDate,
            //	note: chat.note,
            //	id:chat.conversationID
            //});
            return this;
        }
    });
    return ChatHistoryView;
});