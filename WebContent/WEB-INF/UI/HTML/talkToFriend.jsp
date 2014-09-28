<!DOCTYPE html>
<html lang="en">
	<jsp:include page="includes/commonHeader.jsp"></jsp:include>
	<body class="theme-default" >
		<jsp:include page="includes/header.jsp"></jsp:include>
		<script>
			$(document).ready(function(){
				launchWin('framemain','http://54.209.217.90:8800/webchat/start.jsp?workgroup=demo@workgroup.win-kefqjr14ps3&location=http://localhost:8800/dost/talkToFriend&noUI=true&username=alex',500, 400);return false;
			});
		</script>
		
		<!-- 
		<div class="container row-fluid">
			<div class="col-md-7 message quotesBg">
				<div class="pageTop messageForQuotes">
					<h2 class="subHeading ">Hey, we are working to get this page up and running. </h2>
					<p class="subHeading">In the mean-time, why don't you check out <a href="${pageContext.request.contextPath}/faqs">Frequently Asked Questions</a>. It is a comprehensive list put together by experts.</p>
    			</div>
    			<ul class="stickyNote">
				    <li>
				      <a href="#">
				        <h2>Work in Progress</h2>
				      </a>
				    </li>
				  </ul>
    			
			</div>
		</div>
		-->
		
		 <div class="container  row-fluid">
				<script language="JavaScript" type="text/javascript" src="http://54.209.217.90:8800/webchat/jivelive.jsp"></script>
				<script>showButtonWithoutUI('demo@workgroup.win-kefqjr14ps3', 'username=${pageContext.request.userPrincipal.name}');</script>
				<div class="col-md-11">
				<div class="pageTop">
					<h2 class="pageHeading">Talk To A Friend</h2>
					<div class="col-md-7 message_counselor">
						<p>Hi ${pageContext.request.userPrincipal.name},</p>
						<p>I am here for you. Just tell me what’s on your mind and we can talk it through. 
						   Believe me even I have been in those situations and I know how hard it can get times.
						   I can assure you.
						</p>
						
					</div>
					<div class="clearfix"></div>
				</div>
				
				<div>
					<!-- <nav class="chat_nav navbar navbar-default col-md-6" role="navigation"" role="navigation">
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
							</div>
						 </div>
						 <div class="clearfix"></div>
					</div>
					</nav>
					-->
					<iframe width="500" height="500" src="http://54.209.217.90:8800/webchat/chatmain.jsp?workgroup=demo@workgroup.win-kefqjr14ps3&chatID=nY1KNE1c7C"> </iframe>
				</div>

				
			</div>
		<div class="clearfix"></div>	 
		<jsp:include page="includes/commonFooter.jsp"></jsp:include>
	</body>
</html>