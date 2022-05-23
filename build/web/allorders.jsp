<%-- 
    Document   : allorders
    Created on : Aug 13, 2016, 5:21:00 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<% 
    response.setHeader("Cache-Control", "no-cache");
    response.setHeader("Cache-Control", "no-store");
    response.setDateHeader("Expires", 0);
    response.setHeader("Pragma", "no-cache");
    
    String m=(String)session.getAttribute("admin");
    String n=(String)session.getAttribute("pwd");
      if(m==null||(!(m.equals("admin")||m.equals("cook"))))
        {
            session.setAttribute("msg0", "Please login with administrator credentials to access this page.");
            RequestDispatcher rd=request.getRequestDispatcher("adminlogin.jsp");
            rd.forward(request, response);
        }
       
%>
<%
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/onlinefood", "root", "root");
    String id=(String)session.getAttribute("email");
    String[] data=new String[100];
            
    Statement st=con.createStatement();
    int count=0;
    ResultSet rs=st.executeQuery("select distinct(eid) from userdetails");
    while(rs.next())
    {
        count++;
        
    }
    rs=st.executeQuery("select distinct(eid) from userdetails order by eid");
    int x=1;
    while(rs.next()&&x<=count)
    {
        data[x]=rs.getString("eid");
                
        x++;
    }
     
         System.out.println(count+" "+data[1]);
 %>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="head.jsp" %>
    </head>
<body>
    <!-- header-section-starts -->
    <%@include file="nav.jsp" %>

    <div class="cart-items">
	<div class="container">
			            <div class="dreamcrub">
			   	 <ul class="breadcrumbs">
                    <li class="home">
                        <h1>All Orders:</h1>
                    </li>
                             
                </ul>
                	   </div>
 <div class="">
				 <div class=""> </div>
				<div class="" style="margin-bottom:200px;margin-top: 50px;">
       		
					   <div class="">
                                              <table class="table table-responsive">
                                                  
                                                  
                                                  <%
                                                      out.println("<tr>");
                                                              
                                                              out.println("<td><b>");
                                                              out.println("S.No.");
                                                              out.println("</b></td>");
                                                              
                                                              out.println("<td><b>");
                                                                out.println("Email");
                                                                out.println("</b></td>");
                                                                            
                                                                out.println("<td><b>");
                                                                out.println("Order");
                                                                out.println("</b></td>");
                                                                
                                                                
                                                                         
                                                              out.println("</tr>");
                                                          for(int k=1;k<=count;k++)
                                                          {
                                                              out.println("<tr>");
                                                              
                                                              out.println("<td>");
                                                              out.println(k);
                                                              out.println("</td>");
                                                              
                                                              out.println("<td>");
                                                                out.println(data[k]);
                                                                out.println("</td>");
                                                                            
                                                                out.println("<td>");
                                                                out.println("<a href=check.jsp?action="+data[k]);
                                                                out.println(">View details</a>");
                                                                out.println("</td>");
                                                                            
                                                                         
                                                              out.println("</tr>");
        }
%>
                                              </table>

                                           </div>
                                 </div>
                         </div>

        </div>
    </div>
                                              
   <%@include file="footer.jsp" %>
</body>
</html>
