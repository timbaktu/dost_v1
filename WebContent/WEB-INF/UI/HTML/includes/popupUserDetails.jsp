<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div id="dialogMessage" class="modal-dialog" title="Add User Details" >
	
		<div class="messageModal" >
				
				<sec:authorize access="hasRole('ROLE_ADMIN')">
				<form id="message">
					<div class="error alert alert-danger" role="alert"></div>
					<label>First Name</label>
					<input id="fname" required type="text" id="autocomplete" class="form-control questionForm autocomplete" placeholder="First Name"/>
					<br/>
					
					<label>Last Name</label>
					<input id="lname" required type="text" id="autocomplete" class="form-control questionForm autocomplete" placeholder="Last Name"/>
					<br/>
					
					<label>Hostel <span class="secondary_information">(eg Dihing, Kameng, Subansiri)</span></label>
					<input id="hostel" required type="text" id="autocomplete" class="form-control questionForm autocomplete" placeholder="Hostel"/>
					<br/>
					
					<label>Year of Study <span class="secondary_information">(eg BTech I Year, II Year, MTech II Year etc)</span></label>
					<input id="year" required type="text" id="autocomplete" class="form-control questionForm autocomplete" placeholder="Year"/>
					<br/>
					
					<label>Branch <span class="secondary_information">(eg Design, ECE, EEE etc)</span></label>
					<input id="branch" required type="text" id="autocomplete" class="form-control questionForm autocomplete" placeholder="Branch"/>
					<br/>
	      		</form>
				</sec:authorize>
				
	    </div>
	</div><!-- /.modal -->