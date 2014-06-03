<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>
<html>
<head>
<title>Login Page</title>
	<head>
		<script src="resources/JS/jquery.js"></script>
		<script src="resources/JS/bootstrap.min.js"></script>
		<script src="resources/JS/script.js"></script>
		<link href="resources/CSS/bootstrap.min.css" rel="stylesheet" media="screen">
		<link href="resources/CSS/style.css" rel="stylesheet" media="screen">
		<link href='http://fonts.googleapis.com/css?family=Open+Sans&subset=latin-ext' rel='stylesheet' type='text/css'>
	</head>
</head>
<body class="container-fluid" onload='document.loginForm.username.focus();'>

			<jsp:include page="user/includes/headerUser.jsp"></jsp:include>
			<!-- <header id="main-navbar" class="navbar navbar-inverse navbar-fixed-top">
			  <div class="navbar-inner">
				<div>
				  <a class="navbar-brand" href="index" >
				  	<img src="resources/img/logoSmall.jpg" height="47px"/>
				  </a>
				  <div class="nav-collapse navbar-collapse ">
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
				  </div>
				</div>
			  </div>
		</header> -->
				<div class="container row-fluid welcomePage">
			<div class="col-md-7">


			<a class="pull-right signupNowText" href="signupNow" alt="Signup for a new account">Don't have an account? SIGNUP NOW</a>
			<div class="clearfix"></div>
			
			<form name='loginForm' action="<c:url value='/j_spring_security_check' />" method='POST'>
				<h3 class="col-md-7 col-md-offset-2 form-signin-heading">
					<p>Hi,</p>
					<p>Don't worry, whatever it is.. we can fix it together. <em>Get Started!</em></p>
				</h3>
				
				<div class="well well-large row col-md-7 col-md-offset-2 signinFormOuterContainer">
					<div class="col-md-10 col-md-offset-1">
						<label>Username</label>
						<input type="text" id="username" name="username" class="input-block-level form-control" placeholder="Username">
						<br/><br/>
						
						<label>Password</label>
						<input type="password" id="password" name="password" class="input-block-level form-control" placeholder="Password">
						<a class="pull-right" alt="Forgot Password" href="forgotPassword">Forgot Password?</a>
						<label class="checkbox">
							<input type="checkbox" value="remember-me"> Remember me
						</label>
						<br/><br/>
						<button class="pull-right btn btn-large btn-primary" type="submit">Sign in</button>
						<a class="pull-left signupNowText" href="signupNow" alt="Signup for a new account">Don't have an account? SIGNUP NOW</a>
									<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" />
					</div>
				</div>
				<div class="clearfix"></div>
			</form>


			</div>
		</div>
		<jsp:include page="user/includes/commonFooter.jsp"></jsp:include>

</body>
</html>