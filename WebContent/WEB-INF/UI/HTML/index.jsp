<!DOCTYPE html>

<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<html lang="en">
	<jsp:include page="user/includes/commonHeader.jsp"></jsp:include>
	<body class="container-fluid   theme-default">
		<jsp:include page="user/includes/headerUser.jsp"></jsp:include>
		<div class="container row-fluid welcomePage">
			<div class="col-md-7">
				<ul>
					<li class="exploration_option well" id="discussions">
						<a href="${pageContext.request.contextPath}/user/discussionsAll">
							<h3 class="categoryName">Dicussions</h3>
							<ul class="details_box">
								<li>
									<h4 class="topic_categoryName">Lorem ipsum dolor sit amet, consectetur adipiscing elit</h4>
									<div>
										<span>Last updated:</span><span>25<sup>th</sup> May 2013</span>
									</div>
								</li>
								
								<li>
									<h4 class="topic_categoryName">Lorem ipsum dolor sit amet, consectetur adipiscing elit</h4>
									<div>
										<span>Last updated:</span><span>25<sup>th</sup> May 2013</span>
									</div>
								</li>
								
							</ul>
							
							
						</a>
					</li>
					
					<li class="exploration_option well" id="faqs">
						<a href="${pageContext.request.contextPath}/user/faqs">
							<h3 class="categoryName">Frequently Asked Questions</h3>
							<ul class="details_box">
								
							</ul>
						</a>
					</li>
					
					<li class="exploration_option well" id="personalityTest">
						<a href="${pageContext.request.contextPath}/user/personalityTests">
							<h3 class="categoryName">Personality Tests</h3>
							<ul class="details_box">
								<li>
									<h4 class="topic_categoryName">Find out about your personality!</h4>
								</li>
								
							</ul>
							
							
						</a>
					</li>
					
					<li class="exploration_option well" >
						<h3>Quotes</h3>
						<div></div>
					</li>
					
					<li class="exploration_option well">
						<h3>Horoscopes</h3>
						<div></div>
					</li>
					
					<li class="exploration_option well" >
						<h3>Destressing Games</h3>
						<div></div>
					</li>
					
				</ul>
			</div>
			<jsp:include page="user/includes/signUp.jsp"></jsp:include>
		</div>
		<jsp:include page="user/includes/commonFooter.jsp"></jsp:include>
	</body>
</html>