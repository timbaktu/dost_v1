define(['jquery',
        'backbone',
        'underscore',
        'event/dispatcher',
        'hbs!../../template/clients/noteView'
    ],
function($, Backbone, _, Dispatcher, NoteViewTemplate) {
    var NoteView = Backbone.View.extend({
        events: {
	    	'click .goto-link': 'scroll'
	    },
        tagName: "div",
        template: NoteViewTemplate,
        className: "notes-info",
        initialize: function(options) {
            var self = this;
            this.note = options.note;
        },
        scroll: function(e){
        	e.preventDefault();
        	var self = this;
        	var id = self.note.msgId ? "#message" + self.note.msgId : "#chat" + self.note.id; 
        	
        	var position = $(id).offset().top- 150;
        	$('html, body').animate({scrollTop:position}, 'slow');
        },
        render: function() {
            var self = this;
            
            this.$el.html(this.template({
            	userName: self.note.userName,
            	noteDate: self.note.noteDate,
            	note: self.note.note
            }));            
            
            return this;
        }
    });
    return NoteView;
});