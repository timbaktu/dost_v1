<!DOCTYPE html>
<html lang="en">
	<jsp:include page="includes/commonHeader.jsp"></jsp:include>
	<body class="container-fluid">
		<jsp:include page="includes/headerUser.jsp"></jsp:include>
		<div class="container row-fluid">
			<div class="col-md-7">
				<div class="pageTop">
					<h2 class="pull-left pageHeading">Discussions</h2>
					<div class="pull-right">
						<a href="login" class="btn btn-primary btn-large login_btn">Create New Discussion</a>
						<div class="btn-group">
							<a class="btn dropdown-toggle" data-toggle="dropdown" href="#">
								View by
								<span class="caret"></span>
							</a>
							<ul class="dropdown-menu" role="menu" aria-labelledby="dLabel">
								<li><a tabindex="-1" href="#">Recency of Activity</a></li>
								<li><a tabindex="-1" href="#">Date of creation</a></li>
							</ul>
						</div>
					</div>
					<div class="clearfix"></div>
				</div>
				<div>
					<div class="discussion_topic">
						<div class="well media">
							<a class="pull-left" href="discussionsDetails">
								<img class="media-object profile_pic"/>
								<span class="owner_name">Brusley</span>
							</a>
							<div class="media-body">
								<h4 class="media-heading">Media heading<span> (created on: 31st July)</span></h4>
								Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.
							</div>
						</div>
						<div class="offset1 well well-small discussionComments">
							 <span>Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ant</span>
							 <span class="time_taken pull-right">15 seconds ago</span>
						</div>
					</div>

					<div class="discussion_topic">
						<div class="well media">
							<a class="pull-left" href="discussionsDetails">
								<img class="media-object profile_pic"/>
								<span class="owner_name">Brusley</span>
							</a>
							<div class="media-body">
								<h4 class="media-heading">Media heading<span> (created on: 31st July)</span></h4>
								Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.
							</div>
						</div>
						<div class="offset1 well well-small discussionComments">
							 <span>Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ant</span>
							 <span class="time_taken pull-right">15 seconds ago</span>
						</div>
					</div>
					
					<div class="discussion_topic">
						<div class="well media">
							<a class="pull-left" href="#">
								<img class="media-object profile_pic"/>
								<span class="owner_name">Brusley</span>
							</a>
							<div class="media-body">
								<h4 class="media-heading">Media heading<span> (created on: 31st July)</span></h4>
								Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.
							</div>
						</div>
						<div class="offset1 well well-small discussionComments">
							 <span>Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ant</span>
							 <span class="time_taken pull-right">15 seconds ago</span>
						</div>
					</div>
				</div>
			</div>
			<jsp:include page="includes/signUp.jsp"></jsp:include>
		</div>
		<jsp:include page="includes/commonFooter.jsp"></jsp:include>
	</body>
</html>