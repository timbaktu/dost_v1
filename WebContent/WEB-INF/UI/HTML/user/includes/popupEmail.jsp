<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div id="dialogMessage" class="modal-dialog" title="Leave a Message" >
	
		<div class="messageModal" >
	    		<sec:authorize access="hasRole('ROLE_USER')">
	    			<div class="mainMessage">
	    				<p>Hi ${pageContext.request.userPrincipal.name},</p>
						<p>I am here for you. Just tell me what’s on your mind and I will help you. 
					   		Believe me even I have been in those situations and I know how hard it can get times.
					   		I can assure you.
						</p>
					</div>
					<br/>	
				</sec:authorize>
				
				<sec:authorize access="hasRole('ROLE_ADMIN')">
					<label>To</label>
					<input type="text" class="form-control questionForm" placeholder="Send To"/>
					<br/>
					<label>Text</label>
				</sec:authorize>
				
	      		<form>
	      			<textarea rows="3" class="well form-control" placeholder="Type your query"></textarea>
	      		</form>
	    </div>
	</div><!-- /.modal -->