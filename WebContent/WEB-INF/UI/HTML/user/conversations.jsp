<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
	<jsp:include page="includes/commonHeader.jsp"></jsp:include>
	<body >
		<jsp:include page="includes/headerUser.jsp"></jsp:include>
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
						<a href="login" class="btn btn-primary btn-large login_btn">Speak to friend online</a>
						<a href="login" class="btn btn-primary btn-large login_btn">Leave a message to your friend</a>
					</div>
					<div class="clearfix"></div>
				</div>
				<!-- each conversation-->
				<ul>
					<li class="well media conversation_topic">
						<a class="pull-left col-md-2" href="#">
							<div class="friend_name">Brusley</div>
							<div class="date_of_conversation">13 Apr 2014</div>
						</a>
						<div class="media-body col-md-8">
							Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.
						</div>
						
						<div class="pull-right col-md-1">
							<a href="conversationDetails"> View
							<span class="glyphicon glyphicon-chevron-right"></span>
							</a>
						</div>
					</li>
				<!-- end of each conversation-->
				<!-- each conversation-->
					<li class="well media conversation_topic">
						<a class="pull-left col-md-2" href="#">
							<div class="friend_name">Brusley</div>
							<div class="date_of_conversation">13 Apr 2014</div>
						</a>
						<div class="media-body col-md-8">
							Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.
						</div>
						
						<div class="pull-right col-md-1">
							<a href="conversationDetails"> View
							<span class="glyphicon glyphicon-chevron-right"></span>
							</a>
						</div>
					</li>
				<!-- end of each conversation-->
				<!-- each conversation-->
					<li class="well media conversation_topic">
						<a class="pull-left col-md-2" href="#">
							<div class="friend_name">Brusley</div>
							<div class="date_of_conversation">13 Apr 2014</div>
						</a>
						<div class="media-body col-md-8">
							Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.
						</div>
						
						<div class="pull-right col-md-1">
							<a href="conversationDetails"> View
							<span class="glyphicon glyphicon-chevron-right"></span>
							</a>
						</div>
					</li>
				
				<!-- end of each conversation-->
				<!-- each conversation-->
				
					<li class="well media conversation_topic">
						<a class="pull-left col-md-2" href="#">
							<div class="friend_name">Brusley</div>
							<div class="date_of_conversation">13 Apr 2014</div>
						</a>
						<div class="media-body col-md-8">
							Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.
						</div>
						
						<div class="pull-right col-md-1">
							<a href="conversationDetails"> View
							<span class="glyphicon glyphicon-chevron-right"></span>
							</a>
						</div>
					</li>
				
				<!-- end of each conversation-->
				<!-- each conversation-->
				
					<li class="well media conversation_topic">
						<a class="pull-left col-md-2" href="#">
							<div class="friend_name">Brusley</div>
							<div class="date_of_conversation">13 Apr 2014</div>
						</a>
						<div class="media-body col-md-8">
							Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.
						</div>
						
						<div class="pull-right col-md-1">
							<a href="conversationDetails"> View
							<span class="glyphicon glyphicon-chevron-right"></span>
							</a>
						</div>
					</li>
				</ul>
				<!-- end of each conversation-->
			</div>
			<!-- 
			/*not required only fr logged in */
			<div class="span3" >
				<div class="login_unit">
					<p>Something bothering you, Feeling Lonely, Not interested in anything...</p>
					<p>I can talk to you, no need to tell me anything about yourself - no name, no email, no photo.. just think of me as your friend who would be there for you when you need him</p>
					<div class="signupLoginOption">
						<p><a href="login.jsp" class="btn btn-primary btn-large login_btn">LOGIN TO YOUR ACCOUNT</a></p>
						<a href="signupNow.jsp" class="create_account">Create your account</a></p> 
					</div>
				</div>
			</div>
			-->
		</div>
		<jsp:include page="includes/commonFooter.jsp"></jsp:include>
	</body>
</html>
