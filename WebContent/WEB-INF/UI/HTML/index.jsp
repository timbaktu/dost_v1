<!DOCTYPE html>

<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<html lang="en">
	<jsp:include page="includes/commonHeader.jsp"></jsp:include>
	<script src="${pageContext.request.contextPath}/resources/JS/jquery.dotdotdot.js" type="text/javascript"></script>
	<script>
		$( document ).ready(function() {
			$(".horoscopes a").click(function(){
				var clickedZodiac =$(this).text();
				$(this).attr("href","horoscope?="+clickedZodiac);
			});
			
			/*FAQ listing on index page*/
			$.getJSON("/dost/api/faqcategory/all", function(FAQ) {	
				var numberOfCategories = FAQ.length;
				
				
				for (var i = 0 ; i < numberOfCategories; i++) {
					var numberOfQuestions = FAQ[i].faqs.length;
					$("#faqs ul").append('<li class="questionIndex"><a href="faqs?='+FAQ[i].faqs[numberOfQuestions-1].faqId+'"+>'+ FAQ[i].faqs[numberOfQuestions-1].question +'</a></li>');
				}
				 
			});
			/*end of FAQ listing on index page*/
			
			/*Discussion listing on index page*/
			$.getJSON("/dost/api/topics/count/5", function(discussionTopic) {	
				for (var i = 0 ; i < discussionTopic.length; i++) {
					$("#discussions ul").append('<li class="eachDiscussion">'+
							'<a style="display:block" href="http://localhost:8800/dost/posts/list/' + discussionTopic[i].topicId + '.page">'+
								'<div style="max-height:40px" class="wrapper" >'+ discussionTopic[i].topicTitle +
								'</div>'+
							'</a>'+
							'<span class="time_taken">Last updated:'+discussionTopic[i].forumPosts[0].postTime+'</span>'+	
						 '</li>');	
				}
			});
			
			/*end of discussion listing on index page*/
			
			/*Showing Ellipsis - dotdotdot plugin*/
			setTimeout(function(){
					$(".wrapper").dotdotdot({
						
					});
			},1000);
			/*End of showing ellipsis*/
			 
			
		});
	</script>
	<body class="container-fluid   theme-default">
		<jsp:include page="includes/header.jsp"></jsp:include>
		<div class="container row-fluid welcomePage">
			<div class="col-md-7">
				<ul>
					<li class="exploration_option well" id="discussions">
							<h3 class="categoryName">Discussions</h3>
							<ul class="discussions_list details_box">
								
							</ul>
					</li>
					
					<li class="exploration_option well" id="faqs">
						<h3 class="categoryName">Frequently Asked Questions</h3>
							<ul class="details_box">
							</ul>
					</li>
					
					<li class="exploration_option well horoscopes">
						<h3 class="categoryName">Horoscopes</h3>
						<ul>
							<li><a>Aquarius</a></li>
							<li><a>Pisces</a></li>
							<li><a>Aries</a></li>
							<li><a>Taurus</a></li>
							<li><a>Gemini</a></li>
							<li><a>Cancer</a></li>
							<li><a>Leo</a></li>
							<li><a>Virgo</a></li>
							<li><a>Libra</a></li>
							<li><a>Scorpio</a></li>
							<li><a>Saggitarius</a></li>
							<li><a>Capricon</a></li>
						</ul>
					</li>
					
					<li class="exploration_option well" id="personalityTest">
						<a href="#">
							<h3 class="categoryName">Personality Tests</h3>
							<ul class="details_box">
								<li>
									<h4 class="topic_categoryName">Find out about your personality!.. COMING SOON</h4>
								</li>
								
							</ul>
							
							
						</a>
					</li>
					
					<li class="exploration_option well" >
						<h3 class="categoryName">Quotes</h3>
						<ul class="details_box">
								<li>
									<h4 class="topic_categoryName">COMING SOON</h4>
								</li>
								
							</ul>
					</li>
					
					<li class="exploration_option well" >
						<h3 class="categoryName">Destressing Games</h3>
						<ul class="details_box">
								<li>
									<h4 class="topic_categoryName">COMING SOON</h4>
								</li>
								
						</ul>
					</li>
					
				</ul>
			</div>
			<sec:authorize ifNotGranted="ROLE_USER">
				
				<jsp:include page="includes/signUp.jsp"></jsp:include>
			</sec:authorize>
		</div>
		<jsp:include page="includes/commonFooter.jsp"></jsp:include>
	</body>
</html>