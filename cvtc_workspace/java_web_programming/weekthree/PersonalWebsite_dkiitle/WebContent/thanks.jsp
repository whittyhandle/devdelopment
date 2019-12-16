<!DOCTYPE html>
<html lang="en">
<head>
<title>Thank you!</title>
<!-- add description tags on each page -->
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

	<h1>Thanks for connecting with me</h1>
	<p> Thank you ${user.firstName} ${user.lastName}, I will contact you soon at: ${user.email }</p>
	<p> You should check out my <a href="bio.html">Bio Page</a>! Or, return to the <a href=".">Home Page</a>.</p>
</body>
</html>