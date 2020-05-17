<%--
  Created by IntelliJ IDEA.
  User: david.kittle
  Date: 5/4/20
  Time: 7:49 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
</head>
<body>
<h1>Login page</h1>

<form action="/login" method="post">
    login-name: <input type="text" name="loginname" width="30"/>
    password: <input type="password" name="password" width="10"/>
    <input type="submit" value="login"/>
</form>

<p>${errorMessage}</p>

</body>
</html>
