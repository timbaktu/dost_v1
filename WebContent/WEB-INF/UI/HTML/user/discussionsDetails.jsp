<!DOCTYPE html>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html lang="en">
	<jsp:include page="includes/commonHeader.jsp"></jsp:include>
	<body class="container-fluid">
		<jsp:include page="includes/headerUser.jsp"></jsp:include>
		<div class="container row-fluid">
			<div class="col-md-7">
				<div class="pageTop">
					<div class="pull-left breadcrumbContainer">
						<a  href="discussionsAll">&larr; Back to all Discussions</a>
					</div>
					<div class="pull-right">
						<a href="login.jsp" class="btn btn-primary btn-large login_btn">Create New Discussion</a>
					</div>
					<div class="clearfix"></div>
				</div>
				<div>
					<div class="well discussion_topic">
						<div class="media">
							<a class="pull-left" href="#">
								<img class="media-object profile_pic"/>
								<span class="owner_name">Brusley</span>
							</a>
							<div class="media-body">
								<h4 class="media-heading">Media heading</h4><span>(created on: 31st July)</span>
								Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.
							</div>
						</div>
						<div>
							<ul class="discussionActionOptions">
								<li>Comment</li>
								<li>Follow Discussion</li>
							</ul>
						</div>
						
					</div>
					<h4><em>Responses</em></h4>
					<ul class="responses details_box">
						<li class="media">
							<a class="pull-left" href="#">
								<img class="media-object profile_pic"/>
							</a>
							<div class="media-body">
									Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. .
							</div>
							<div class="author_details comment_action">
								<div class="pull-left">
									<span>Sara</span>
									<span class="time_taken">15 seconds ago</span>
								</div>
								<div class="pull-right">
									<ul>
										<li>20Likes</li>
										<li>Like</li>
									</ul>	
								</div>
								<div class="clearfix"></div>
							</div>
						</li>
							
						<li class="media">
							<a class="pull-left" href="#">
								<img class="media-object profile_pic"/>
							</a>
							<div class="media-body">
									Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. .
							</div>
							<div class="author_details comment_action">
								<div class="pull-left">
									<span>Sara</span>
									<span class="time_taken">15 seconds ago</span>
								</div>
								<div class="pull-right">
									<ul>
										<li>20Likes</li>
										<li>Like</li>
									</ul>	
								</div>
								<div class="clearfix"></div>
							</div>
						</li>
						<li class="media">
							<a class="pull-left" href="#">
								<img class="media-object profile_pic"/>
							</a>
							<div class="media-body">
									Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. .
							</div>
							<div class="author_details comment_action">
								<div class="pull-left">
									<span>Sara</span>
									<span class="time_taken">15 seconds ago</span>
								</div>
								<div class="pull-right">
									<ul>
										<li>20Likes</li>
										<li>Like</li>
									</ul>	
								</div>
								<div class="clearfix"></div>
							</div>
						</li>
						<li class="media">
							<a class="pull-left" href="#">
								<img class="media-object profile_pic"/>
							</a>
							<div class="media-body">
									Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. .
							</div>
							<div class="author_details comment_action">
								<div class="pull-left">
									<span>Sara</span>
									<span class="time_taken">15 seconds ago</span>
								</div>
								<div class="pull-right">
									<ul>
										<li>20Likes</li>
										<li>Like</li>
									</ul>	
								</div>
								<div class="clearfix"></div>
							</div>
						</li>						
						
								
					</ul>	
				</div>
			</div>
			<sec:authorize access="hasRole('ROLE_USER')">
				<jsp:include page="includes/signUp.jsp"></jsp:include>
			</sec:authorize>
		</div>
		<jsp:include page="includes/commonFooter.jsp"></jsp:include>
	</body>
</html>