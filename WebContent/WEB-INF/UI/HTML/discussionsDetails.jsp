<!DOCTYPE html>
<html lang="en">
	<head>
		<script src="../JS/jquery.js"></script> 
		<script src="../JS/bootstrap.min.js"></script>
		<link href="../CSS/bootstrap.min.css" rel="stylesheet" media="screen">
		<link href="../CSS/style.css" rel="stylesheet" media="screen">
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
					<div class="pull-left breadcrumbContainer">
						<a  href="discussionsAll.jsp">&larr; Back to all Discussions</a>
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
			<div class="col-md-3" >
				<div class="login_unit">
					<p>Something bothering you, Feeling Lonely, Not interested in anything...</p>
					<p>I can talk to you, no need to tell me anything about yourself - no name, no email, no photo.. just think of me as your friend who would be there for you when you need him</p>
					<div class="signupLoginOption">
						<p><a href="login.jsp" class="btn btn-primary btn-large login_btn">LOGIN TO YOUR ACCOUNT</a></p>
						<a href="signupNow.jsp" class="create_account">Create your account</a></p> 
					</div>
				</div>
			</div>
		</div>
		<footer></footer>
	</body>
</html>