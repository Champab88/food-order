<%-- 
    Document   : checkout
    Created on : Jul 26, 2016, 7:29:28 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.util.*,java.sql.*"%>
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
    String id=request.getParameter("action");
    
     String adrs="";
     String tm="";
     String ph,tym="";
     String nam,items="";
     char ch2;
     String[] str=new String[100];
   
    Statement st=con.createStatement();
    
    ResultSet rs=st.executeQuery("select * from userdetails where eid='"+id+"'");
    if(rs.next())
    {
        adrs=rs.getString(2);
        tm=rs.getString(3);
        session.setAttribute("ad", adrs);
        session.setAttribute("tym", tm);
       
    }
    rs=st.executeQuery("select * from register where eid='"+id+"'");
     if(rs.next())
    {
        nam=rs.getString(1)+" "+rs.getString(2);
        ph=rs.getString(6);
        
        session.setAttribute("nam", nam);
         session.setAttribute("ph", ph);
        
   
    }
     
    rs=st.executeQuery("select * from orderdata where eid='"+id+"'");
    if(rs.next())
    {
        items=rs.getString("items");
        tym=rs.getString(3);
    }
    char[] ch;
    ch=items.toCharArray();
    int l=ch.length;
    int[] price=new int[50];
    for(int k=0;k<l;k++)
    {
        ch2=ch[k];
        rs=st.executeQuery("select * from items where id='"+ch2+"'");
        if(rs.next())
        {
            str[k]=rs.getString(2);
            price[k]=rs.getInt(3);
        }
    }
    int total=0;
   for(int k=0;k<l;k++)
    {
        total+=price[k];
    }
    
     
     
     
%>

<!DOCTYPE html>
<html>
    <head>
        <%@include file="head.jsp" %>
           <script>
        function printDiv(divName) {
     var printContents = document.getElementById(divName).innerHTML;
     var originalContents = document.body.innerHTML;

     document.body.innerHTML = printContents;

     window.print();

     document.body.innerHTML = originalContents;
}
    </script>
    </head>
<body>
    <!-- header-section-starts -->
    <%@include file="nav.jsp" %>
	<!-- header-section-ends -->
	<!-- content-section-starts -->
	<!-- checkout -->
<div class="cart-items">
	<div class="container">
			           <div class="dreamcrub">
			   	 <ul class="breadcrumbs">
                    <li class="home">
                        <h1>Order details:</h1>
                    </li>
                             
                </ul>
                <ul class="previous">
                    
                    <li><h3><a href="allorders.jsp">Go to Orders</a></h3></li>
                </ul>
                	   </div>
  <div class="cart-header">
				 <div class=""> </div>
				 <div class="cart-sec simpleCart_shelfItem">
						
					   <div class="" id="printableArea">
                                               <h3 style="padding-left: 330px">Order on <%= tym%></h3>
                                               
                                               <div class="col-lg-6" style="padding: 15px">
                                                   <h4>User details:</h4>
                                                   <br/>
                                               <table class="table">
                                                   
                                                   <tbody>
                                                       <tr>
                                                           <td>Email:</td>
                                                           <td><b><% 
                                                  out.println(id);
                                              %></b></td>
                                                       </tr>
                                                       
                                                       <tr>
                                                           <td>Name:</td>
                                                           <td><b><% 
                                              String name=(String)session.getAttribute("nam");
                                            if(name!=null)
                                              {
                                                  out.println(name);
                                              }
                                            session.removeAttribute("nam");
                                            %></b></td>
                                                       </tr>
                                                       
                                                       <tr>
                                                           <td>Delivery Address:</td>
                                                           <td><b><% 
                                              String ms=(String)session.getAttribute("ad");
                                            if(ms!=null)
                                              {
                                                  out.println(ms);
                                              }
                                            session.removeAttribute("ad");
                                            %></b></td>
                                                       </tr>
                                                       <tr>
                                                           <td>Delivery Time:</td>
                                                           <td><b><% 
                                              String msg2=(String)session.getAttribute("tym");
                                            if(msg2!=null)
                                              {
                                                  out.println(msg2);
                                              }
                                            session.removeAttribute("tym");
                                            %></b></td>
                                                       </tr>
                                                       <tr>
                                                           <td>Phone Number:</td>
                                                           <td><b><% 
                                              String msg3=(String)session.getAttribute("ph");
                                            if(msg3!=null)
                                              {
                                                  out.println(msg3);
                                              }
                                            session.removeAttribute("ph");
                                            %></b></td>
                                                       </tr>
                                                   </tbody>
                                               </table>
                                               </div>
                                                       <div class="col-lg-6" style="padding: 15px">
                                                           <h4>Ordered items:</h4>
                                                           <br/>
                                                               <span>
                                                                   <table class="table">
                                                                       <tr>
                                                                           <th>Items</th>
                                                                           <th>Price($)</th>
                                                                       </tr>
                                                                      
                                                                           
                                                                   <%
                                                                       for(int k=0;k<l;k++)
                                                                         {
                                                                             out.println("<tr>");
                                                                             out.println("<td>");
                                                                            
                                                                            out.println(str[k]);
                                                                            out.println("</td>");
                                                                            out.println("<td>");
                                                                            
                                                                            out.println(price[k]);
                                                                            out.println("</td>");
                                                                            
                                                                           out.println("</tr>");
                                                                         }
                                                                       %>
                                                                      
                                                                       <tr>
                                                                       <tr></tr>
                                                                           <th>Total</th>
                                                                           <th><% out.println(total);%></th>
                                                                       </tr>
                                                                        
                                                                           

                                                                   </table>
                                                           </span>
                                           </div>


					   </div>
                                                                       <input type="button" onclick="printDiv('printableArea')" value="Generate Bill" />

                                                                       
					   <div class="clearfix"></div>
											
				  </div>
                                                                       
                                                                       
			 </div>
			</div>
		 </div>
<!-- checkout -->
<%@include file="footer.jsp" %>
</body>
</html>