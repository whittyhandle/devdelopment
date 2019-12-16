<!DOCTYPE html>
<html lang="en">
<head>
<title>Contact Page</title>
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
	
	<h1>Welcome to my personal website</h1>
	
	<p>To learn more about me visit my <a href="bio.html">Bio Page</a>.</p>
	
	<p><em>${message}</em></p>
	
	<p>To connect with me, enter you name and email address below.</p>
	
	<form action="connect" method="post">
	
		<label for="firstName">First Name: </label>
		<input name="firstName" value="${user.firstName}"><br>
		
		<label for="lastName">Last Name: </label>
		<input name="lastName" value="${user.lastName}"><br>
		
		<label for="email">Email: </label>
		<input name="email" value="${user.email}"><br>
		
		<input type="submit" value="Connect!"> 
	
	
	</form>
</body>
</html>