<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<jsp:include page="includes/commonHeader.jsp"></jsp:include>
<jsp:include page="includes/headerCounselor.jsp"></jsp:include>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link
	href="../resources/lib/css/ui-lightness/jquery-ui-1.10.4.custom.css"
	rel="stylesheet">
<script src="../resources/lib/jquery-1.10.2.js"></script>
<script src="../resources/lib/jquery-ui-1.10.4.custom.js"></script>
<script>
	$(function() {
		//alert($("#faq").serialize());
		
		$("#dialog").dialog({
			autoOpen : false,
			width : 400,
			buttons : [ {
				text : "Ok",
				click : function() {
					debugger;
					alert($("#categoryid").val());
					alert($("#faq").serialize());
					var datatosend = 'answer='+$("#answer").val()+'&question=' + $("#question").val();
					$.post('http://satyajeet-n:8080/dost/api/faq/add', $("#faq").serialize(), function(response) {
						//$('#visitFormResponse').text(response);
					});
					
					//e.preventDefault();
				}
			}, {
				text : "Cancel",
				click : function() {
					//alert($("#question").val());
					$(this).dialog("close");
				}
			} ]
		});

		// Link to open the dialog
		$("#addbutton").click(function(event) {
			$("#dialog").dialog("open");
			event.preventDefault();
		});

		// Hover states on the static widgets
		$("#dialog-link, #icons li").hover(function() {
			$(this).addClass("ui-state-hover");
		}, function() {
			$(this).removeClass("ui-state-hover");
		});
		
		$("#next").click(function(event) {
			debugger;
			alert('next click working' + $("#faqid").val());
		});
		
		$("#previous").click(function(event) {
			alert('previous click working');
		});
	});
</script>
</head>
<body>

	<div class="container row-fluid">
		<div class="col-md-7">
			<div class="pageTop">
				<h2 class="pull-left pageHeading">Frequently Asked Questions</h2>
				<button type="button" class="editFAQs btn btn-primary pull-right">EDIT
					FAQs</button>
				<button type="button" id="addbutton"
					class="addFAQs btn btn-primary pull-right">ADD FAQs</button>
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
	</div>

	<!-- ui-dialog -->
	<div id="dialog" title="Add FAQ">
		<form name="faq" id="faq" action="" method="post">
		Select Category : 
		<select id="categoryid" name="category">
		  <option id="1" name="career" value="career">Career</option>
		  <option id="2" name="family" value="family">Family</option>
		  <option id="3" name="other" value="other">Other</option>
		</select> </br>
		Question : <input id="question" name="question" type="text" value="Question"> </br> 
		Answer : <textarea id="answer" name="answer" rows="4" cols="50">At w3schools.com you will learn how to make a website. We offer free tutorials in all web development technologies.</textarea> </br> 
		
		</form>
	</div>

</body>
</html>