<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=${encoding}" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Expires" content="-1" />
<style type="text/css">@import url( ${contextPath}/templates/${templateName}/styles/style.css?${startupTime} );</style>
<style type="text/css">@import url( ${contextPath}/templates/${templateName}/styles/${language}.css?${startupTime} );</style>
<script src="http://localhost:8800/dost/resources/JS/jquery.js"></script>
<script src="http://localhost:8800/dost/resources/JS/bootstrap.min.js"></script>
<script src="http://localhost:8800/dost/resources/JS/jquery.sieve.min.js"></script>
<script src="http://localhost:8800/dost/resources/JS/script.js"></script>
<link href="http://localhost:8800/dost/resources/CSS/bootstrap.min.css" rel="stylesheet" media="screen">
<link href="http://localhost:8800/dost/resources/CSS/style.css" rel="stylesheet" media="screen">
<link href='http://fonts.googleapis.com/css?family=Open+Sans&subset=latin-ext' rel='stylesheet' type='text/css'>
</head>

<style>
body, html { width:100% ;
height:100% ;
overflow:hidden ;
}

iframe { width:100% ;
    height:100% ;
border:none ;
}
</style>
<body>
				<header id="main-navbar" class="navbar navbar-default navbar-fixed-top">
					  <div class="navbar-inner">
						<div>
						   <a class="navbar-brand" href="http://localhost:8800/dost/index" >
							  	<img src="http://localhost:8800/dost/resources/img/logoSmall.jpg" height="47px"/>
						  </a>
						  <div class="nav-collapse nav-collapse navbar-collapse">
						  
								<ul class="nav navbar-nav pull-right ">
									<li><a href="#" class="navbar-link">${session.username}</a></li>
									<li><a href="dost/j_spring_security_logout" class="navbar-link">Logout</a></li>
								</ul>
								<ul class="nav navbar-nav pull-left menuItems">
									  <li id="conversations"><a href="http://localhost:8800/dost/conversations">Conversations</a></li>
									  <li id="patientHistory"><a href="http://localhost:8800/dost/patientHistory">Patient History</a></li>
									  <li id="onlineCounseling"><a href="http://localhost:8800/dost/onlineCounseling">Online Counseling</a></li>
									  <li id="discussions"><a href="http://localhost:8800/dost/forums/show/1.pages">Dicussions</a></li>
									  <li id="quotes"><a href="http://localhost:8800/dost/quotes">Quotes</a></li>
									  <li id="faqs"><a href="http://localhost:8800/dost/faqs">FAQs</a></li>
									  <li id="blog"><a href="http://localhost:8800/dost/blog" >Blog</a></li>
								</ul>
							</div><!--/.nav-collapse -->
						</div>
					  </div>
					</header>
					
<iframe src="http://blog.yourdost.com/" height="100%">

</iframe>

</body>
</html>