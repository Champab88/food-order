<%-- 
    Document   : allorders
    Created on : Aug 13, 2016, 5:21:00 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<%!
String pa1="";
%>
<%
    response.setHeader("Cache-Control", "no-cache");
    response.setHeader("Cache-Control", "no-store");
    response.setDateHeader("Expires", 0);
    response.setHeader("Pragma", "no-cache");
   //out.println("1");
   String m=(String)session.getAttribute("admin");
//   String n=request.getParameter("val");
 // out.println("2"+m);
   //out.println("3"+n);
   try{
      
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/onlinefood", "root", "root");
     Statement st=con.createStatement();
     String Query="select * from admins where id='"+m+"'";
     ResultSet rs=st.executeQuery(Query);
     while(rs.next())
     {
      pa1=rs.getString(3);
     }
       
   }catch(Exception e)
   {
       out.println(e);
   }
  
    
    
   if(m==null||(!m.equals("admin"))&&!pa1.equals("admin"))
        {
            session.setAttribute("msg0", "Please login with administrator credentials to access this page.");
           // RequestDispatcher rd=request.getRequestDispatcher("login.jsp");
           // rd.forward(request, response);
           response.sendRedirect("adminlogin.jsp");
        }
//out.println("sfczfszgfsde");

%>
<%
     Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/onlinefood", "root", "root");
    String id=(String)session.getAttribute("email");
    String[][] data=new String[100][100];
            
    Statement st=con.createStatement();
    int count=0;
    ResultSet rs=st.executeQuery("select * from register");
    while(rs.next())
    {
        count++;
        
    }
    rs=st.executeQuery("select * from register order by eid");
    int x=1;
    while(rs.next()&&x<=count)
    {
        data[x][1]=rs.getString("eid");
        data[x][2]=rs.getString("fname")+" "+rs.getString("lname");
         data[x][3]=rs.getString("phone");
        x++;
    }
    
    
     
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
                        <h1>All Users:</h1>
                    </li>
                             
                </ul>
                	   </div>
           
		
            
            <div class="" style="margin-bottom:200px;margin-top: 50px;">
	
				 <div class="">
						
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
                                                                out.println("Name");
                                                                out.println("</b></td>");
                                                                            
                                                                out.println("<td><b>");
                                                                out.println("Phone Number");
                                                                out.println("</b></td>");
                                                                
                                                                out.println("<td><b>");
                                                                out.println("Remove User");
                                                                out.println("</b></td>");
                                                                
                                                                
                                                              out.println("</tr>");
                                                          for(int k=1;k<=count;k++)
                                                          {
                                                              out.println("<tr>");
                                                              
                                                              out.println("<td>");
                                                              out.println(k);
                                                              out.println("</td>");
                                                             for(int j=1;j<=3;j++)
                                                             {
                                                              out.println("<td>");
                                                                out.println(data[k][j]);
                                                                out.println("</td>");
                                                             }
                                                                            
                                                               out.println("<td>");
                                                                out.println("<a href=remove.jsp?action="+data[k][1]);
                                                                out.println(">Remove</a>");
                                                                out.println("</td>");
                                                                        
                                                              out.println("</tr>");
                                                                
        }
