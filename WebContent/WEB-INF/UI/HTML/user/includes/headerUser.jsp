<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<header id="main-navbar" class="navbar navbar-inverse navbar-fixed-top">
	  <div class="navbar-inner">
		<div>
		  <a class="navbar-brand" href="index" >
		  	<img src="../resources/img/logoSmall.jpg" height="47px"/>
		  </a>
		  <div class="nav-collapse navbar-collapse ">
			<ul class="nav navbar-nav pull-right ">
				<sec:authorize ifNotGranted="ROLE_USER">
					<li><a href="login" class="btn btn-primary btn-large signup_now">SIGNUP NOW</a></li>
				</sec:authorize>
				<sec:authorize access="hasRole('ROLE_USER')">
					<li><a href="#" class="navbar-link">${pageContext.request.userPrincipal.name}</a></li>
					<li><a href="../index" class="navbar-link">Logout</a></li>
				</sec:authorize>
			</ul>
			<ul class="nav navbar-nav pull-left">
			  <sec:authorize access="hasRole('ROLE_USER')">
				<li><a href="conversations">My Conversations</a></li>
			  </sec:authorize>
			  <li><a href="discussionsAll">Discussions</a></li>
			  <sec:authorize access="hasRole('ROLE_USER')">
			  	<li><a href="talkToFriend">Talk To a Friend</a></li>
			  </sec:authorize>
			  <li><a href="faqs">FAQs</a></li>
			  <li><a href="resources">Resources</a></li>
			</ul>
		  </div><!--/.nav-collapse -->
		</div>
	  </div>
</header>