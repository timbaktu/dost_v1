<!DOCTYPE html>
<html lang="en">
	<jsp:include page="includes/commonHeader.jsp"></jsp:include>
	<jsp:include page="includes/headerCounselor.jsp"></jsp:include>
	
	<div class="container row-fluid">
			<div class="col-md-7">
				<div class="pageTop">
					<h2 class="pull-left pageHeading">Frequently Asked Questions</h2>
					<button type="button" class="editFAQs btn btn-primary pull-right">EDIT FAQs</button>
					<button type="button" class="addFAQs btn btn-primary pull-right">ADD FAQs</button>
					<div class="clearfix"></div>
				</div>
				<div>
					<div class="pull-left allQuestions">Back to List</div>
					<div class="pull-right nextPreviousNav">
						<span class="previous">Previous</span>
						<span class="next">Next</span>
					</div>
					<div class="clearfix"></div>
					<div class="FAQList"></div>	
				</div>
			</div>
		</div>
		<jsp:include page="includes/commonFooter.jsp"></jsp:include>
	</body>
</html>