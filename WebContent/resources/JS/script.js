$( document ).ready(function() {
		$( ".discussion_topic" ).click(function() {
			window.location = 'discussionsDetails.html';
		});
		
		<!-- for FAQ listing -->
		$.getJSON("/dost/api/faqcategory/all", function(FAQ) {	
			for (var i = 0 ; i < FAQ.length; i++) {
					$(".FAQList").append('<h3 class="categoryName" id='+FAQ[i].faqCategoryName+">"+FAQ[i].faqCategoryName+"</h3>");
					$("#"+FAQ[i].faqCategoryName).after("<ul></ul>");
					
					for (var j = 0 ; j < FAQ[i].faqs.length; j++) {
						/*$("#"+FAQ[i].faqCategoryName).find("ul").append('<a class="individualQuestion" href='+FAQ[i].faqCategoryName+j+"><li>"+FAQ[i].faqs[j].question+"</li></a>");*/   
						$("#"+FAQ[i].faqCategoryName).siblings("ul").append('<li class="questionAnswer" id='+FAQ[i].faqCategoryName+j+'><div class="question">'+FAQ[i].faqs[j].question+'</div><div class="answer">'+ FAQ[i].faqs[j].answer +"</div></li>");
					}
					
			}
		<!-- End for FAQ listing -->
		
		$(".question").click(function(){
				$(this).addClass("clickedQuestion");
				$(".categoryName").hide();
				$(".nextPreviousNav").css("visibility" , "visible");
				$(".allQuestions").css("visibility" , "visible");
				$(".question").not(this).hide();
				$(this).siblings(".answer").show();
			});
			
			$(".allQuestions").click(function(){
				$(".categoryName").show().removeClass("clickedQuestion");;
				$(".nextPreviousNav").css("visibility","hidden");
				$(".allQuestions").css("visibility","hidden");
				$(".question").show();
				$(".answer").hide();
			});
		});
		
		
		
});

