<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<header id="main-navbar" class="navbar navbar-default navbar-fixed-top">
  <div class="navbar-inner">
	<div>
	   <a class="navbar-brand" href="index" >
		  	<img src="../resources/img/logoSmall.jpg" height="47px"/>
	  </a>
	  <div class="nav-collapse nav-collapse navbar-collapse">
	  
		<!--<p class="navbar-text pull-right">
			<a href="#" class="navbar-link">Create your account</a>
		</p>-->
		<sec:authorize ifGranted="ROLE_ADMIN">
			<ul class="nav navbar-nav pull-right ">
				<li><a href="#" class="navbar-link">Prashant</a></li>
				<li><a href="#" class="navbar-link">Logout</a></li>
			</ul>
			<ul class="nav navbar-nav pull-left">
				  <li><a href="conversations">Conversations</a></li>
				  <li><a href="patientHistory">Patient History</a></li>
				  <li><a href="onlineCounseling">Online Counseling</a></li>
				  <li><a href="quotes">Quotes</a></li>
				  <li><a href="faqs">FAQs</a></li>
			</ul>
		</sec:authorize>
	  </div><!--/.nav-collapse -->
	</div>
  </div>
</header>