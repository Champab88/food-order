<%-- 
    Document   : cancel
    Created on : Aug 3, 2016, 8:23:12 AM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<%!
    String pass1="";

%>
<%
    Statement st=null;
    Statement st1=null;
    String id=(String)session.getAttribute("admin");
    String str=request.getParameter("action");
    out.println(id+" "+str);
    
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/onlinefood", "root", "root");
    st=con.createStatement();
    String squery="select * from admins where id='"+id+"'";
    ResultSet rs=st.executeQuery(squery);
     out.println("aaaa");
    while(rs.next())
    {
        pass1=rs.getString(3);
    }
    out.println("ccc"+pass1);
    if("admin".equals(pass1))
    {
      st1=con.createStatement();
    int k=st1.executeUpdate("delete from register where eid='"+str+"'");
    if(k>0)
    {
        response.sendRedirect("users.jsp");
    }
    }
    con.close();
    
    
    
%>