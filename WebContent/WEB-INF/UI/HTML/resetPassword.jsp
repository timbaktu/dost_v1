<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>
<html>

	<jsp:include page="includes/commonHeader.jsp"></jsp:include>
	
	<script>
	</script>
	
	<body class="container-fluid  theme-default" onload='document.loginForm.username.focus();'>
			<jsp:include page="includes/header.jsp"></jsp:include>
			<div class="container row-fluid welcomePage">
				<form name='forgotPasswordSignupForm' action="/dost/api/resetPassword?username=${username}" method="POST">
						<div class="well well-large row col-md-7 col-md-offset-2 forgotPasswordContainer">
							<div class="col-md-offset-1">
								<label>Enter new password</label>
								<input type="password" required id="password" name="password" class="input-block-level form-control" placeholder="password">
								<br/><br/>
								<label>Confirm password</label>
								<input type="password" required id="password1" name="password1" class="input-block-level form-control" placeholder="password">
								<br/><br/>
								
								<br/><br/>
								<button class="pull-right btn btn-large btn-primary" type="submit">Proceed ></button>
							</div>
						</div>
						<div class="clearfix"></div>
					</form>
			</div>
		<jsp:include page="includes/commonFooter.jsp"></jsp:include>

</body>
</html>