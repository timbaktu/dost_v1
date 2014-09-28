<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
	<jsp:include page="includes/commonHeader.jsp"></jsp:include>
	<script>
		$("document").ready(function() {
			$.getJSON("/dost/api/users", function(user) {
				$(".loading").hide();
				for(i=0; i<user.length; i++){
					$(".patient_list").append('<li class="well media ceac_patient">'+
												'<a class="pull-left col-md-2" href="patientDetails?='+user[i].userId+'">'+
													'<div class="patient_name">'+user[i].username+'</div>'+
													'<div class="patient_name"><img class="avatar" id='+user[i].avatar+' src="avatar/'+user[i].avatar+'.png" name='+user[i].avatar+'/></div>'+
												'</a>'+
												'<div class="media-body col-md-8">Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.</div>'+
												'<div class="pull-right col-md-1">'+
													'<a href="patientDetails?='+user[i].userId+'"> View'+
														'<span class="glyphicon glyphicon-chevron-right"></span>'+
													'</a>'+
												'</div>'+
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