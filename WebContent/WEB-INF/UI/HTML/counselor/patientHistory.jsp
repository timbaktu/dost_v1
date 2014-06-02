<!DOCTYPE html>
<html lang="en">
	<jsp:include page="includes/commonHeader.jsp"></jsp:include>
	<body >
		<jsp:include page="includes/headerCounselor.jsp"></jsp:include>
		<div class="container">
			<div class="col-md-11 well">
				<div class="pageTop">
					<h2 class="pull-left pageHeading col-md-offset-2">
							<a  href="conversations.html">&larr; Back to all Conversations</a>
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
							<button type="button" class="pull-right btn btn-success">Submit</button>
						
						</div>
					</div>
					<div class="clearfix"></div>
					
				</div>
			</div>
					
		</div>
		<jsp:include page="includes/commonFooter.jsp"></jsp:include>
	</body>
</html>