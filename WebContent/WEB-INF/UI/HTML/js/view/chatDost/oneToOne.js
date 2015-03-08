define([
	'jquery',
	'underscore',
	'backbone',
	'hbs!../../template/chatDost/oneToOne',
	'utils',
	'event/dispatcher',
	'strophe/strophe'
], function($, _, Backbone, ForgotPassLayout, Utils, Dispatcher, strophe) {
	var Relationshipspage = Backbone.View.extend({
		el: "#main-content",
		initialize: function() {
			// body...
			
			$.getJSON("/dost/api/users?role=ROLE_ADMIN", function(users) {	
				
				$(".loading").hide();
				
				for (var i = 0 ; i < users.length; i++) {
					
					/*FAQ listing on faq page*/
					$("#admins").append('<div id=' + users[i].username + ' class="userclass"><br><a class="categoryName" href="javascript:void(0);">"'+users[i].username+'"</a></div>');
				};
			}); 
			
			/*var BOSH_SERVICE = 'http://52.74.32.140:7070/http-bind/?<body rid=/"1/"/>';
			var connection = new Strophe.Connection(BOSH_SERVICE);
		    connection.rawInput = rawInput;
		    connection.rawOutput = rawOutput;*/

			function log(msg) 
			{
			    //$('#log').append('<div></div>').append(document.createTextNode(msg));
			}

			function rawInput(data)
			{
			    log('RECV: ' + data);
			}

			function rawOutput(data)
			{
			    log('SENT: ' + data);
			}			

			function onOwnMessage(msg) {
				debugger;
			  console.log(msg);
			  var elems = msg.getElementsByTagName('own-message');
			  if (elems.length > 0) {
			      var own = elems[0];
			      var to = msg.getAttribute('to');
			      var from = msg.getAttribute('from');
			      var iq = $iq({
				  to: from,
				  type: 'error',
				  id: msg.getAttribute('id')
			      }).cnode(own).up().c('error', {type: 'cancel', code: '501'})
			      .c('feature-not-implemented', {xmlns: 'urn:ietf:params:xml:ns:xmpp-stanzas'});

			      connection.sendIQ(iq);
			  }

			  return true;
			}

			function onMessage(msg) {
				debugger;
			    var to = msg.getAttribute('to');
			    var from = msg.getAttribute('from');
			    var type = msg.getAttribute('type');
			    var elems = msg.getElementsByTagName('body');

			    if (type == "chat" && elems.length > 0) {
				var body = elems[0];

				log('ECHOBOT: I got a message from ' + from + ': ' + 
				    Strophe.getText(body));

				var text = Strophe.getText(body);
			    log(text);
				//var reply = $msg({to: from, from: to, type: 'chat', id: 'purple4dac25e4'}).c('active', {xmlns: "http://jabber.org/protocol/chatstates"}).up().cnode(body);
			            //.cnode(Strophe.copyElement(body)); 
				//connection.send(reply.tree());

				log('ECHOBOT: I sent ' + from + ': ' + Strophe.getText(body));
			    }
			    var arr = $("#to").val().split('@');
			    $("#chatbox").append('<br>' + arr[0] + ': ' + text);
			    // we must return true to keep the handler alive.  
			    // returning false would remove it after it finishes.
			    return true;
			}


			function sendMessage() {
				debugger;
			    var message = $('#message').get(0).value;
			    var to = $('#to').get(0).value;
			    if(message && to){
				var reply = $msg({
				    to: to,
				    type: 'chat'
				})
				.cnode(Strophe.xmlElement('body', message)).up()
				.c('active', {xmlns: "http://jabber.org/protocol/chatstates"});

				connection.send(reply);

				log('I sent ' + to + ': ' + message);
				$("#chatbox").append('<br>' + $("#jid").val() + ': ' + message);
				// Resetting value back to no text/null/empty
				$("#message").attr("value", '');
			    }
			}


			$(document).ready(function () {
				$("#wrapper").hide();
				var access_token;


			    $('#connect').bind('click', function () {
			    	//connecttoServer();
			    });

			    $('#send').bind('click', function () {
				//sendMessage();
			    });
			});

		},
		events: {
			'click .userclass': 'userClicked',
			'click #send':'sendMessage'
		},
		render: function() {
			this.$el.html(ForgotPassLayout({}));
			$(".banner").hide();
			$(window).unbind('scroll');
			$('body').css("padding-top", "114px");
		},
		userClicked: function(e){
			e.preventDefault();
			e.stopPropagation();
		    //var selection = $(this).attr("id");
			var selection="prashant";
		    $("#to").attr("value", selection+"@52.74.32.140");
		    $("#jid").attr("value", 'alex');
		    $("#pass").attr("value", '123');
		    
		    this.connectToServer();
		    $("#wrapper").show();
		},
		connectToServer: function(){
			var button = 'input#connect';
			if (true) {
			    button.value = 'disconnect';
			    var BOSH_SERVICE = 'http://52.74.32.140:7070/http-bind/?<body rid=/"1/"/>';
				var connection = new Strophe.Connection(BOSH_SERVICE);
			    //connection.rawInput = rawInput;
			    //connection.rawOutput = rawOutput;
			    
				connection.connect($('#jid').get(0).value,$('#pass').get(0).value, this.onConnect);
			} else {
			    button.value = 'connect';
			    connection.disconnect();
			}
		},
		onConnect: function(status){
		    console.log(status+"____awdawdaw");

			$("#chatbox").append('<br>' + $('#to').get(0).value + ':connected');
			if (status == Strophe.Status.CONNECTING) {
				log('Strophe is connecting.');
		    } else if (status == Strophe.Status.CONNFAIL) {
		    	log('Strophe failed to connect.');
		    	$('#connect').get(0).value = 'connect';
		    } else if (status == Strophe.Status.DISCONNECTING) {
		    	log('Strophe is disconnecting.');
		    } else if (status == Strophe.Status.DISCONNECTED) {
		    	log('Strophe is disconnected.');
		    	$('#connect').get(0).value = 'connect';
		    } else if (status == Strophe.Status.CONNECTED) {
				log('Strophe is connected.');
				//connection.disconnect();
				log('ECHOBOT: Send a message to ' + connection.jid + ' to talk to me.');
				
				log('ECHOBOT: Send a message to ' + connection.jid + ' to talk to me.');
				alert("connected");
				connection.addHandler(onMessage, null,    'message', null, null,  null); 
				connection.addHandler(onOwnMessage, null, 'iq', 'set', null,  null); 
				connection.send($pres().tree());
		    };
		},
		sendMessage: function() {
			debugger;
		    var message = $('#message').get(0).value;
		    var to = $('#to').get(0).value; 
		    var BOSH_SERVICE = 'http://52.74.32.140:7070/http-bind/?<body rid=/"1/"/>';
			var connection = new Strophe.Connection(BOSH_SERVICE);
		    if(message && to){
			var reply = $msg({
			    to: to,
			    type: 'chat'
			})
			.cnode(Strophe.xmlElement('body', message)).up()
			.c('active', {xmlns: "http://jabber.org/protocol/chatstates"});

			connection.send(reply);

			//log('I sent ' + to + ': ' + message);
			$("#chatbox").append('<br>' + $("#jid").val() + ': ' + message);
			// Resetting value back to no text/null/empty
			$("#message").attr("value", '');
		    }
		}
	});

	Relationshipspage.prototype.remove = function() {
		$(".banner").show();
		Dispatcher.trigger("header:bindBanner");
	};
	Relationshipspage.prototype.clean = function() {

	};
	return Relationshipspage;
});