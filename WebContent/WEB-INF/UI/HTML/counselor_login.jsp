
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
			<div class="container-fluid">
			  <a class="navbar-brand" href="#">Dost</a>
			  </div><!--/.nav-collapse -->
		  </div>
		</header>
		
		<div class="container">
			<div class="pageTop row col-md-7 col-md-offset-2">
					<h2 class="pageHeading">Counselor Login</h2>
			</div>
			<form class="form-signin" METHOD="POST" action="conversations_counselor.jsp">
				<div class="well well-large row col-md-7 col-md-offset-2 signinFormOuterContainer">
					<div class="col-md-10 col-md-offset-1">
						<label>Username</label>
						<input type="text" class="input-block-level form-control" placeholder="Username">
						<br/><br/>
						
						<label>Password</label>
						<input type="password" class="input-block-level form-control" placeholder="Password">
						<a class="pull-right" alt="Forgot Password" href="forgotPassword.jsp">Forgot Password?</a>
						<label class="checkbox">
							<input type="checkbox" value="remember-me"> Remember me
						</label>
						<br/><br/>
						<button class="pull-right btn btn-large btn-primary" type="submit">Sign in</button>
						<a class="pull-left signupNowText" href="signupNow.jsp" alt="Signup for a new account">Don't have an account? SIGNUP NOW</a>
					</div>
				</div>
				<div class="clearfix"></div>
			</form>
		</div> <!-- /container -->

	<footer></footer>
	</body>
</html>