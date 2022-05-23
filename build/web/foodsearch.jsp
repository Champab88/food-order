<%-- 
    Document   : foodsearch
    Created on : Jan 16, 2019, 2:18:09 PM
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
       
       String lname=request.getParameter("llname");
       String rname=request.getParameter("rrname");
       String cname=request.getParameter("ccname");
       out.println(lname+" "+rname+" "+cname);
       try{
      
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/onlinefood", "root", "root");
     Statement st=con.createStatement();
     String Query="select * from fooddetails where location='"+lname+"' and foodname='"+cname+"'";
     ResultSet rs=st.executeQuery(Query);
      %>
       
        <table border="3px" width="1250" height="300">
             <tr bgcolor="red">
                 <th>Food Id</th>
                 <th>Food Name</th>
                 <th>Food Quantity</th>
                 <th>Food Price</th>
                 <th>Restaurant Name</th>
                 <th>Location</th>
                 <th>speciality</th>
                 <th>order</th>
             </tr>
              <%
     while(rs.next())
     {
      %>
       
      <tr>
          <td><%= rs.getString(1)%></td>
          <td><%= rs.getString(2)%></td>
          <td><%= rs.getString(3)%></td>
          <td><%= rs.getString(4)%></td>
          <td><%= rs.getString(5)%></td>
          <td><%= rs.getString(6)%></td>
          <td><%= rs.getString(7)%></td>
          <td><a href="order.jsp?val=<%= rs.getString(2)%>">order</td>
      </tr>
        
        
        
       
        
        
        
        <%
     }
       
   }catch(Exception e)
   {
       out.println(e);
   }
       
       %>
       </table>
    </body>
</html>
