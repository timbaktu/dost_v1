<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
	<jsp:include page="includes/commonHeader.jsp"></jsp:include>
	<script>
		$("document").ready(function() {
			var userId = window.location.href.split("=");
			$.getJSON('/dost/api/user/'+userId[1]+'/messages/all', function(messages) {
				for(i=0; i < 20; i++){
					var number=i+1;
					alert(messages[1][0].length);
					/*$(".conversations").append('<div class="well categoryList"><h3 class="subject" id='+messages[i].number[0].subject+'>'+messages[i].number[0].subject+'</h3>');
					$("#"+messages[i].number[0].subject).after("<ul></ul></div>");*/
					/*for (var j = 0 ; j < messages[i].[i+1].length; j++) {
							$("#"+ messages[i].[i+1].subject).siblings("ul").append('<li class="well media each_conversation">'+
												'<div class="pull-left col-md-2">'+
													'<div class="patient_name">'+messages[i].[i+1][j].sender.username+'</div>'+
													'<div class="patient_name"><img class="avatar" id='+messages[i].[i+1][j].sender.avatar+' src="avatar/'+messages[i].[i+1][j].avatar+'.png" name='+messages[i].[i+1][j].sender.avatar+'/></div>'+
												'</div>'+
												'<div class="media-body col-md-8">'+
														'<h4>'+messages[i].[i+1][j].subject+'</h4>'+
														'<span>'+messages[i].[i+1][j].content+'</span>'+
												'</div>'+
											'</li>');
					}*/
				}
			});	
		});
	</script>
	<body class="theme-default theme-default-counselor" >
		<jsp:include page="includes/header.jsp"></jsp:include>
		<!--patient summary-->
		<div class="container">
			<div class="pageTop">
					<h2 class="pull-left pageHeading">
						<a  href="patientList">&larr; Back to all Patients</a>
					</h2>
			</div>
						
			<div class="col-md-11 well">
				
				<div class="summary_patient">
					<h2 class="pageHeading">${pageContext.request.userPrincipal.name}</h2>
					<label>Label 1</label> | <label>Label 2</label>
					<div class="clearfix"></div>
				</div>
				<br/>
				<!-- <ul class="counselor_notes">
					<li>
						Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante .
						<h4 class="media-sub-heading counselor_name">Prashant <small> 31st July - 6pm</small></h4>
					</li>
					<li>
						Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sol congue felis in faucibus.
						<h4 class="media-sub-heading counselor_name">Shahrukh <small> 31st July - 6pm</small></h4>
					</li>
				</ul>
				<a href="#" class="pull-right">View All</a>
				<div class="clearfix"></div>
				<h4>Conversations</h4>-->
				 
				<ul class="conversations">
					
				</ul>
			</div>
			<!--end of patient summary-->
	</div>
	<jsp:include page="includes/commonFooter.jsp"></jsp:include>
</body>
</html>