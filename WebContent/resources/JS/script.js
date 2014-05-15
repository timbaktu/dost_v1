$( document ).ready(function() {
		$( ".discussion_topic" ).click(function() {
			window.location = 'discussionsDetails.html';
		});
		
		/*FAQ listing*/
		$.getJSON("/dost/api/faqcategory/all", function(FAQ) {	
			for (var i = 0 ; i < FAQ.length; i++) {
					$(".FAQList").append('<h3 class="categoryName" id='+FAQ[i].faqCategoryName+">"+FAQ[i].faqCategoryName+"</h3>");
					$("#"+FAQ[i].faqCategoryName).after("<ul></ul>");
					
					for (var j = 0 ; j < FAQ[i].faqs.length; j++) {
						$("#"+FAQ[i].faqCategoryName).siblings("ul").append('<li class="questionAnswer" id='+FAQ[i].faqCategoryName+j+'><div class="question">'+FAQ[i].faqs[j].question+'</div><div class="answer">'+ FAQ[i].faqs[j].answer +"</div></li>");
					}
					
			}
		/*End of FAQ listing*/
		
		/*clicking FAQs*/
		$(".question").click(function(){
				$(this).addClass("clickedQuestion");
				$(".categoryName").hide();
				$(".nextPreviousNav").css("visibility" , "visible");
				$(".allQuestions").css("visibility" , "visible");
				$(".question").not(this).hide();
				$(this).siblings(".answer").show();
		});
		/*end of click on FAQs*/
		
		/*Moving through FAQs*/
		$(".allQuestions").click(function(){
				$(".categoryName").show().removeClass("clickedQuestion");;
				$(".nextPreviousNav").css("visibility","hidden");
				$(".allQuestions").css("visibility","hidden");
				$(".question").show();
				$(".answer").hide();
			
		});
		/*End of Moving through FAQs*/
		
	});
		
	/*Add FAQ */
	$(".addFAQs").click(function(){
		$(this).hide();
		$(".FAQList").prepend("" +
				'<div contenteditable="true" class="individualQuestion fillQuestion"></div>' +
				'<div class="fillAnswer" contenteditable="true" class="individualQuestion" ></div>'+
				'<div class="btn-group">'+
					'<label>Select Category</label>'+
					'<select><option>Career</option><option>Family</option></select>'+
					'<button type="button" class="saveFAQ btn btn-primary pull-right">SAVE</button>'+
				'</div>'+
				'<div class="clearfix"></div>'+
				"");
	});
			
	$(".saveFAQ").on( "click", function() {
		alert("click");
		$(this).hide();
		$(".addFAQs").show();
		$(".FAQList question").attr("contenteditable","false");
		$(".FAQList answer").hide();
	});
	/*End of Add FAQ*/
	
	/*Edit FAQ */
	$("editFAQ").click(function(){
		$(this).hide();
		$(".FAQList question").show().attr("contenteditable","true");
		$(".FAQList answer").show().attr("contenteditable","true");
		$(".FAQList").after('<button type="button" class="saveFAQ btn btn-primary pull-right">SAVE</button>');
	});
	/* Edit FAQ */
		
		
		
});

