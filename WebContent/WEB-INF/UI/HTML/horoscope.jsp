<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>

<!DOCTYPE html>
<html lang="en">

	<jsp:include page="includes/commonHeader.jsp"></jsp:include>
	<script>
		$( document ).ready(function() {
			var zodiac = window.location.href.split("=");
			$("iframe").attr("src", 'http://zodiac-signs-astrology.com/zodiac-signs/'+zodiac[1].toLowerCase()+'.htm');
		});
	
	</script>
	
	<body class="container-fluid theme-default">
		<jsp:include page="includes/header.jsp"></jsp:include>
				
		<div class="container">
			<iframe class="horoscope"></iframe>
    	</div> <!-- /container -->

	<footer></footer>
	</body>
</html>
