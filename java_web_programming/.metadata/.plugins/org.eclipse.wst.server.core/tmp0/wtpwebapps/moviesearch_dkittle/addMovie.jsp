<!DOCTYPE html>
<html lang="en">
<head>
<meta name="description"  content="This is a JSP example that demonstrates how 
to use a form to add a new movie">
<title>Java Web Programming: Add New Movie</title>
<%@ include file="includes/styles.jsp" %>
</head>
<body>
	<div class="container">
		<div class="hero-unit">
			<h1>Movies Application - Add New Movie</h1>
		</div>
		
	<%@ include file="includes/navigation.jsp" %>
	
		<div class="container">
			<form action="AddMovie" method="post">
        <label for ="title"><strong>title: </strong></label>
        <input name="title"><br>

        <label for ="director"><strong>director: </strong></label>
        <input name="director"><br>

        <label for ="lengthInMinutes"><strong>lengthInMinutes: </strong></label>
        <input name="lengthInMinutes"><br><br>
        <label>Click to add movie</label>
		<input type="submit" value="Add Movie"> 
			</form>
		</div>
	<%@ include file="includes/footer.jsp" %>
		
	</div>
<%@ include file="includes/scripts.jsp" %>
	
</body>
</html>
