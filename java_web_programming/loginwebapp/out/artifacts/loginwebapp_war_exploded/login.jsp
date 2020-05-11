<%--
  Created by IntelliJ IDEA.
  User: david.kittle
  Date: 5/5/20
  Time: 9:34 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login Page</title>
</head>
<body>
<!-- default method is a get, that's good if  the parameters are passed via the URL
 post passes it more secure -->
<!-- set the action of the form to the appropriate controller servlet
that way what ever is submitted by the action is sent to the appropriate servlet-->
<form action="/login" method="post">
    <!-- name is the paramater and it  gets passed to the servlet -->
    UserId: <input type="text" name="userId"/>
    Password: <input type="password" name="password"/>
    <input type="submit"/>

</form>

</body>
</html>
