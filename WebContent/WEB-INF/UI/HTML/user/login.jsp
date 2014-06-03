<!DOCTYPE html>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html lang="en">
	<jsp:include page="includes/commonHeader.jsp"></jsp:include>
	<body class="container-fluid">
		<jsp:include page="includes/headerUser.jsp"></jsp:include>
		<div class="container">
			<a class="pull-right signupNowText" href="signupNow" alt="Signup for a new account">Don't have an account? SIGNUP NOW</a>
			<div class="clearfix"></div>
			<form class="form-signin" METHOD="POST" action="../authenticate">
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

	<jsp:include page="includes/commonFooter.jsp"></jsp:include>
	</body>
</html>