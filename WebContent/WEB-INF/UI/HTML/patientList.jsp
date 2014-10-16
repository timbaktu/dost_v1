<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
	<jsp:include page="includes/commonHeader.jsp"></jsp:include>
	<script>
		$("document").ready(function() {
			$.getJSON("/dost/api/chathistory/users", function(userchat) {
				$(".loading").hide();
				for(var i=0; i<userchat.length; i++){
					debugger;
					var user = userchat[i].user;
					var chats = userchat[i].userChats;
					
					var mergedChatToShow = '';
					for(var j=0; j<chats.length; j++) {
						if(j > 0)
							mergedChatToShow = mergedChatToShow + '<br>';
						mergedChatToShow = mergedChatToShow + chats[j].body;
					}
					
					$(".patient_list").append('<li class="media ceac_patient">'+
							'<a class="pull-left col-md-6" href="patientDetails?='+user.username+"+"+user.userId+'">'+
								'<img class="avatar" id='+user.avatar+' src="avatar/'+user.avatar+'.png" name='+user.avatar+'/>'+
								'<span class="patient_name">'+user.username+'</span>'+
								'<span class="pull-right glyphicon glyphicon-chevron-right"></span>'+
							'</a>'+
							
						'</li>');
					
					}					
			});	
		});
	</script>
		
	<body class="theme-default theme-default-counselor" >
		<jsp:include page="includes/header.jsp"></jsp:include>
		<div class="container row-fluid">
			<div class="pageTop">
					<h2 class="pull-left pageHeading">
						Patient History
					</h2>
					<div class="clearfix"></div>
			</div>
			<div class="col-md-11 well">
				<div class="pull-left col-md-12">
					<ul class="patient_list">
						<li class="loading" id="loading">
							<img src="${pageContext.request.contextPath}/resources/img/ajax-loader.gif" alt="Loader" />
						</li>
					</ul>
					<div class="clearfix"></div>
				</div>
			</div>
					
		</div>
		<jsp:include page="includes/commonFooter.jsp"></jsp:include>
	</body>
</html>