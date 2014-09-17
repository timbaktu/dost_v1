<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>
<html>

	<jsp:include page="includes/commonHeader.jsp"></jsp:include>
	
	<script>
	
	$( document ).ready(function() {
		
		var username = GetQueryStringParams('username');
		$('#username').val(username);
		$.getJSON("/dost/api/user/" + username, function(user) {
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
	
	function GetQueryStringParams(sParam) {
	    var sPageURL = window.location.search.substring(1);
	    var sURLVariables = sPageURL.split('&');
	    for (var i = 0; i < sURLVariables.length; i++) 
	    {
	        var sParameterName = sURLVariables[i].split('=');
	        if (sParameterName[0] == sParam) 
	        {
	            return sParameterName[1].replace("%20"," ");
	        }
	    }
	}
	</script>
	
	<body class="container-fluid  theme-default" onload='document.loginForm.username.focus();'>
			<jsp:include page="includes/header.jsp"></jsp:include>
			<div class="container row-fluid welcomePage">
				<form name='forgotPasswordSignupForm' action="/dost/api/forgotPasswordSignup" method="POST">
						<div class="well well-large row col-md-7 col-md-offset-2 forgotPasswordContainer">
							<div class="col-md-offset-1">
								<label>Username</label>
								<input type="text" required id="username" name="username" class="input-block-level form-control" placeholder="Username">
								<br/><br/>
								<label id="q1"></label>
								<input id="question1" type="hidden" name="question1">
								<input type="text" required id="answer1" name="answer1" class="input-block-level form-control" placeholder="answer1">
								<br/><br/>
								
								<label id="q2"></label>
								<input id="question2" type="hidden" name="question2">
								<input type="text" required id="answer2" name="answer2" class="input-block-level form-control" placeholder="answer2">
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