<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>

<!DOCTYPE html>
<html lang="en">

	<jsp:include page="includes/commonHeader.jsp"></jsp:include>
	<script>
	var avatar = null;
	$(function() {
		/* Adding question*/
		$("#signup").click(function(event) {
			var datatosend = 'username='+$("#username").val()+'&password=' + $("#password").val()+'&avatarId=' + avatar;
			$.post('http://localhost:8800/dost/api/signup', datatosend, function(data,status) {
				alert("Data: " + data + "\nStatus: " + status);
				//$('#visitFormResponse').text(response);
			});
		});
		
		 $('#avatarId').on("click", "img", function () {
			 avatar = this.id;
		 });
		
		
	});
	
	</script>
	
	<body class="container-fluid theme-default">
		<jsp:include page="includes/header.jsp"></jsp:include>
				
		<div class="container">
			<a class="pull-right loginText" href="login" alt='Login to an existing account'>Have an account? LOGIN NOW</a>
			<div class="clearfix"></div>

			<form id="signin" class="form-signin" action="">
				<div class="col-md-7 col-md-offset-2 form-signin-heading">
					<p>Hi,</p>
					<p>Don't worry, whatever it is.. we can fix it together. <em>Get Started!</em></p>
				</div>
				<div class="well well-large row col-md-7 col-md-offset-2 signinFormOuterContainer">
					<div id="signindiv" class="col-md-offset-1">
						<label class="chooseAvatar">Choose your avatar <span>(This is how I will know you)</span></label>

						<div class="avatarHolder">
							<img class="avatar" src="avatar/avatar1.jpg" id="avatar1"/>
							<img class="avatar" src="avatar/avatar2.jpg" id="avatar2"/>
							<img class="avatar" src="avatar/avatar3.jpg" id="avatar3"/>
							<img class="avatar" src="avatar/avatar4.jpg"  id="avatar4"/>
							<img class="avatar" src="avatar/avatar5.jpg" id="avatar5"/>
							<img class="avatar" src="avatar/avatar6.jpg" id="avatar6"/>
							<img class="avatar" src="avatar/avatar7.jpg" id="avatar7"/>
							
						</div>
						<br/><br/>
						
						<label>Username</label>
						<input id="username" type="text" class="form-control input-block-level" placeholder="Create a username">

						<br/><br/>
						
						<label>Password</label>

						<input id="password" type="password" class="form-control input-block-level" placeholder="Set a password">

						<br/><br/>
						<button class="pull-right btn btn-large btn-primary" type="submit">Proceed &gt;</button>
						<a class="pull-right loginText" href="login" alt="Login to an existing account">Have an account? Login Now</a>

						

					</div>
				</div>
				<div class="clearfix"></div>
			</form>
    </div> <!-- /container -->

	<footer></footer>
	</body>
</html>
