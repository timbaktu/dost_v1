<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- popup showing note -->
<div class="notePopup">
			<form>
				<textarea class="form-control" id="messageContent" rows="3"></textarea>
				<button type="button"  class="addNoteButton pull-right btn btn-primary">Submit</button>
				<button type="button"  class="cancelButton pull-right btn btn-outline">Cancel</button>
			</form>
</div>
<!-- end of popup showing note -->