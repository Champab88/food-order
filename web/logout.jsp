<%-- 
    Document   : logout
    Created on : Jul 28, 2016, 10:55:08 PM
    Author     : DELL
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%!
    String uname1="";

%>
<%
    String m=(String)session.getAttribute("email");
    String ad=(String)session.getAttribute("admin");
    
    out.println(m+" "+ad);
     
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/onlinefood", "root", "root");
    Statement st=con.createStatement();
    String squery="select * from admins where id='"+ad+"'";
    ResultSet rs=st.executeQuery(squery);
    //out.println("aaaa");
    while(rs.next())
    {
        uname1=rs.getString(2);
    }
    
    if("admin".equals(uname1)||"cook".equals(uname1))
    {
        session.removeAttribute("admin");
    
        response.sendRedirect("adminlogin.jsp");
    }
    else if(m!=null)
    {
        session.removeAttribute("email");
    
        response.sendRedirect("login.jsp");
    }
    session.invalidate();
    %>