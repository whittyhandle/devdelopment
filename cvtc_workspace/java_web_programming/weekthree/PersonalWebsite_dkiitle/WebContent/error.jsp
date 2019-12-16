<!DOCTYPE html>
<html lang="en">
<head>
<link rel="stylesheet" href="reset.css" type="text/css">
<link rel="stylesheet" href="styles/main.css" type="text/css">
</head>
<body>
	
	<nav>
	<a href="home.jsp">Home</a> 
	<a href="contact.jsp">Contact</a>
	<a href="index.jsp">Index</a>
	<a href="thanks.jsp">Thanks</a>
	</nav>

	<h1>Error</h1>
	<p>Houston, we have a problem.</p>
	<p>To continue, click the back button.</p>
	
	<h2>Error Details</h2>
	<p>Type: ${pageContext.exception["classs"]}</p>
	<p>Message: ${pageContext.exception.message}</p>	
</body>
</html>