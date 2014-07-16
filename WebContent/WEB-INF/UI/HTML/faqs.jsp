<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<jsp:include page="includes/commonHeader.jsp"></jsp:include>
<jsp:include page="includes/header.jsp"></jsp:include>
<head>
<meta charset="utf-8">
<title>Frequently Asked Questions - DOST</title>
<script>
	$(function() {
		//alert($("#faq").serialize());
		
		$("#dialog").dialog({
			modal: true,
			autoOpen : false,
			width : 600,
			buttons : [ {
				text : "CANCEL",
				click : function() {
					$(this).dialog("close");
				}
			}, {
				text : "ADD",
				click : function() {
					debugger;
					var datatosend = 'answer='+$("#answer").val()+'&question=' + $("#question").val()/*+'&category=' + $("#categoryid: selected").val()*/;
					$.post('http://localhost:8800/dost/api/faq/add', $("#faq").serialize(), function(response) {
						//$('#visitFormResponse').text(response);
					});
					window.setTimeout('location.reload()', 1000);
				}
			} ]
		});

		/* Adding question*/
		$("#addbutton").click(function(event) {
			$("#dialog").dialog("option","title", "Add New Question");
			$("#dialog").dialog("open");
			$('.ui-widget-overlay').css('background', 'white');
			
			$(".questionForm").val("");
			$(".answerForm").val("");
		});
		
		$(".FAQList").sieve({ itemSelector: ".question" });
	});
</script>
</head>
<sec:authorize access="hasRole('ROLE_ADMIN')">
<body class="theme-default theme-default-counselor" >
</sec:authorize>
<sec:authorize access="!hasRole('ROLE_ADMIN')">
<body class="theme-default">
</sec:authorize>

	<div class="container row-fluid">
		<div class="col-md-7">
			<div class="pageTop">
				<h2 class="pull-left pageHeading">Frequently Asked Questions</h2>
				<sec:authorize access="hasRole('ROLE_ADMIN')">
					<button type="button" id="addbutton" class="addFAQs btn btn-primary pull-right">ADD FAQs</button>
				</sec:authorize>
				<sec:authorize access="hasRole('ROLE_USER')">
					<button type="button" id="addbutton" class="addFAQs btn btn-primary pull-right">ADD FAQs</button>
				</sec:authorize>
				<div class="clearfix"></div>
			</div>
			<div>
				<div class="pull-left allQuestions">Back to List</div>
				<div class="pull-right nextPreviousNav">
					<span id="previous" class="previous">Previous</span> 
					<span id="next" class="next">Next</span>
				</div>
				<div class="clearfix"></div>
				<div class="FAQList"></div>
			</div>
		</div>
		<sec:authorize ifNotGranted="ROLE_USER">
				<jsp:include page="includes/signUp.jsp"></jsp:include>
		</sec:authorize>
	</div>

	<!-- modal dialog -->
		<div id="dialog" class="modal-dialog" title="Add a Question">
		  <div>
		    <div>
		      <form name="faq" id="faq" action="" method="post">
				
				Question : <input id="question" name="question" type="text" value="Question" class="form-control questionForm" placeholder="Type your question"> </br> 
				Answer : <textarea id="answer" name="answer" placeholder="Type the answer" class="form-control answerForm" rows="3" ></textarea> </br> 
				
				Select Category : <select id="categoryid" name="category">
									  <option id="1" name="career" value="career">Career</option>
									  <option id="2" name="Love/Relationships" value="relationship">Love/Relationship</option>
									  <option id="2" name="family" value="family">Family</option>
									  <option id="3" name="friends" value="friends">Friends</option>
									  <option id="3" name="other" value="other">Other</option>
									</select> </br>
				
			
			</form>
		    </div><!-- /.modal-content -->
		  </div><!-- /.modal-dialog -->
		</div><!-- /.modal -->
	
</body>
</html>