%>
                                              </table>

                                           </div>
                                              <br> <br>
                                              <h1>All Food Item Details:</h1>
   <div class="" style="margin-bottom:200px;margin-top: 50px;">
	
				 <div class="">
						
					   <div class="">
                                              <table class="table table-responsive">
                                                  
                                                  
                                                  <%
                                                      try{
                                                          
                                                          out.println("<tr>");
                                                              
                                                              out.println("<td><b>");
                                                              out.println("Order id :");
                                                              out.println("</b></td>");
                                                              
                                                                out.println("<td><b>");
                                                                out.println("Food Name :");
                                                                out.println("</b></td>");
                                                                            
                                                                out.println("<td><b>");
                                                                out.println("Food Price :");
                                                                out.println("</b></td>");
                                                                            
                                                                out.println("<td><b>");
                                                                out.println("Food Categeries:");
                                                                out.println("</b></td>");
                                                                
                                                                
                                                                 out.println("<td><b>");
                                                                out.println("Update food");
                                                                out.println("</b></td>");
                                                                
                                                                out.println("<td><b>");
                                                                out.println("Remove food");
                                                                out.println("</b></td>");
                                                                
                                                              out.println("</tr>");
                                                          
                                                          Class.forName("com.mysql.jdbc.Driver");
                                                          Connection con12 = DriverManager.getConnection("jdbc:mysql://localhost:3306/onlinefood", "root", "root");
                                                          String diQuery1="select * from items";
                                                          Statement stt1=con12.createStatement();
                                                          ResultSet rs12=stt1.executeQuery(diQuery1);
                                                      
                                                       while(rs12.next()){
                                                              out.println("<tr>");
                                                              
                                                              out.println("<td>");
                                                              out.println(rs12.getString(1));
                                                              out.println("</td>");
                                                              
                                                              out.println("<td>");
                                                              out.println(rs12.getString(2));
                                                              out.println("</td>");
                                                              
                                                              out.println("<td>");
                                                              out.println(rs12.getString(3));
                                                              out.println("</td>");
                                                              
                                                              out.println("<td>");
                                                              out.println(rs12.getString(4));
                                                              out.println("</td>");
                                                              
                                                                out.println("<td>");
                                                                out.println("<a href=update1.jsp?action="+rs12.getString(1));
                                                                out.println(">Update</a>");
                                                                out.println("</td>");
                                                                            
                                                                out.println("<td>");
                                                                out.println("<a href=remove2.jsp?action="+rs12.getString(1));
                                                                out.println(">Remove</a>");
                                                                out.println("</td>");
                                                                        
                                                              out.println("</tr>");
                                                                
                                                      }

                                                      }catch(Exception ee)
                                                      {
                                                          out.println(ee);
                                                      }
                                                      
              %>                                           
                                              </table>

                                           </div>
                                              
                                               <br> <br>
                                              <h1>All Food Order Details:</h1>
   <div class="" style="margin-bottom:200px;margin-top: 50px;">
	
				 <div class="">
						
					   <div class="">
                                              <table class="table table-responsive">
                                                  
                                                  
                                                  <%
                                                      try{
                                                          
                                                          out.println("<tr>");
                                                              
                                                              out.println("<td><b>");
                                                              out.println("Order id.");
                                                              out.println("</b></td>");
                                                              
                                                              out.println("<td><b>");
                                                                out.println("Name :");
                                                                out.println("</b></td>");
                                                                            
                                                                out.println("<td><b>");
                                                                out.println("Address");
                                                                out.println("</b></td>");
                                                                            
                                                                out.println("<td><b>");
                                                                out.println("Delivery Time");
                                                                out.println("</b></td>");
                                                                
                                                                out.println("<td><b>");
                                                                out.println("Mode of Payment");
                                                                out.println("</b></td>");
                                                                
                                                                 out.println("<td><b>");
                                                                out.println("Remove Food Order");
                                                                out.println("</b></td>");
                                                              out.println("</tr>");
                                                          
                                                          Class.forName("com.mysql.jdbc.Driver");
                                                          Connection con11 = DriverManager.getConnection("jdbc:mysql://localhost:3306/onlinefood", "root", "root");
                                                          String diQuery="select * from userdetails";
                                                          Statement stt=con11.createStatement();
                                                          ResultSet rs11=stt.executeQuery(diQuery);
                                                      
                                                       while(rs11.next()){
                                                              out.println("<tr>");
                                                              
                                                              out.println("<td>");
                                                              out.println(rs11.getString(1));
                                                              out.println("</td>");
                                                              
                                                              out.println("<td>");
                                                              out.println(rs11.getString(2));
                                                              out.println("</td>");
                                                              
                                                              out.println("<td>");
                                                              out.println(rs11.getString(3));
                                                              out.println("</td>");
                                                              
                                                              out.println("<td>");
                                                              out.println(rs11.getString(4));
                                                              out.println("</td>");
                                                              
                                                              out.println("<td>");
                                                              out.println(rs11.getString(5));
                                                              out.println("</td>");
                                                            
                                                                            
                                                               out.println("<td>");
                                                                out.println("<a href=remove1.jsp?action="+rs11.getString(1));
                                                                out.println(">Remove</a>");
                                                                out.println("</td>");
                                                                        
                                                              out.println("</tr>");
                                                                
                                                      }

                                                      }catch(Exception ee)
                                                      {
                                                          out.println(ee);
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

