<%-- 
    Document   : orders-list
    Created on : Jul 26, 2016, 7:29:47 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>


<!DOCTYPE html>
<html>
    <head>
        <%@include file="head.jsp" %>
    </head>
<body>
    <!-- header-section-starts -->
    <%@include file="nav.jsp" %>

	<!-- header-section-ends -->
	<!-- content-section-starts -->
        <div>
                           <span style=" color: red;text-align: center"><h3>
       
                            </h3> </span>
		       </div>
	<div class="orders">
	<div >
           
             <%
       
//       String lname=request.getParameter("llname");
//       String rname=request.getParameter("rrname");
       String cname=request.getParameter("ccname");
      // out.println(lname+" "+rname+" "+cname);
       try{
      
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/onlinefood", "root", "root");
     Statement st=con.createStatement();
     String Query="select * from items where itemname='"+cname+"' ";
     ResultSet rs=st.executeQuery(Query);
      %>
            
            
            <form method="post" action="orderlist.jsp" class="">
                <div> <h1>
                <div class="col-lg-6" style="padding: 15px">
                    <h3>Search Food Name Result is::</h3>
                    <br/>
                       <table class="table">
                           
                        <tr>
                 <th>Food Id</th>
                 <th>Food Name</th>
                 <th>Food Price</th>
                 <th>Food Type</th>
                
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
         
          <td><a href="order.jsp?val=<%= rs.getString(2)%>">Order now</td>
                        </tr>
                       
                         
                        
        <%
     }
       
   }catch(Exception e)
   {
       out.println(e);
   }
       
       %>
       </table>
                </div>
                </h1>
              
                </div>
                
                                                                   
	        <div class="clearfix"></div>
  
                <div class="form_details">
                    <div class="clearfix"></div>
                    <br><br><br>
                <div class="clearfix"></div>
                </div>
            </form>
	</div>
      
</div>
        <%@include file="footer.jsp" %>
</body>
</html>