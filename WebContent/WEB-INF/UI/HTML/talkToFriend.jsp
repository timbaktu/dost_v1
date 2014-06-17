<!DOCTYPE html>
<html lang="en">
	<jsp:include page="includes/commonHeader.jsp"></jsp:include>
	<body class="theme-default" >
		<jsp:include page="includes/header.jsp"></jsp:include>
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
						  <li><a class="leaveMessage">Send Email</a></li>
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
		<jsp:include page="includes/popupEmail.jsp"></jsp:include>
		<jsp:include page="includes/commonFooter.jsp"></jsp:include>
	</body>
</html>