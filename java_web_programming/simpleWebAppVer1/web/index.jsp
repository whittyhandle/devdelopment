<%@ page import="java.util.Date" %><%--
  Created by IntelliJ IDEA.
  User: david.kittle
  Date: 5/4/20
  Time: 7:35 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Docker Web App Page </title>
  </head>
  <body>
  <h1>Hello World JSP page</h1>

  <!--Not recommended to add java to a JSP -->
  <%
    Date date = new Date();
    out.print("<h2>" + date.toString() + "</h2>");
  %>

  </body>
</html>
