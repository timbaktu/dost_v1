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
		
		/*Manipulating json for FAQ*/
		$.getJSON("/dost/api/faqcategory/all", function(FAQ) {	
			
			$(".loading").hide();
			
			for (var i = 0 ; i < FAQ.length; i++) {
				
				/*FAQ listing on faq page*/
				$(".FAQList").append('<div class="well categoryList"><h3 class="categoryName subHeading" id='+FAQ[i].faqCategoryName+">"+FAQ[i].faqCategoryName+"</h3>");
				$("#"+FAQ[i].faqCategoryName).after("<ul></ul></div>");

				for (var j = 0 ; j < FAQ[i].faqs.length; j++) {
					$("#"+FAQ[i].faqCategoryName).siblings("ul").append('<li class="questionAnswer" id='+FAQ[i].faqs[j].faqId+'><div class="question">'+FAQ[i].faqs[j].question+'</div><div class="answer">'+ FAQ[i].faqs[j].answer +"</div></li>");
				}
				/* end of FAQ listing on faq page*/
				
				/*FAQ listing on index page*/
				var numberOfQuestions = FAQ[i].faqs.length;
				$("#faqs ul").append('<li>'+ FAQ[i].faqs[numberOfQuestions -1].question +'</li>');
				/*end of FAQ listing on index page*/
				
				
		}
		/*End of manipulating json for FAQ*/
		
		
		/*clicking FAQs*/
		$(".question").click(function(){
				$(this).addClass("clickedQuestion");
				$(this).closest(".questionAnswer").addClass("clicked");
				$(".nextPreviousNav").show();
				$(".allQuestions").show();
				$(".question").not(this).hide();
				var thisCategory = $(this).closest(".categoryList");
				$(".categoryList").not(thisCategory).hide();
				$(this).siblings(".answer").show();
				$(".searchBox").hide();		
				
		});
		/*end of click on FAQs*/

		/*Moving through FAQs*/
		$(".allQuestions").click(function(){
				$(".categoryName").show();
				$(".question").removeClass("clickedQuestion");
				$(".questionAnswer").removeClass("clicked");
				$(".nextPreviousNav").hide();
				$(".allQuestions").hide();
				$(".categoryList").show();
				$(".questionAnswer").show();
				$(".question").show();
				$(".answer").hide();
				$(".searchBox").show();
		});
		/*End of Moving through FAQs*/
		
		if(window.location.href.indexOf("?=") > -1){
			var element = window.location.href.split("=");
			setTimeout(function() {
					$("#"+element[1]).children(".question").trigger("click");
			},10);
		}
		
		/*Next Previous navigation*/
		$(".next").click(function(){
			$(".clickedQuestion").closest("li.questionAnswer").hide();
			var nextQuestion = $(".clickedQuestion").closest("li").next("li");		
			
			if(nextQuestion.length == 0){
				nextCategory= $(".clickedQuestion").closest(".categoryList").next(".categoryList");
				if(nextCategory.length==0){
					nextCategory = $(".categoryList:first-child");
				}
				nextCategory.show();
				nextQuestion =	nextCategory.find("li:first-child");
				$(".clickedQuestion").removeClass("clickedQuestion").closest(".categoryList").hide();
			}
			
			
			$(".clickedQuestion").removeClass("clickedQuestion");
			nextQuestion.show();
			nextQuestion.find("div").show();
			nextQuestion.find(".question").addClass("clickedQuestion");
		});
		
		
		$(".previous").click(function(){
			$(".clickedQuestion").closest("li.questionAnswer").hide();
			var prevQuestion = $(".clickedQuestion").closest("li").prev("li");		
			
			if(prevQuestion.length == 0){
				prevCategory= $(".clickedQuestion").closest(".categoryList").prev(".categoryList");
				if(prevCategory.length==0){
					prevCategory = $(".categoryList:last-child");
				}
				prevCategory.show();
				prevQuestion =	prevCategory.find("li:last-child");
				$(".clickedQuestion").removeClass("clickedQuestion").closest(".categoryList").hide();
			}
			
			$(".clickedQuestion").removeClass("clickedQuestion");
			prevQuestion.show();
			prevQuestion.find("div").show();
			prevQuestion.find(".question").addClass("clickedQuestion");
		});
		/*end of next previous navigation*/
		
		
	});
	
	/*for search*/
		$(".FAQList").sieve({ itemSelector: ".question" });
		$(".FAQList").prev("div").addClass("searchBox");
	/*end of for search*/
		
	/*for adding edit/delete options for a question*/
		if($(".theme-default").hasClass("theme-default-counselor")){
			$(".questionAnswer").hover(
					function(){
						
						$(this).append('<div class="editDeleteOptions pull-right">'+
											'<div class="editQuestion col-md-1">Edit </div>'+ 
											'<div class="deleteQuestion  col-md-1"> Delete</div>'+
										'</div>');
					},
					function(){
						$(this).find(".editDeleteOptions").remove();
					}
			);
		}
		/*End of for adding edit/delete options for a question*/
		
		/* for editing the Question/Answer */
		$(".questionAnswer").on("click",".editQuestion", function(){
			$("#dialog").dialog("option","title", "Edit this question/Answer");
			$("#dialog").dialog("open");
			
			var questionToBeEdited = $(this).closest(".editDeleteOptions").siblings(".question").text();
			var answerToBeEdited = $(this).closest(".editDeleteOptions").siblings(".answer").text();
			$(".questionForm").val(questionToBeEdited);
			$(".answerForm").val(answerToBeEdited);
		});
		
		/* end of for editing the Question/Answer */

		
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
				<div class="clearfix"></div>
			</div>
			<div>
				<div class="pull-left allQuestions">Back to List</div>
				<div class="pull-right nextPreviousNav">
					<span id="previous" class="previous">Previous</span> 
					<span id="next" class="next">Next</span>
				</div>
				<div class="clearfix"></div>
				<div class="FAQList">	
				</div>
				
				
			</div>
			<div class="loading" id="loading">
						<img src="${pageContext.request.contextPath}/resources/img/ajax-loader.gif" alt="Loader" />
			</div>
			<p>We are extremely thankful to <a target="_blank" href="https://www.linkedin.com/profile/view?id=21998428">Mahalakshmi Rajagopal</a>, <a target="_blank" href="http://in.linkedin.com/in/tarun911">Tarun Verma</a>, <a target="_blank" href="http://ca.linkedin.com/pub/namrta-mohan/42/519/802">Namrta Moha</a>, <a target="_blank" href="http://in.linkedin.com/pub/veena-bose/3b/921/471">Veena Bose </a>, <a target="_blank" href="https://www.linkedin.com/profile/view?id=117319614">Anamika Papriwal</a> for helping us with frequenly asked questions</p>
		</div>
		
		
		<sec:authorize access="!hasRole('ROLE_ADMIN')">
			<sec:authorize ifNotGranted="ROLE_USER">
				<jsp:include page="includes/signUp.jsp"></jsp:include>
			</sec:authorize>
			
			<sec:authorize access="hasRole('ROLE_USER')">
					<jsp:include page="includes/side_unit.jsp"></jsp:include>
			</sec:authorize>
		</sec:authorize>
	</div>
	<jsp:include page="includes/commonFooter.jsp"></jsp:include>
	<!-- modal dialog -->
		<div id="dialog" class="modal-dialog" title="Add a Question">
		  <div>
		    <div>
		      <form name="faq" id="faq" action="" method="post">
				
				Question : <input id="question" name="question" type="text" value="Question" class="form-control questionForm" placeholder="Type your question"> </br> 
				Answer : <textarea id="answer" name="answer" placeholder="Type the answer" class="form-control answerForm" rows="3" ></textarea> </br> 
				
				Select Category : <select id="categoryid" name="category">
									  <option id="1" name="career" value="career">Career</option>
									  <option id="2" name="Love-Relationships" value="relationship">Love/Relationship</option>
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