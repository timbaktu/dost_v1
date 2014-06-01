$( document ).ready(function() {
		$( ".discussion_topic" ).click(function() {
			window.location = 'discussionsDetails.html';
		});

		$("body").addClass("theme-default");
		
		/*FAQ listing*/
		$.getJSON("/dost/api/faqcategory/all", function(FAQ) {	
			for (var i = 0 ; i < FAQ.length; i++) {
					$(".FAQList").append('<div class="well categoryList"><h3 class="categoryName" id='+FAQ[i].faqCategoryName+">"+FAQ[i].faqCategoryName+"</h3>");
					$("#"+FAQ[i].faqCategoryName).after("<ul></ul></div>");

					for (var j = 0 ; j < FAQ[i].faqs.length; j++) {
						$("#"+FAQ[i].faqCategoryName).siblings("ul").append('<li class="questionAnswer" id='+FAQ[i].faqCategoryName+j+'><div class="question">'+FAQ[i].faqs[j].question+'</div><div class="answer">'+ FAQ[i].faqs[j].answer +"</div></li>");
					}
					

			}
		/*End of FAQ listing*/

		/*clicking FAQs*/
		$(".question").click(function(){
				$(this).addClass("clickedQuestion");
				$(".categoryName").hide();
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
				$(".question").show();
				$(".answer").hide();

		});
		/*End of Moving through FAQs*/
		
		/*next previous navigation* TO BE DONE /
		$(".next").click(function(){
			$(".clickedQuestion").removeClass("clickedQuestion").closest("li").next("li").show().find(".question").addClass("clickedQuestion");		
			
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