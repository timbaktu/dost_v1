<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>

<!DOCTYPE html>
<html lang="en">

	<jsp:include page="includes/commonHeader.jsp"></jsp:include>
	<script>
	$( document ).ready(function() {
		$.get('/dost/api/securityquestions/all', function(response) {
			$("#question1").append('<option value="blank">Select</option>');
			$.each(JSON.parse(JSON.stringify(response)), function(index, value){
				$("#question1").append($('<option></option>').val(value.questionId).html(value.question));
			});
		});
		
		$.get('/dost/api/securityquestions/all', function(response) {
			$("#question2").append('<option value="blank">Select</option>');
			$.each(JSON.parse(JSON.stringify(response)), function(index, value){
				$("#question2").append($('<option></option>').val(value.questionId).html(value.question));
			});
		});
	});
	var avatar = null;
	$(function() {
		/* Adding question*/
		$.getJSON("/dost/api/users", function(user) {
			$("#signin").click(function(event) {
				
				$(".error").html("");
				$(".error").hide();
				
				$(".alert-success").html("");
				$(".alert-success").hide();
				
				var checkAvatar = $(".avatar").hasClass("selectedImage");
				var datatosend = 'username='+$("#username").val()+'&password=' + $("#password").val()+'&avatarId=' + avatar;
			
				for(var i=0; i<user.length; i++){
					if($("#username").val()== user[i].username){
						var usernameExists = true;
						break;
					}
				}
				if(checkAvatar==false || usernameExists == true){
					$(".error").show();
					if(checkAvatar==false){
						$("<p>Please select an avatar</p>").appendTo(".error");	
					}
					if(usernameExists == true){
						$("<p>Username already exists</p>").appendTo(".error");	 	
					}
					event.preventDefault();
				}
				else{

				}
				
				//$('#visitFormResponse').text(response);
				
			});
			
		});
		
			
		 $('#avatarId').on("click", "img", function () {
			 $(".avatar").removeClass("selectedImage");
			 $(this).addClass("selectedImage");
			 avatar = this.id;
			 $("input[id=avatarinput]").val(avatar);
		 });
		 
	});
	
	</script>
	
	<body class="container-fluid theme-default">
		<jsp:include page="includes/header.jsp"></jsp:include>
				
		<div class="container">
			
			<form  class="form-signin" action="http://localhost:8800/dost/api/signup">
				<div class="col-md-7 col-md-offset-2 form-signin-heading">
					<p>Hi,</p>
					<p>Don't worry, whatever it is.. we can fix it together. <em>Get Started!</em></p>
				</div>
				<div class="well well-large row col-md-7 col-md-offset-2 signinFormOuterContainer">
					<div class="error alert alert-danger" role="alert"></div>
					<div class="alert alert-success" role="alert"></div>
					<div id="signindiv" class="col-md-offset-1">
						
						</div><label class="chooseAvatar">Choose your avatar <span>(This is how I will know you)</span></label>

						<div id="avatarId" class="avatarHolder">
							<img class="avatar" src="avatar/avatar1.png" id="avatar1"/>
							<img class="avatar" src="avatar/avatar2.png" id="avatar2"/>
							<img class="avatar" src="avatar/avatar3.png" id="avatar3"/>
							<img class="avatar" src="avatar/avatar4.png" id="avatar4"/>
							<img class="avatar" src="avatar/avatar5.png" id="avatar5"/>
							<img class="avatar" src="avatar/avatar6.png" id="avatar6"/>
							<img class="avatar" src="avatar/avatar7.png" id="avatar7"/>
							
						</div>
						<br/><br/>
						<input id="avatarinput" type="hidden" name="avatarinput">
						<label>Username</label>
						<input id="username" name="username" required type="text" class="form-control input-block-level" placeholder="Create a username">

						<br/><br/>
						
						<label>Password</label>

						<input id="password" name="password" c  type="password" class="form-control input-block-level" placeholder="Set a password">
						
						<br><br>
						
						<label>Secret Question</label>
						<br>
						<select required class="form-control" id="question1" name="question1"></select>
						<br/>
						<input required id="answer1" name="answer1" required type="text" class="form-control input-block-level" placeholder="Please provide the answer">
						
						<br><br>
						
						<select required class="form-control" id="question2" name="question2"></select>
						<br/>
						<input id="answer2" required  name="answer2" required type="text" class="form-control input-block-level" placeholder="Please provide the answer">

						<br/><br/>
						<button id="signin" class="pull-right btn btn-large btn-primary" type="submit">Proceed &gt;</button>
						<a class="pull-right loginText" href="login" alt="Login to an existing account">Have an account? Login Now</a>

					</div>
				</div>
				<div class="clearfix"></div>
			</form>
    </div> <!-- /container -->

	<jsp:include page="includes/commonFooter.jsp"></jsp:include>
	</body>
</html>
