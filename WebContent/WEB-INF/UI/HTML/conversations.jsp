<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
	<jsp:include page="includes/commonHeader.jsp"></jsp:include>
	
	<script>
	/*Manipulating json for messages*/
	$( document ).ready(function() {
		var userid;
		$.getJSON("/dost/api/user/${pageContext.request.userPrincipal.name}", function(user) {
			userid = user.userId;
		});
		alert(userid)
		$.getJSON("/dost/api/user/"+userid+"/messages", function(messages) {	
				for (var i = 0 ; i < messages.length; i++) {
					$(".conversationsUser").append('<li class="well media conversation_topic">'+
													'<a class="pull-left col-md-2" href="#">'+
														'<div class="friend_name">'+messages[i].sender.username+'</div>'+
														'<div class="date_of_conversation">'+messages[i].sentDate+'</div>'+
													'</a>'+
													'<div class="media-body col-md-8">'+
															'<h4>'+messages[i].subject+'</h4>'+
															'<span>'+messages[i].content+'</span>'+
													'</div>'+
													'<div class="pull-right col-md-1">'+
														'<a href="conversationDetails"> View'+
															'<span class="glyphicon glyphicon-chevron-right"></span>'+
														'</a>'+
													'</div>'+
												'</li>');		
				}
				
				for (var i = 0 ; i < messages.length; i++) {
					$(".conversationsCounselor").append('<li class="well media conversation_topic">'+
							'<a class="pull-left col-md-2" href="conversationsExpanded">'+
								'<span class="conversationalist">'+messages[i].sender.username+'</span>'+
								'<span>(20)</span>'+
							'</a>'+
							'<div class="pull-left media-body col-md-7">'+
									'<h4 class="media-heading">'+messages[i].subject+'</h4>'+
									'<span style="conversation_summary">'+messages[i].content+'</span>'+
							'</div>'+
							'<div class="pull-left">'+messages[i].sentDate+'</div>'+
							'<div class="pull-right col-md-1">'+
								'<a href="conversationsExpanded">'+
									'<span class="glyphicon glyphicon-chevron-right"></span>'+
								'</a>'+
							'</div>'+
						'</li>');
				}
			});
			
		
		/*populating users*/
		$( "#autocomplete" ).autocomplete({
			 source: function( request, response ) {
	                $.ajax({
	                    url: "/dost/api/users",
	                    dataType: "json",
	                    data: {term: request.term},
	                    success: function(data) {
	                                response($.map(data, function(users) {
	                                return {
	                                    label: users.username,
	                                    };
	                            }));
	                        }
	                    });
	                },
	          minLength:0
		});
		/*end of populating users*/
		
			
			
	});
	/*End of manipulating json for messages*/	
	
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
						<h2 class="pull-left pageHeading">Conversations</h2>
						<div class="pull-right">
							<ul class="pagination">
							  <li class="disabled"><a href="#">&laquo;</a></li>
							  <li class="active"><a href="#">1 <span class="sr-only">(current)</span></a></li>
							  <li><a href="#">2</a></li>
							  <li><a href="#">3</a></li>
							  <li><a href="#">4</a></li>
							  <li><a href="#">5</a></li>
							  <li><a href="#">&raquo;</a></li>
							</ul>
						</div>
						<div class="clearfix"></div>
					</div>
					
					<ul class="pull-left col-md-2 left_nav">
						<li><a class="leaveMessage">Compose</a><br/><br/></li>
						<li class="active"><a href="#">Inbox</a></li>
						<li><a href="#">Sent Items</a></li>
						<li><a href="#">Drafts</a><br/><br/></li>
						<li><a href="#">Label 1</a></li>
						<li><a href="#">Label 2</a></li>
					</ul>
					<ul class="pull-right conversationsCounselor col-md-10">
						<!-- each conversation-->
					</ul>
						
				</div>
			</div>
		</sec:authorize>
		<sec:authorize access="!hasRole('ROLE_ADMIN')">
			<div class="container">
				<div class="col-md-11">
					<div class="pageTop">
						<h2 class="pull-left pageHeading">Conversations</h2>
						<div class="pull-right">
							<ul class="pagination">
							  <li class="disabled"><a href="#">&laquo;</a></li>
							  <li class="active"><a href="#">1 <span class="sr-only">(current)</span></a></li>
							  <li><a href="#">2</a></li>
							  <li><a href="#">3</a></li>
							  <li><a href="#">4</a></li>
							  <li><a href="#">5</a></li>
							  <li><a href="#">&raquo;</a></li>
							</ul>
							<a href="talkToFriend" class="btn btn-primary btn-large login_btn">Speak to friend online</a>
							<input type="button" class="leaveMessage btn btn-primary btn-large login_btn" value="Leave a message to your friend"></input>
						</div>
						<div class="clearfix"></div>
					</div>
					<!-- each conversation-->
					<ul class="conversationsUser">
							
					
					</ul>
					
				</div>
			</div>
		</sec:authorize>
		<jsp:include page="includes/popupEmail.jsp"></jsp:include>
		<jsp:include page="includes/commonFooter.jsp"></jsp:include>
	</body>
</html>