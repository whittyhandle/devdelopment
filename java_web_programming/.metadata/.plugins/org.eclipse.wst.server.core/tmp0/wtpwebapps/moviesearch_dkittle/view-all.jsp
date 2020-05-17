<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta name="description"  content="This is a servlet example that 
demonstrates how to use IO to output contents of an Excel spreadsheet to a web page."/>
<title>Java Web Programming: Movies - View All</title>
<%@ include file="includes/styles.jsp" %>
</head>
<body>
	<div class="container">
		<div class="hero-unit">
			<h1>Movies Application </h1>
		</div>
		<%@ include file="includes/navigation.jsp" %>
		<div class="container">
		  <c:choose>
		    <c:when test="${empty movie}">
		      <p>Sorry, the list of movies is empty.</p>
		    </c:when>
		      <c:otherwise>
		        <c:forEach var="movie" items="${movie}">
		        	<div class="span4">
		        		<h2>${movie.title}</h2>
		          		<p>${movie.title}  ${movie.director} is ${movie.lengthInMinutes}. </p>
		        	</div>
		        </c:forEach>
		      </c:otherwise>
		  </c:choose>
	</div>
	<%@ include file="includes/footer.jsp" %>
	
	</div>
	<%@ include file="includes/scripts.jsp" %>	

</body>
</html>