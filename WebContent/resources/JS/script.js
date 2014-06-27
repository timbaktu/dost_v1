$( document ).ready(function() {
		
		/*$("body").addClass("theme-default"); */
		
		var url = $(location).attr("pathname").split("/");
		$('#main-navbar .menuItems a[href="'+url[url.length-1]+'"]').parent("li").addClass("active");
		
		if(window.location.href.indexOf("counselor") > -1){
			$("body").addClass("theme-default-counselor");
		}
		
		/*Manipulating json for FAQ*/
		$.getJSON("/dost/api/faqcategory/all", function(FAQ) {	
			for (var i = 0 ; i < FAQ.length; i++) {
				
				/*FAQ listing on faq page*/
				$(".FAQList").append('<div class="well categoryList"><h3 class="categoryName" id='+FAQ[i].faqCategoryName+">"+FAQ[i].faqCategoryName+"</h3>");
				$("#"+FAQ[i].faqCategoryName).after("<ul></ul></div>");

				for (var j = 0 ; j < FAQ[i].faqs.length; j++) {
					$("#"+FAQ[i].faqCategoryName).siblings("ul").append('<li class="questionAnswer" id='+FAQ[i].faqCategoryName+j+'><div class="question">'+FAQ[i].faqs[j].question+'</div><div class="answer">'+ FAQ[i].faqs[j].answer +"</div></li>");
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
				$(".nextPreviousNav").show();
				$(".allQuestions").show();
				$(".question").not(this).hide();
				var thisCategory = $(this).closest(".categoryList");
				$(".categoryList").not(thisCategory).hide();
				$(this).siblings(".answer").show();
		});
		/*end of click on FAQs*/

		/*Moving through FAQs*/
		$(".allQuestions").click(function(){
				$(".categoryName").show();
				$(".question").removeClass("clickedQuestion");
				$(".nextPreviousNav").hide();
				$(".allQuestions").hide();
				$(".categoryList").show();
				$(".questionAnswer").show();
				$(".question").show();
				$(".answer").hide();

		});
		/*End of Moving through FAQs*/
		
		/*Next Previous navigation*/
		$(".next").click(function(){
			$(".clickedQuestion").closest("li.questionAnswer").hide();
			var nextQuestion = $(".clickedQuestion").closest("li").next("li");		
			
			if(nextQuestion.length == 0){
				nextCategory= $(".clickedQuestion").closest(".categoryList").next(".categoryList");
				nextCategory.show();
				nextQuestion =	$(".clickedQuestion").closest(".categoryList").next(".categoryList").find("li:first-child");
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
				nextCategory= $(".clickedQuestion").closest(".categoryList").prev(".categoryList");
				nextCategory.show();
				nextQuestion =	$(".clickedQuestion").closest(".categoryList").prev(".categoryList").find("li:first-child");
				$(".clickedQuestion").removeClass("clickedQuestion").closest(".categoryList").hide();
			}
			
			$(".clickedQuestion").removeClass("clickedQuestion");
			prevQuestion.show();
			prevQuestion.find("div").show();
			prevQuestion.find(".question").addClass("clickedQuestion");
		});
		/*end of next previous navigation*/
		
		
		
	});

		
	/*for adding edit/delete options for a question*/
	if(window.location.pathname == "/dost/counselor/faqs"){
		alert("1212");
		$(".questionAnswer").hover(
				function(){
					$(this).prepend('<div class="editDeleteOptions pull-right">'+
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
	
});