<%-- 
    Document   : search
    Created on : Jan 16, 2019, 2:19:55 PM
    Author     : knowx
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <%
       
       String fname1=request.getParameter("fname");
       out.println("Selected food name is:"+fname1);
       
       
       %>
    </body>
</html>
