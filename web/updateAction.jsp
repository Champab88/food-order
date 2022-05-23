<%-- 
    Document   : updateAction
    Created on : Jan 22, 2019, 2:57:06 PM
    Author     : knowx
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       
        <%
        
        String fidd=request.getParameter("fid1");
        String fdname=request.getParameter("foodname1");
        String fdprice=request.getParameter("foodprice1");
        
          out.println(fidd+fdname+fdprice);
          try
          {
    Class.forName("com.mysql.jdbc.Driver");
    Connection con12 = DriverManager.getConnection("jdbc:mysql://localhost:3306/onlinefood", "root", "root");
    String diQuery1="update `items` set `price`='"+fdprice+"' where `id`='"+fidd+"'";
    Statement stt1=con12.createStatement();
    int i=stt1.executeUpdate(diQuery1);
    if(i>0)
    {
        response.sendRedirect("users.jsp?update Successfully");
    }else
    {
        response.sendRedirect("users.jsp?update failed");
    }
              
          }catch(Exception e)
          {
              out.println(e);
          }
        
        
        %>
    </body>
</html>
