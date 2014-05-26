<!DOCTYPE html>
<html lang="en">
	<jsp:include page="includes/commonHeader.jsp"></jsp:include>
	<body class="container-fluid">
		<jsp:include page="includes/headerUser.jsp"></jsp:include>
		<div class="container row-fluid">
			<div class="col-md-7">
				<div class="pageTop">
					<h2 class="pull-left pageHeading">Frequently Asked Questions</h2>
					<div class="clearfix"></div>
				</div>
				<div>
					<div class="pull-left allQuestions">&laquo; Back to List</div>
					<div class="pull-right nextPreviousNav">
						<span class="previous">&larr; 	Previous </span>
						<span>|</span>
						</span><span class="next"> Next &rarr;</span>
					</div>
					<div class="clearfix"></div>
					<div class="FAQList"></div>	
				</div>
			</div>
			<jsp:include page="includes/signUp.jsp"></jsp:include>
		</div>
		<jsp:include page="includes/commonFooter.jsp"></jsp:include>
	</body>
</html>