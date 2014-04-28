<!DOCTYPE html>
<html lang="en">
	<head>
		<script src="resources/JS/jquery.js"></script>
		<script src="resources/JS/bootstrap.min.js"></script>
		<script src="resources/JS/script.js"></script>
		<link href="resources/CSS/bootstrap.min.css" rel="stylesheet" media="screen">
		<link href="resources/CSS/style.css" rel="stylesheet" media="screen">
	</head>
	<body class="container-fluid">
		<!--<OBJECT data="header.jsp">
		</OBJECT>-->
		<header class="navbar navbar-inverse navbar-fixed-top">
		  <div class="navbar-inner">
			<div>
			  <a class="navbar-brand" href="index">Dost</a>
			  <div class="nav-collapse collapse">
				<p class="navbar-text pull-right">
					<a href="#" class="navbar-link">Create your account</a>
				</p>
				<!--
					<ul class="nav">
					  <li class="active"><a href="#">Home</a></li>
					  <li><a href="#about">About</a></li>
					  <li><a href="#contact">Contact</a></li>
					</ul>
				-->
			  </div><!--/.nav-collapse -->
			</div>
		  </div>
		</header>
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
			<div class="col-md-3" >
				<div class="login_unit">
					<p>Something bothering you, Feeling Lonely, Not interested in anything...</p>
					<p>I can talk to you, no need to tell me anything about yourself - no name, no email, no photo.. just think of me as your friend who would be there for you when you need him</p>
					<div class="signupLoginOption">
						<p><a href="login" class="btn btn-primary btn-large login_btn">LOGIN TO YOUR ACCOUNT</a></p>
						<a href="signupNow" class="create_account">Create your account</a></p> 
					</div>
				</div>
			</div>
		</div>
		<footer></footer>
	</body>
</html>