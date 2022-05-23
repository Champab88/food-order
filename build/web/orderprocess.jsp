<%-- 
    Document   : orderprocess
    Created on : Jul 30, 2016, 3:52:45 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<%
      Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/onlinefood", "root", "root");
    
    String address=request.getParameter("address");
    String time=request.getParameter("time");
    String typ=request.getParameter("type");
     String id=(String)session.getAttribute("email");
     String oid=(String)session.getAttribute("oid");
     
    Statement st=con.createStatement();
    
    int i=st.executeUpdate("insert into userdetails values('"+oid+"','"+id+"','"+address+"','"+time+"','"+typ+"')");
    if(i>0)
    {
        
      response.sendRedirect("checkout2.jsp");
    }
    
    
     
    %>