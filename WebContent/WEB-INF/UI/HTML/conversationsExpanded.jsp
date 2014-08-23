<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
	<jsp:include page="includes/commonHeader.jsp"></jsp:include>
	
	<script>
	$( document ).ready(function() {
		$.getJSON("/dost/api/user/${pageContext.request.userPrincipal.name}", function(user) {
			userid = user.userId;
			userRole = user.dbUserRole.role;
			var threadId = window.location.href.split("=");
		
			// Setting message as read
			//message/{messageId}/user/{userId}/markasread"
			$.getJSON("/dost/api/message/"+threadId[1]+"/user/" + userid +"/markasread", function(messages) {
				
			});
			
			/*Manipulating json for conversation thread*/
			$.getJSON("/dost/api/message/"+threadId[1]+"/", function(messages) {
				$("#subjectHeading").text(messages[0].subject);
				for (var i = 0 ; i < messages.length ; i++) {
						$(".conversation_history").append('<li>'+
														'<h4 class="media-heading">'+ messages[i].sender.username+ '<span> &nbsp' +messages[i].sentDate +'</span></h4>'+
														messages[i].content+
													'</li>');
				}
				
				$(".sendReply").click(function(){
					if(userRole == "ROLE_USER"){
						var receipient = "all";
					}
					else{
						for (var i = 0 ; i < messages.length ; i++){
							if(messages[i].sender.dbUserRole.role=="ROLE_USER"){
								var receipient = messages[i].sender.userId;
							}
							break;
						}
						
					}
					$(".error").html("");
					$(".error").hide();
					
					var datatosend = 'subject='+messages[0].subject+'&content=' + $("#messageContent").val()+ '&recipients='+receipient+'&senderId=' + userid+'&msgId='+threadId[1];
					
					if($("#messageContent").val() =='') {
						$(".error").show().text("Please type out the reply");
					}
					else{
						
						$.post('http://localhost:8800/dost/api/user/message', datatosend, function(response) {							
						//$('#visitFormResponse').text(response);
						});
						
						window.setTimeout('location.reload()', 1000);
						receipient = 'all';
					}
				});	
				
			} );
			/*End of Manipulating json for conversation thread*/
		});	
		
		$(".addNote").click(function(){
			$(".notePopup").show();		
		});
		
		$(".cancelButton").click(function(){
			$(this).closest(".notePopup").hide();
		});
		
	});
	
	</script>
	
	<sec:authorize access="hasRole('ROLE_ADMIN')">
	
	<body class="theme-default theme-default-counselor" >
	</sec:authorize>
	<sec:authorize access="!hasRole('ROLE_ADMIN')">
	<body class="theme-default">
	</sec:authorize>
		<jsp:include page="includes/header.jsp"></jsp:include>
		<sec:authorize access="hasRole('ROLE_ADMIN')">
			<div class="container">
				<div class="col-md-11">
					<div class="pageTop">
						<h2 class="pull-left pageHeading col-md-offset-2">
								<a  href="conversations">&larr; Back to all Conversations</a>
						</h2>
						<div class="clearfix"></div>
					</div>
					
					<!-- <ul class="pull-left col-md-2 left_nav">
						<li><a href="#">Compose</a><br/><br/></li>
						<li class="active"><a href="#">Inbox</a></li>
						<li><a href="#">Sent Items</a></li>
						<li><a href="#">Drafts</a><br/><br/></li>
						<li><a href="#">Label 1</a></li>
						<li><a href="#">Label 2</a></li> 
					</ul>-->
					<div class="pull-right col-md-10">
						<div class="pull-left col-md-9">
							<h4 id="subjectHeading" class="pull-left"></h4>
							<div class="pull-right">
								<div class="btn-group">
								  <a href="#replyArea" type="button" class="btn btn-default">Reply</a>
								  <button type="button" class="btn btn-default addNote">Add Note</button>
	
								  <!-- <div class="btn-group">
									<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
									  Label
									  <span class="caret"></span>
									</button>
									<ul class="dropdown-menu">
									  <li><a href="#">career</a></li>
									  <li><a href="#">love relationship</a></li>
									  <li><a href="#">office stress</a></li>
									</ul>
								  </div> -->
								</div>
							</div>
							<div class="clearfix"></div>
							<ul class="conversation_history">
								
							</ul>
							<!--<a href="#" class="pull-right conversationDetails"> View more conversations
								<span class="glyphicon glyphicon-chevron-right"></span>
							</a> -->
							<div class="clearfix"></div>
							<div id="replyArea" class="reply_to_conversation">
								<textarea class="form-control" id="messageContent" rows="3"></textarea>
								<button type="button" class="sendReply pull-right btn btn-primary">Submit</button>
							
							</div>
						</div>
						<!--<jsp:include page="includes/patientHistory.jsp"></jsp:include>-->
						<div class="clearfix"></div>
						
					</div>
				</div>
						
			</div>
		</sec:authorize>
		<sec:authorize access="!hasRole('ROLE_ADMIN')">
			<div class="container">
				<div class="col-md-11">
					<div class="pageTop">
						<h2 class="pull-left pageHeading col-md-offset-2">
								<a  href="conversations">&larr; Back to all Conversations</a>
						</h2>
						<div class="clearfix"></div>
					</div>
					
					<div class="pull-right col-md-10">
						<div class="pull-left col-md-9">
							<h4 id="subjectHeading" class="pull-left"></h4>
							<div class="pull-right">
								<div class="btn-group">
								  <button type="button" class="btn btn-default">Reply</button>
								  <button type="button" class="btn btn-default">Add Note</button>
	
								  <div class="btn-group">
									<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
									  Label
									  <span class="caret"></span>
									</button>
									<ul class="dropdown-menu">
									  <li><a href="#">career</a></li>
									  <li><a href="#">love relationship</a></li>
									  <li><a href="#">office stress</a></li>
									</ul>
								  </div>
								</div>
							</div>
							<div class="clearfix"></div>
							<ul class="conversation_history">
								
							</ul>
							<a href="#" class="pull-right conversationDetails"> View more conversations
								<span class="glyphicon glyphicon-chevron-right"></span>
							</a>
							<div class="clearfix"></div>
							<div class="reply_to_conversation">
								<div class="error alert alert-danger" role="alert"></div>
								<textarea class="form-control" id="messageContent" rows="3"></textarea>
								<button type="button"  class="sendReply pull-right btn btn-primary">Submit</button>
							
							</div>
						</div>
						<div class="clearfix"></div>
						
					</div>
				</div>
						
			</div>
				
		</sec:authorize>
		<div class="notePopup">
			<form>
				<textarea class="form-control" id="messageContent" rows="3"></textarea>
				<button type="button"  class="addNoteButton pull-right btn btn-primary">Submit</button>
				<button type="button"  class="cancelButton pull-right btn btn-outline">Cancel</button>
				
				
			</form>
		</div>
		<jsp:include page="includes/commonFooter.jsp"></jsp:include>
	</body>
</html>