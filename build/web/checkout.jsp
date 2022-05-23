<%-- 
    Document   : orders-list
    Created on : Jul 26, 2016, 7:29:47 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<%!

String oooid="";
String odate1="";
%>
<% 
    response.setHeader("Cache-Control", "no-cache");
    response.setHeader("Cache-Control", "no-store");
    response.setDateHeader("Expires", 0);
    response.setHeader("Pragma", "no-cache");
    
    String m=(String)session.getAttribute("email");
        if(m==null)
        {
            session.setAttribute("msg0", "Please login first.");
            //RequestDispatcher rd=request.getRequestDispatcher("login.jsp");
            //rd.forward(request, response);
            response.sendRedirect("login.jsp?action=checkout");
        }
       

        %>
<%
    String act=(String)session.getAttribute("email");
    String oid=(String)session.getAttribute("oid");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/onlinefood", "root", "root");
    Statement st=con.createStatement();
    ResultSet rs=null;
    String[] arr={"oid","Name","Phone Number","Delivery Address","Delivery Time","Payment Type"};
    int[] no=new int[20];
    String items="";
    char ch2;
    String[][] str=new String[20][100];
    String[][] ar=new String[20][100];
    
    int y=1,z=4,p=2,e=3;
    for(int b=1;b<=6;b++)
    {
        ar[b][1]=arr[b-1];
    }

    rs=st.executeQuery("select * from orderdata where eid='"+act+"' order by ordertime desc");
    while(rs.next())
    {
        ar[1][p]=rs.getString(4);
       oooid=ar[1][p];
        p++;
    }
    for(int t=2;t<=p;t++)
    {
    rs=st.executeQuery("select * from userdetails where oid='"+ar[1][t]+"'");
    if(rs.next())
    {
        ar[4][t]=rs.getString(3);
        ar[5][t]=rs.getString(4);
        ar[6][t]=rs.getString(5);
    }
   
    }
     rs=st.executeQuery("select * from register where eid='"+act+"'");
     if(rs.next())
    {
        for(int b=2;b<=p;b++)
        {
        ar[2][b]=rs.getString(1)+" "+rs.getString(2);
        ar[3][b]=rs.getString(6);
        }
    }
    
      rs=st.executeQuery("select * from register where eid='"+act+"'");
    while(rs.next())
    {
        //str[y][1]="";
        str[y][1]=rs.getString(4);
        str[y][2]=rs.getString(3);
        str[y][2]=rs.getString(3);
        
        y++;
    }
    
//     rs=st.executeQuery("select * from orderdata where oid='"+oooid+"'");
//    while(rs.next())
//    {
//       
//    }
    
    int l=1;
    int[][] price=new int[50][50];
    int total=0;
   
    for(int a=1;a<y;a++)
    {
     total=0;   
    rs=st.executeQuery("select * from orderdata where eid='"+str[a][2]+"'");
    if(rs.next())
    {
        items=rs.getString(2);
        odate1=rs.getString(3);
    }
    char[] ch;
    ch=items.toCharArray();
    l=ch.length;
    no[a]=l;
    

    for(int k=0;k<l;k++)
    {
        ch2=ch[k];
        rs=st.executeQuery("select * from items where id='"+ch2+"'");
        if(rs.next())
        {
            str[a][k+4]=rs.getString(2);
            price[a][k+1]=rs.getInt(3);
    
            
        }
                total+=price[a][k+1];

    }
    // for(int k=1;k<=l;k++)
    {
    }
     str[a][3]=""+total;
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

	<!-- header-section-ends -->
	<!-- content-section-starts -->
            <div>
                           <span style=" color: red;text-align: center"><h3>
             <% 
                                              String msg0=(String)session.getAttribute("value");
                                            if(msg0!=null)
                                              {
                                                  out.println(msg0);
                                              }
                                            session.removeAttribute("value");
                                          %>
                            </h3> </span>
		       </div>
                             <div class="" style="margin-bottom:200px;margin-top: 50px;">
       
	<div class="cart-header">
	<div class="container">
                <div>
                    <h2>My Orders:</h2>
                    <%  
                    
                        for(int n=1;n<y;n++){
                    
                   
                    
                    %>
                    <div class="col-lg-10 cart-sec simpleCart_shelfItem " style="margin: 5px;" >
                        <ul class="list-unstyled list-group-item list-inline">
                            <li><h4><span>Order ID: <b><%= oooid%></b></span></h4></li>
                            <li style="margin-left: 410px;"><h4><span>Order Date: <b><%=odate1%></b></span></h4></li>
                        </ul>
                        <br/>
                    <span>
                        <div class="col-lg-5" style="padding: 2px;">
    
                          <table  class="table table-condensed ">
                           <%
                                                           for(int k=2;k<=6;k++)
                                                                         {
                                                                             out.println("<tr>");
                                                                             
                                                                             out.println("<td>");
                                                                             out.println(ar[k][1]);
                                                                            out.println("</td>");
                                                                            
                                                                             out.println("<td>");
                                                                             out.println(ar[k][n+1]);
                                                                            out.println("</td>");
                                                                            
                                                                            out.println("</tr>");
                                                                         }
    
                                                                       %>
                       </table>
                        </div>
                       <div class="col-lg-5" style="padding: 2px">
    
                       <table class="table table-condensed">
                           <tr>
                                                <th>Items</th>
                                                <th>Price($)</th>
                           </tr>
                         <%
                                                           for(int k=1;k<=no[n];k++)
                                                                         {
                                                                             out.println("<tr>");
                                                                             
                                                                             out.println("<td>");
                                                                             out.println(str[n][k+3]);
                                                                            out.println("</td>");
                                                                            
                                                                            out.println("<td>"); 
                                                                            out.println(price[n][k]);
                                                                            out.println("</td>");
                                                                            
                                                                            
                                                                            out.println("</tr>");
                                                                         }
    
                                                                       %>
                                                                       <tr>
                                                                       <tr></tr>
                                                                           <th>Total</th>
                                                                           <th><% out.println(str[n][3]);%></th>
                                                                       </tr>
                       </table>
                                                                       
                       </div>
                                                                       <div class="col-lg-2 login-right">
						<a href="cancel.jsp?action=<%=str[n][1]%>"><input type="submit" value="Cancel Order"></a>
					</div>
					
                                                                       
                    </span>
                </div>
                    <%}%>
                
         </div>
        </div></div>
                             </div>
                
        <%@include file="footer.jsp" %>      
</body>
</html>