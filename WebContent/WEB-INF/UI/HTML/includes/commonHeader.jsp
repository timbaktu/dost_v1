<head>
	<script src="${pageContext.request.contextPath}/resources/JS/jquery.js"></script>
	<script src="${pageContext.request.contextPath}/JS/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/JS/jquery.sieve.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/JS/script.js"></script>
	<link href="${pageContext.request.contextPath}/resources/CSS/bootstrap.min.css" rel="stylesheet" media="screen">
	<link href="${pageContext.request.contextPath}/resources/CSS/style.css" rel="stylesheet" media="screen">
	<link href="${pageContext.request.contextPath}/resources/lib/css/ui-lightness/jquery-ui-1.10.4.custom.css" rel="stylesheet">
	<script src="${pageContext.request.contextPath}/resources/lib/jquery-ui-1.10.4.custom.js"></script>
	
	
	<style>
		.loading {
		  position: fixed;
		  top: 50%;
		  left: 50%;
		  transform: translate(-50%, -50%);
		}
	</style>
 <script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-54844318-1', 'auto');
	if('${pageContext.request.userPrincipal}') {
		  ga('set', '&uid', '${pageContext.request.userPrincipal}');
		  var dimensionValue = '${pageContext.request.userPrincipal}';
		  ga('set', 'dimension1', dimensionValue);		
	}
  
  ga('send', 'pageview');

  

</script>  	
</head>