<!DOCTYPE html>
<html lang="en">
	<head>
		<script src="../JS/jquery.js"></script> 
		<script src="../JS/bootstrap.min.js"></script>
		<script src="../JS/script.js"></script>
		<link href="../CSS/bootstrap.min.css" rel="stylesheet" media="screen">
		<link href="../CSS/style.css" rel="stylesheet" media="screen">
	</head>
	<body >
		<!--<OBJECT data="header.html">
		</OBJECT>-->
		<header class="navbar navbar-inverse navbar-fixed-top">
		  <div class="navbar-inner">
			<div>
			  <a class="navbar-brand" href="/index">Dost</a>
			  <div class="nav-collapse ">
				<!--<p class="navbar-text pull-right">
					<a href="#" class="navbar-link">Create your account</a>
				</p>-->
				<ul class="nav navbar-nav pull-right ">
					<li><a href="#" class="navbar-link">Prashant</a></li>
					<li><a href="#" class="navbar-link">Logout</a></li>
				</ul>
				<ul class="nav navbar-nav pull-left">
					  <li class="active"><a href="#">Conversations</a></li>
					  <li><a href="talkToFriend_counselor.jsp">Patient History</a></li>
					  <li><a href="onlineCounseling_counselor.jsp">Online Counseling</a></li>
					  <li><a href="quotesCounselor_counselor.jsp">Quotes</a></li>
					  <li><a href="faqCounselor_counselor.jsp">FAQs</a></li>
				</ul>
			  </div><!--/.nav-collapse -->
			</div>
		  </div>
		</header>
		<div class="container">
			<div class="col-md-11">
				<div class="pageTop">
					<h2 class="pull-left pageHeading col-md-offset-2">
							<a  href="discussionsAll.jsp">&larr; Back to all Conversations</a>
					</h2>
					<div class="clearfix"></div>
				</div>
				
				<ul class="pull-left col-md-2 left_nav">
					<li><a href="#">Compose</a><br/><br/></li>
					<li class="active"><a href="#">Inbox</a></li>
					<li><a href="#">Sent Items</a></li>
					<li><a href="#">Drafts</a><br/><br/></li>
					<li><a href="#">Label 1</a></li>
					<li><a href="#">Label 2</a></li>
				</ul>
				<div class="pull-right col-md-10">
					<div class="pull-left col-md-9">
						<h4 class="pull-left">Not able to face the world</h4>
						<div class="pull-right">
							<div class="btn-group">
							  <button type="button" class="btn btn-default">Reply</button>
							  <button type="button" class="btn btn-default">Add Note</button>

							  <div class="btn-group">
								<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
								  Label
								  <span class="caret"></span>
								</button>
								<ul class="dropdown-menu">
								  <li><a href="#">career</a></li>
								  <li><a href="#">love relationship</a></li>
								  <li><a href="#">office stress</a></li>
								</ul>
							  </div>
							</div>
						</div>
						<div class="clearfix"></div>
						<ul class="conversation_history">
							<li>
								<h4 class="media-heading">Brusley <span> 31st July - 6pm</span></h4>
								Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.
							
							</li>
							<li>
								<h4 class="media-heading">Prashant <span> 31st July - 6:05pm</span></h4>
								Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.
							
							</li>
						</ul>
						<a href="#" class="pull-right conversationDetails"> View more conversations
							<span class="glyphicon glyphicon-chevron-right"></span>
						</a>
						<div class="clearfix"></div>
						<div class="reply_to_conversation">
							<textarea class="form-control" rows="3"></textarea>
							<button type="button" class="pull-right btn btn-primary">Submit</button>
						
						</div>
					</div>
					<div class="pull-right">
						to be done
					
					</div>
					<div class="clearfix"></div>
					
				</div>
			</div>
					
		</div>
		<footer></footer>
	</body>
</html>