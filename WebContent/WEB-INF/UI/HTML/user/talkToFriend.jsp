<!DOCTYPE html>
<html lang="en">
	<jsp:include page="includes/commonHeader.jsp"></jsp:include>
	<body >
		<header class="navbar navbar-inverse navbar-fixed-top">
		  <div class="navbar-inner">
			<div>
			  <a class="navbar-brand" href="http://satyajeet-n:8080/dost/index">Dost</a>
			  <div class="nav-collapse ">
				<!--<p class="navbar-text pull-right">
					<a href="#" class="navbar-link">Create your account</a>
				</p>-->
				<ul class="nav navbar-nav pull-right ">
					<li><a href="#" class="navbar-link">Richa Singh</a></li>
					<li><a href="#" class="navbar-link">Logout</a></li>
				</ul>
				<ul class="nav navbar-nav pull-left">
					  <li><a href="conversations">Conversations</a></li>
					  <li class="active"><a href="#">Talk To a Friend</a></li>
					  <li><a href="faqs">FAQs</a></li>
					  <li><a href="resources">Resources</a></li>
				</ul>
			  </div><!--/.nav-collapse -->
			</div>
		  </div>
		</header>
		<div class="container">
			<div class="col-md-11">
				<div class="pageTop">
					<h2 class="pageHeading">Talk To A Friend</h2>
					<div class="col-md-7 message_counselor">
						<p>Hi Prashant,</p>
						<p>I am here for you. Just tell me what’s on your mind and we can talk it through. 
						   Believe me even I have been in those situations and I know how hard it can get times.
						   I can assure you.
						</p>
					</div>
					<div class="clearfix"></div>
				</div>
				<!-- chat window-->
				<div>
					<nav class="chat_nav navbar navbar-default col-md-6" role="navigation"" role="navigation">
					<div class="chat_container ">
						<ul class="nav navbar-nav chat_options">
						  <li class="active text_chat"><a href="#">Chat</a></li>
						  <li><a href="#">Virtual Room</a></li>
						  <li><a href="#">Call</a></li>
						  <li><a href="#">Send Email</a></li>
						</ul>
						<div class="clearfix"></div>
						<div class="chat_display_area">
							<p>Can I really share with you?</p>
							
						</div>
						<div class="clearfix"></div>
						 <div class="">
							<div class="input-group">
							  <input type="text" class="form-control" placeholder="Tell me what are you thinking">
							  <span class="input-group-btn">
								<button class="btn btn-default" type="button">SEND</button>
							  </span>
							</div><!-- /input-group -->
						 </div>
						 <div class="clearfix"></div>
					</div>
					</nav>

				</div>
				<!-- end of each conversation-->
			</div>
		<jsp:include page="includes/commonFooter.jsp"></jsp:include>
	</body>
</html>