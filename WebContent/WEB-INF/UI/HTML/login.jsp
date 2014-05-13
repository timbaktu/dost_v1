<!DOCTYPE html>
<html lang="en">
	<head>
		<script src="resources/JS/jquery.js"></script>
		<script src="resources/JS/bootstrap.min.js"></script>
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
		
		<div class="container">
			<a class="pull-right signupNowText" href="signupNow" alt="Signup for a new account">Don't have an account? SIGNUP NOW</a>
			<div class="clearfix"></div>
			<form class="form-signin" METHOD="POST" action="authenticate">
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
					</div>
				</div>
				<div class="clearfix"></div>
			</form>
    </div> <!-- /container -->

	<footer></footer>
	</body>
</html>