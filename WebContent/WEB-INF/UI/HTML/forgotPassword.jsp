<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>
<html>

	<jsp:include page="includes/commonHeader.jsp"></jsp:include>
	
	<script>
	
	$( document ).ready(function() {
		$.getJSON("/dost/api/user/morning", function(user) {
			$.getJSON("/dost/api/securityquestions/" + user.userSecurities[1].questionId, function(question) {
				$('#q1').append(question.question);
				$("input[id=question1]").val(question.questionId);
			});
			$.getJSON("/dost/api/securityquestions/" + user.userSecurities[3].questionId, function(question) {
				$('#q2').append(question.question);
				$("input[id=question2]").val(question.questionId);
			});
		});		
		
	});
	</script>
	
	<body class="container-fluid  theme-default" onload='document.loginForm.username.focus();'>
			<jsp:include page="includes/header.jsp"></jsp:include>
		<div class="container row-fluid welcomePage">
			<div class="col-md-7">
				
			<form name='forgotPasswordSignupForm' action="/dost/api/forgotPasswordSignup">
				<div class="well well-large row  col-md-offset-2 signinFormOuterContainer">
					<div class="col-md-offset-1">
						<label>Username</label>
						<input type="text" required id="username" name="username" class="input-block-level form-control" placeholder="Username">
						<br/><br/>
						<label id="question1">Question1</label>
						<h4 id="q1"></h4>
						<input id="question1" type="hidden" name="question1">
						<input type="text" required id="answer1" name="answer1" class="input-block-level form-control" placeholder="answer1">
						<br/><br/>
						
						<label id="question2">Question2</label>
						<h4 id="q2"></h4>
						<input id="question2" type="hidden" name="question2">
						<input type="text" required id="answer2" name="answer2" class="input-block-level form-control" placeholder="answer2">
						<br/><br/>
						<button class="pull-right btn btn-large btn-primary" type="submit">Sign in</button>
					</div>
				</div>
				<div class="clearfix"></div>
			</form>


			</div>
		</div>
		<jsp:include page="includes/commonFooter.jsp"></jsp:include>

</body>
</html>