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
			
			$.getJSON('/dost/api/user/'+userId[1]+'/patienthistory/all', function(messages) {
				$(".loading").hide();
				debugger;
				for (var i in messages) {
					var entry = messages[i];
					for(var s in entry) {
						// If messages only
						if(s.indexOf("C") < 0) {
							for (var j in entry) {
								var inner = entry[j];
								$(".conversations").append('<div class="categoryList"><h3 class="subject secondary_heading" id='+i+'_subject>'+inner[0].subject+'</h3>');
								$("#"+ i+"_subject").after("<ul></ul></div>");						
								for(var k in inner) {
									$("#"+ i+"_subject").siblings("ul").append('<li class=" media each_conversation">'+
											'<div class="pull-left col-md-2">'+
												'<div class="patient_name"><strong>'+inner[k].sender.username+'</strong></div>'+
												'<div class="post_details">'+inner[k].sentDate +'</div>'+
											'</div>' +
											'<div class="media-body col-md-8">'+
													'<span>'+inner[k].content+'</span>'+
											'</div>'+
										'</li>');							
								}
							}
						}
						else {
							for (var j in entry) {
								var inner = entry[j];
								$(".conversations").append('<div class="categoryList"><h3 class="subject secondary_heading" id='+i+'_subject>'+'Chat' + j +'</h3>');
								$("#"+ i+"_subject").after("<ul></ul></div>");						
								for(var k in inner.userChats) {
									//debugger;
									$("#"+ i+"_subject").siblings("ul").append('<li class=" media each_conversation">'+
											'<div class="pull-left col-md-2">'+
												'<div class="patient_name"><strong>'+ inner.userChats[k].toJIDResource +'</strong></div>'+
												'<div class="post_details">'+inner.userChats[k].sentDate +'</div>'+
											'</div>' +
											'<div class="media-body col-md-8">'+
													'<span>'+inner.userChats[k].body+'</span>'+
											'</div>'+
										'</li>');							
								}
							}					
						}						
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
					<div class="clearfix"></div>
			</div>
						
			<div class="col-md-8 well">
				
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
			<jsp:include page="includes/notesRightUnit.jsp"></jsp:include>
			<!--end of patient summary-->
	</div>
	<jsp:include page="includes/commonFooter.jsp"></jsp:include>
</body>
</html>