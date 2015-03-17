<%-- 
    Document   : controlPanel
    Created on : Mar 18, 2015, 12:14:57 AM
    Author     : Kevin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<jsp:useBean id="staff" scope="session" class="Entity.Staff" />
<jsp:setProperty name="staff" property="*"/>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <h1>Hello World!</h1>
        <h2>Welcome</h2> ${staff.toString()}
    </body>
</html>
