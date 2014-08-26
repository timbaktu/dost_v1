<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html><html lang="en">
	<jsp:include page="includes/commonHeader.jsp"></jsp:include>


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
<sec:authorize access="hasRole('ROLE_ADMIN')">
	
	<body class="theme-default theme-default-counselor" >
	</sec:authorize>
	<sec:authorize access="!hasRole('ROLE_ADMIN')">
	<body class="theme-default">
	</sec:authorize>
	<jsp:include page="includes/header.jsp"></jsp:include>					
	
	<iframe src="http://blog.yourdost.com/" height="100%"></iframe>

</body>
</html>