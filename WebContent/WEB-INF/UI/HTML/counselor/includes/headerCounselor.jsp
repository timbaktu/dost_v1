<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<header id="main-navbar" class="navbar navbar-default navbar-fixed-top">
  <div class="navbar-inner">
	<div>
	   <a class="navbar-brand" href="index" >
		  	<img src="${pageContext.request.contextPath}/resources/img/logoSmall.jpg" height="47px"/>
	  </a>
	  <div class="nav-collapse nav-collapse navbar-collapse">
	  
		<!--<p class="navbar-text pull-right">
			<a href="#" class="navbar-link">Create your account</a>
		</p>-->
		<sec:authorize access="hasRole('ROLE_ADMIN')">
			<ul class="nav navbar-nav pull-right ">
				<li><a href="#" class="navbar-link">${pageContext.request.userPrincipal.name}</a></li>
				<li><a href="dost/j_spring_security_logout" class="navbar-link">Logout</a></li>
			</ul>
			<ul class="nav navbar-nav pull-left menuItems">
				  <li id="conversations"><a href="conversations">Conversations</a></li>
				  <li id="patientHistory"><a href="patientHistory">Patient History</a></li>
				  <li id="onlineCounseling"><a href="onlineCounseling">Online Counseling</a></li>
				  <li id="quotes"><a href="quotes">Quotes</a></li>
				  <li id="faqs"><a href="faqs">FAQs</a></li>
			</ul>
		</sec:authorize>
	  </div><!--/.nav-collapse -->
	</div>
  </div>
</header>