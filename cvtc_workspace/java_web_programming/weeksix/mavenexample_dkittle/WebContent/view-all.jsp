<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta name="description"  content="This is a servlet example that 
demonstrates how to use IO to output contents of an Excel spreadsheet to a web page."/>
<title>Java Web Programming: Class List</title>
<%@ include file="includes/styles.jsp" %>
</head>
<body>
	<div class="container">
		<div class="hero-unit">
			<h1>Class List</h1>
		</div>
		<%@ include file="includes/navigation.jsp" %>
	
		<div class="container">
			<c:choose>
				<c:when test="${empty people}">
					<p>Sorry, the list of people is empty.</p>
				</c:when>
					<c:otherwise>
						<c:forEach var="person" items="${people}">
							<div class="span4">
								<h2>${person.firstName}</h2>
								<p>${person.firstName} ${person.lastName} is ${person.age} years old.
								${person.firstName }'s favorite color is ${person.favoriteColor }</p>
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