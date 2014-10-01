<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
	<jsp:include page="includes/commonHeader.jsp"></jsp:include>
	<script>
		$("document").ready(function() {
			var username = window.location.href.split("=");
			var userId = username[1].split("+");
			
			$("h2.patientName").text(userId[0]);
			
			$.getJSON('/dost/api/user/'+userId[1]+'/messages/all', function(messages) {
				$(".loading").hide();
				for (var i in messages) {
					$(".conversations").append('<div class="categoryList"><h3 class="subject secondary_heading" id='+i+'_subject>'+messages[i][0].subject+'</h3>');
					$("#"+ i+"_subject").after("<ul></ul></div>");
						for (var j in messages[i]) {
							$("#"+ i+"_subject").siblings("ul").append('<li class=" media each_conversation">'+
												'<div class="pull-left col-md-2">'+
													'<div class="patient_name"><strong>'+messages[i][j].sender.username+'</strong></div>'+
													'<div class="post_details">'+messages[i][j].sentDate +'</div>'+
												'</div>'+
												'<div class="media-body col-md-8">'+
														'<span>'+messages[i][j].content+'</span>'+
												'</div>'+
											'</li>');
					}
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
					<h2 class="pageHeading patientName"></h2>
					<label>Relationship</label> | <label>Repeat</label>
					<div class="clearfix"></div>
				</div>
				<br/>
				 
				<ul class="conversations">
					<li class="loading" id="loading">
							<img src="${pageContext.request.contextPath}/resources/img/ajax-loader.gif" alt="Loader" />
					</li>
				</ul>
			</div>
			<!--end of patient summary-->
	</div>
	<jsp:include page="includes/commonFooter.jsp"></jsp:include>
</body>
</html>