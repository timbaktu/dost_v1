<!DOCTYPE html>
<html lang="en">
	<head>
		<script src="../JS/jquery.js"></script> 
		<script src="../JS/bootstrap.min.js"></script>
		<script src="../JS/script.js"></script>
		<link href="../CSS/bootstrap.min.css" rel="stylesheet" media="screen">
		<link href="../CSS/style.css" rel="stylesheet" media="screen">
	</head>
	<body >
		<!--<OBJECT data="header.jsp">
		</OBJECT>-->
		<header class="navbar navbar-inverse navbar-fixed-top">
		  <div class="navbar-inner">
			<div>
			  <a class="navbar-brand" href="/index">Dost</a>
			  <div class="nav-collapse ">
				<ul class="nav navbar-nav pull-right ">
					<li><a href="#" class="navbar-link">Prashant</a></li>
					<li><a href="#" class="navbar-link">Logout</a></li>
				</ul>
				<ul class="nav navbar-nav pull-left">
					  <li><a href="conversations_counselor">Conversations</a></li>
					  <li><a href="talkToFriend_counselor.jsp">Patient History</a></li>
					  <li class="active"><a href="#">Online Counseling</a></li>
					  <li><a href="quotesCounselor_counselor.jsp">Quotes</a></li>
					  <li><a href="faqCounselor_counselor.jsp">FAQs</a></li>
				</ul>
			  </div><!--/.nav-collapse -->
			</div>
		  </div>
		</header>
		<div class="container">
			<div class="col-md-11">
				<div class="pageTop">
					<h2 class="pull-left pageHeading">Online patients</h2>
					<div class="clearfix"></div>
				</div>
				
				<ul class="pull-left col-md-2 left_nav">
					<li class="active"><a href="#">Current</a></li>
					<li><a href="#">Scheduled</a></li>
				</ul>
				<ul class="pull-right col-md-10">
					<!-- each online patient-->
					<li class="media conversation_topic">
						<div class="well media">
							<a class="pull-left col-md-1" href="#">
								<img class="media-object profile_pic"/>
							</a>
							<div class="pull-left media-body col-md-3">
								<h4 class="owner_name">Brusley</h4>
								<span class="pull-left chatPatient">Chat </span>
								<span class="pull-left emailPatient"> 
									<span class="glyphicon glyphicon-envelope"></span>Email
								</span>
							</div>
							<div class="pull-left col-md-4">
								<span class="label label-warning">New</span>
								<div>Hi, can I really talk to you?</div>
							</div>
							<div class="pull-left col-md-2">
								<a href="#">+Label</a><br/>
								<a href="#">+Note</a>
							</div>
						</div>
					</li>
					<!-- each online patient-->
					
					<!-- each online patient-->
					<li class="media conversation_topic">
						<div class="well media">
							<a class="pull-left col-md-1" href="#">
								<img class="media-object profile_pic"/>
							</a>
							<div class="pull-left media-body col-md-3">
								<h4 class="owner_name">Brusley</h4>
								<span class="pull-left chatPatient">Chat </span>
								<span class="pull-left emailPatient"> 
									<span class="glyphicon glyphicon-envelope"></span>Email
								</span>
							</div>
							<div class="pull-left col-md-4">
								<span class="label label-primary">Ongoing</span>
								<div>By: Prashant</div>
							</div>
							<div class="pull-left col-md-2">
								<span>Career,</span><span>Relationship,</span><span>Child,</span><a href="#">+Label</a>
								<a href="#">+Note</a>
							</div>
						</div>
					</li>
					<!-- each online patient-->
					
					<!-- each online patient-->
					<li class="media conversation_topic">
						<div class="well media">
							<a class="pull-left col-md-1" href="#">
								<img class="media-object profile_pic"/>
							</a>
							<div class="pull-left media-body col-md-3">
								<h4 class="owner_name">Brusley</h4>
								<span class="pull-left chatPatient">Chat </span>
								<span class="pull-left emailPatient"> 
									<span class="glyphicon glyphicon-envelope"></span>Email
								</span>
							</div>
							<div class="pull-left col-md-4">
								<span class="label label-info">Existing</span>
								<div>By: Santosh</div>
								<div>Old: Sina, Reshma</div>
							</div>
							<div class="pull-left col-md-2">
								<span>Career,</span><span>Relationship,</span><span>Child,</span><a href="#">+Label</a>
								<a href="#">+Note</a>
							</div>
						</div>
					</li>
					<!-- each online patient-->
					
				</ul>
					
			</div>
		</div>
		<footer></footer>
	</body>
</html>