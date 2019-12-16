<!DOCTYPE html>
<html lang="en">
<head>
<meta name="description"  content="This is a JSP example to populate the database" >
<title>Java Web Programming: Populate Database</title>
<%@ include file="includes/styles.jsp" %>
</head>
<body>
	<div class="container">
		<div class="hero-unit">
			<h1>Populate Database</h1>
		</div>
		
		<%@ include file="includes/navigation.jsp" %>
	
		<div class="container">
      <form action="PopulateDatabase" method="post">
      <p>Click on the Populate button to populate the movie database.</p>
      <p>Waring: Submitting this form will reset the database and it will 
      only contain those movie in the original spreadsheet</p>
      <input type="submit" value="Populate!"> 
    </form>
		</div>
    <hr>
		<%@ include file="includes/footer.jsp" %>
		
	</div>
<%@ include file="includes/scripts.jsp" %>