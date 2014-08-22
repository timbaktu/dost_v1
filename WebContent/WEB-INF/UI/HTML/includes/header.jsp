<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<sec:authorize access="hasRole('ROLE_ADMIN')">
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
			
				<ul class="nav navbar-nav pull-right ">
					<li><a href="#" class="navbar-link">${pageContext.request.userPrincipal.name}</a></li>
					<li><a href="dost/j_spring_security_logout" class="navbar-link">Logout</a></li>
				</ul>
				<ul class="nav navbar-nav pull-left menuItems">
					  <li id="conversations"><a href="conversations">Conversations</a></li>
					  <li id="patientHistory"><a href="patientList">Patient History</a></li>
					  <li id="onlineCounseling"><a href="onlineCounseling">Online Counseling</a></li>
					  <li id="onlineCounseling"><a href="forums/show/1.page">Discussions</a></li>
					  <li id="faqs"><a href="faqs">FAQs</a></li>
					  <li id="quotes"><a href="quotes">Quotes</a></li>
					  <!-- <li id="blog"><a href="http://blog.yourdost.com"  target="_blank">Blog</a></li> -->
					  <li id="blog"><a href="blog" >Blog</a></li>
				</ul>
			
		  </div><!--/.nav-collapse -->
		</div>
	  </div>
	</header>
</sec:authorize>
<sec:authorize access="!hasRole('ROLE_ADMIN')">
	<header id="main-navbar" class="navbar navbar-inverse navbar-fixed-top">
		  <div class="navbar-inner">
			<div>
			  <a class="navbar-brand" href="index" >
			  	<img src="${pageContext.request.contextPath}/resources/img/logoSmall.jpg" height="47px"/>
			  </a>
			  <div class="nav-collapse navbar-collapse ">
				<ul class="nav navbar-nav pull-right ">
					<sec:authorize ifNotGranted="ROLE_USER">
						<li style=""><a href="login" class="btn btn-primary btn-large login_now">LOGIN</a></li>
						<li style=""><a href="signupNow" class="btn btn-primary btn-large signup_now">SIGNUP NOW</a></li>
					</sec:authorize>
					<sec:authorize access="hasRole('ROLE_USER')">
						<li><a href="#" class="navbar-link">${pageContext.request.userPrincipal.name}</a></li>
						<li><a href="dost/j_spring_security_logout" class="navbar-link">Logout</a></li>
					</sec:authorize>
				</ul>
				<ul class="nav navbar-nav pull-left menuItems">
				  <sec:authorize access="hasRole('ROLE_USER')">
					<li style="" id="conversations"><a href="conversations">My Conversations</a></li>
				  </sec:authorize>
				  <li style="" id="discussions"><a href="forums/show/1.page">Discussions</a></li>
				  <sec:authorize access="hasRole('ROLE_USER')">
				  	<li style="" id="talkToFriend"><a href="talkToFriend">Talk To a Friend</a></li>
				  </sec:authorize>
				  <li id="faqs"><a href="faqs">FAQs</a></li>
				  <li style="" id="quotes"><a href="quotes">Quotes</a></li>
				  <!-- <li id="blogs"><a href="http://blog.yourdost.com" target="_blank">Blog</a></li>-->
				  <li id="blogs"><a href="blog">Blog</a></li>
				</ul>
			  </div><!--/.nav-collapse -->
			</div>
		  </div>
	</header>
</sec:authorize>

	