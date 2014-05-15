<!DOCTYPE html>
<html lang="en">
	<jsp:include page="includes/commonHeader.jsp"></jsp:include>
	<body class="container-fluid">
		<jsp:include page="includes/headerUser.jsp"></jsp:include>
		
		<div class="container">
			<a class="pull-right loginText" href="login" alt="Login to an existing account">Have an account? LOGIN NOW</a>
			<div class="clearfix"></div>
			<form class="form-signin">
				<h3 class="span7 offset2 form-signin-heading">
					<p>Hi,</p>
					<p>Don't worry, whatever it is.. we can fix it together. <em>Get Started!</em></p>
				</h3>
				<div class="well well-large row span7 offset2 signinFormOuterContainer">
					<div class="span5 offset1">
						<label class="chooseAvatar">Choose your avatar <span>(This is how I will know you)</span></label>
						<div class="avatarHolder">
							<img class="avatar" id="avatar1"/>
							<img class="avatar" id="avatar2"/>
							<img class="avatar" id="avatar3"/>
							<img class="avatar" id="avatar4"/>
							<img class="avatar" id="avatar5"/>
						</div>
						<div class="avatarHolder">
							<img class="avatar" id="avatar6"/>
							<img class="avatar" id="avatar7"/>
							<img class="avatar" id="avatar8"/>
							<img class="avatar" id="avatar9"/>
							<img class="avatar" id="avatar10"/>
						</div>
						<br/><br/>
						<label>Username</label>
						<input type="text" class="input-block-level" placeholder="Username">
						<br/><br/>
						
						<label>Password</label>
						<input type="password" class="input-block-level" placeholder="Password">
						<br/><br/>
						<button class="pull-right btn btn-large btn-primary" type="submit">Proceed ></button>
						<a class="pull-left loginText" href="login" alt="Login to an existing account">Have an account? Login Now</a>
					</div>
				</div>
				<div class="clearfix"></div>
			</form>
    </div> <!-- /container -->

	<footer></footer>
	</body>
</html>