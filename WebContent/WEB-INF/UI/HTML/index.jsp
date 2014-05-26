<!DOCTYPE html>
<html lang="en">
	<head>
		<script src="resources/JS/jquery.js"></script>
		<script src="resources/JS/bootstrap.min.js"></script>
		<script src="resources/JS/script.js"></script>
		<link href="resources/CSS/bootstrap.min.css" rel="stylesheet" media="screen">
		<link href="resources/CSS/style.css" rel="stylesheet" media="screen">
		<link href='http://fonts.googleapis.com/css?family=Open+Sans&subset=latin-ext' rel='stylesheet' type='text/css'>
	</head>
	<body class="container-fluid">
		<header id="main-navbar" class="navbar navbar-inverse navbar-fixed-top">
			  <div class="navbar-inner">
				<div>
				  <a class="navbar-brand" href="index" >
				  	<img src="resources/img/logoSmall.jpg" height="47px"/>
				  </a>
				  <div class="nav-collapse navbar-collapse ">
					<!--<p class="navbar-text pull-right">
						<a href="#" class="navbar-link">Create your account</a>
					</p>-->
					<ul class="nav navbar-nav pull-right ">
						
						<li><a href="login" class="btn btn-primary btn-large signup_now">SIGNUP NOW</a></li>
						<li><a href="#" class="navbar-link">${pageContext.request.userPrincipal.name}</a></li>
						<li><a href="../index" class="navbar-link">Logout</a></li>
					</ul>
					<ul class="nav navbar-nav pull-left">
						  <li class="active"><a href="#">Conversations</a></li>
						  <li><a href="talkToFriend">Talk To a Friend</a></li>
						  <li><a href="faqs">FAQs</a></li>
						  <li><a href="resources">Resources</a></li>
					</ul>
				  </div><!--/.nav-collapse -->
				</div>
			  </div>
		</header>
		<div class="container row-fluid welcomePage">
			<div class="col-md-7">
				<ul>
					<li class="exploration_option well" id="discussions">
						<a href="discussionsAll">
							<h3 class="categoryName">Dicussions</h3>
							<ul class="details_box">
								<li>
									<h4 class="topic_categoryName">Lorem ipsum dolor sit amet, consectetur adipiscing elit</h4>
									<div>
										<span>Last updated:</span><span>25<sup>th</sup> May 2013</span>
									</div>
								</li>
								
								<li>
									<h4 class="topic_categoryName">Lorem ipsum dolor sit amet, consectetur adipiscing elit</h4>
									<div>
										<span>Last updated:</span><span>25<sup>th</sup> May 2013</span>
									</div>
								</li>
								
							</ul>
							
							
						</a>
					</li>
					
					<li class="exploration_option well" id="faqs">
						<a href="faqs">
							<h3 class="categoryName">Frequently Asked Questions</h3>
							<ul class="details_box">
								<li>
									<h4 class="topic_categoryName">Lorem ipsum dolor sit amet, consectetur adipiscing elit</h4>
								</li>
								
								<li>
									<h4 class="topic_categoryName">Lorem ipsum dolor sit amet, consectetur adipiscing elit</h4>
								</li>
								
							</ul>
						</a>
					</li>
					
					<li class="exploration_option well" id="personalityTest">
						<a href="/discussions">
							<h3 class="categoryName">Personality Tests</h3>
							<ul class="details_box">
								<li>
									<h4 class="topic_categoryName">Find out about your personality!</h4>
								</li>
								
							</ul>
							
							
						</a>
					</li>
					
					<li class="exploration_option well" >
						<h3>Quotes</h3>
						<div></div>
					</li class="exploration_option well" >
					<li class="exploration_option well">
						<h3>Horoscopes</h3>
						<div></div>
					</li>
					<li class="exploration_option well" >
						<h3>Destressing Games</h3>
						<div></div>
					</li>
				</ul>
			</div>
			<jsp:include page="user/includes/signUp.jsp"></jsp:include>
		</div>
		<jsp:include page="user/includes/commonFooter.jsp"></jsp:include>
	</body>
</html>