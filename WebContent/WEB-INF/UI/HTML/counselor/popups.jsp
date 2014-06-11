<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<jsp:include page="includes/commonHeader.jsp"></jsp:include>
<jsp:include page="includes/headerCounselor.jsp"></jsp:include>
<head>
<meta charset="utf-8">
<title>Popups</title>
<script>
	$(function() {
		
		$("#dialog").dialog({
			autoOpen : false,
			width : 600
		});

		/* Adding question*/
		$(".popupFire").click(function(event) {
			$("#dialog").dialog("open");
			
		});
		/* End of adding question*/		
	});
</script>
</head>
<body>
	<div class="container row-fluid">
		<div class="col-md-7">
			<div class="popupFire">Popup if not a signed up user</div>
		</div>
	</div>
	<!-- modal dialog -->
	<div id="dialog" class="modal-dialog" >
	
		<div class="messageModal">
	    		<p class="mainMessage">Hey there, <br/><br/>
	      		   You need to create your account to be able to engage in these discussions</p>	
	      		<p class="well bg-info">For signup, no need to tell me anything about yourself - no name, no email, no photo.. just think of me as your friend who would be there for you when you need him</p>
	      		<div class="centerButton">
	      			<a href="${pageContext.request.contextPath}/user/signup" class="btn btn-primary btn-lg">SIGNUP NOW</a>
	    		</div>
	    </div>
  		
	 
	</div><!-- /.modal -->
	

</body>
</html>