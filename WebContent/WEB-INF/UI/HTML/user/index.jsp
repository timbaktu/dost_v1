<!DOCTYPE html>
<html lang="en">
	<jsp:include page="includes/commonHeader.jsp"></jsp:include>
	<body class="container-fluid">
		<jsp:include page="includes/headerUser.jsp"></jsp:include>
		<div class="container row-fluid welcomePage">
			<div class="col-md-7">
				<ul>
					<li class="exploration_option " id="discussions">
						<a href="discussionsAll">
							<h3 class="heading">Dicussions</h3>
							<ul class="details_box">
								<li>
									<h4 class="topic_heading">Lorem ipsum dolor sit amet, consectetur adipiscing elit</h4>
									<div>
										<span>Last updated:</span><span>25<sup>th</sup> May 2013</span>
									</div>
								</li>
								
								<li>
									<h4 class="topic_heading">Lorem ipsum dolor sit amet, consectetur adipiscing elit</h4>
									<div>
										<span>Last updated:</span><span>25<sup>th</sup> May 2013</span>
									</div>
								</li>
								
							</ul>
							
							
						</a>
					</li>
					
					<li class="exploration_option " id="faqs">
						<a href="faqs">
							<h3 class="heading">Frequently Asked Questions</h3>
							<ul class="details_box">
								<li>
									<h4 class="topic_heading">Lorem ipsum dolor sit amet, consectetur adipiscing elit</h4>
								</li>
								
								<li>
									<h4 class="topic_heading">Lorem ipsum dolor sit amet, consectetur adipiscing elit</h4>
								</li>
								
							</ul>
						</a>
					</li>
					
					<li class="exploration_option " id="personalityTest">
						<a href="/discussions">
							<h3 class="heading">Personality Tests</h3>
							<ul class="details_box">
								<li>
									<h4 class="topic_heading">Find out about your personality!</h4>
								</li>
								
							</ul>
							
							
						</a>
					</li>
					
					<li>
						<h3>Quotes</h3>
						<div></div>
					</li>
					<li>
						<h3>Horoscopes</h3>
						<div></div>
					</li>
					<li>
						<h3>Destressing Games</h3>
						<div></div>
					</li>
				</ul>
			</div>
			<div class="col-md-3" >
				<div class="login_unit">
					<p>Something bothering you, Feeling Lonely, Not interested in anything...</p>
					<p>I can talk to you, no need to tell me anything about yourself - no name, no email, no photo.. just think of me as your friend who would be there for you when you need him</p>
					<div class="signupLoginOption">
						<p><a href="login" class="btn btn-primary btn-large login_btn">LOGIN TO YOUR ACCOUNT</a></p>
						<a href="signupNow" class="create_account">Create your account</a></p> 
					</div>
				</div>
			</div>
		</div>
		<jsp:include page="includes/commonFooter.jsp"></jsp:include>
	</body>
</html>