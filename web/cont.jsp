<%-- 
    Document   : cont
    Created on : Sep 6, 2016, 8:14:52 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<%
    String sub=request.getParameter("sub");
    String ms=request.getParameter("msg");
    String m=(String)session.getAttribute("email");
    out.println("mmm"+m);
    
   int count=0;
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/onlinefood", "root", "root");
    Statement st=con.createStatement();
    int i=st.executeUpdate("insert into contact values('"+count+"','"+sub+"','"+ms+"')");
    
    if(i>0)
    {
        
       session.setAttribute("scs", "Message sent");
        response.sendRedirect("contact.jsp");
    }
    con.close();
    
    
    

    
    
%>