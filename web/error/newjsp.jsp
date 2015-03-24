<%-- 
    Document   : newjsp
    Created on : Mar 24, 2015, 11:43:22 AM
    Author     : Kevin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1><%=session.getAttribute("message") .toString()%></h1>
    </body>
</html>
