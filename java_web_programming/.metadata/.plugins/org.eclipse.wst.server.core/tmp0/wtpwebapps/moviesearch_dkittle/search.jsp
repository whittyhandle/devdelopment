<!DOCTYPE html>
<html lang="en">
<head>
<meta name="description"  content="This is a JSP example for a simple search page"/>
<%@ include file="includes/styles.jsp" %>
<title>Java Web Programming: Movies - Search</title>
</head>
<body>
	<div class="container">
		<div class="hero-unit">
			<h1>Movies Application - Search</h1>
		</div>
		<%@ include file="includes/navigation.jsp" %>	
		<div class="container">
			<form action="Search" method="post">
				<label for ="title"><strong>Search by Title: </strong></label>
				<input name="title"><br>
				 
				<label for ="director"><strong>Search by Director: </strong></label>
				<input name="director"><br>
				<input type="submit" value="Search!"><br>
			</form>
		</div>
		<%@ include file="includes/footer.jsp" %>
	</div>
	<%@ include file="includes/scripts.jsp" %>
</body>
</html>