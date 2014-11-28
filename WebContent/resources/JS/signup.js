$( document ).ready(function() {
		$.get('/dost/api/securityquestions/all', function(response) {
			$("#question1").append('<option value="blank">Select your first secret question</option>');
			$.each(JSON.parse(JSON.stringify(response)), function(index, value){
				$("#question1").append($('<option></option>').val(value.questionId).html(value.question));
			});
		});
		
		$.get('/dost/api/securityquestions/all', function(response) {
			$("#question2").append('<option value="blank">Select your second secret question</option>');
			$.each(JSON.parse(JSON.stringify(response)), function(index, value){
				$("#question2").append($('<option></option>').val(value.questionId).html(value.question));
			});
		});
		
		$('input[name="username"]').blur( function(){
			var username = $('input[name="username"]').val() ;
			if( !username.match( /[a-z][A-Z]/ ) ){
				$("#usernameError").show() ;
				$("#signin").attr("disabled","true");
			}
			
		});
		
		$('input[name="password"]').blur( function(){
			var password = $('input[name="password"]').val() ;
			if( password.match( /\s*/ ) ){
				$("#passwordError").show()          ;
				$("#signin").attr("disabled","true");
			}
			
		});
		
	});
	var avatar = null;
	$(function() {
		/* Adding question*/
		$.getJSON(  "/dost/api/users", function(user) {
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
