<%-- 
    Document   : orders-list
    Created on : Jul 26, 2016, 7:29:47 PM
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
    String act=request.getParameter("action");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/onlinefood", "root", "root");
    Statement st=con.createStatement();
    ResultSet rs=null;
    String[] arr={"Name","Phone Number","Delivery Address","Delivery Time","Payment Type"};
    int[] no=new int[20];
    String items="";
    char ch2;
    String[][] str=new String[20][100];
    String[][] ar=new String[20][100];
    
    int y=1,z=2;
    for(int b=1;b<=5;b++)
    {
        ar[1][b]=arr[b-1];
    }
    rs=st.executeQuery("select * from userdetails where eid='"+act+"'");
    while(rs.next())
    {
        ar[z][3]=rs.getString(3);
        ar[z][4]=rs.getString(4);
        ar[z][5]=rs.getString(5);
        z++;
    }
     rs=st.executeQuery("select * from register where eid='"+act+"'");
     if(rs.next())
    {
        for(int b=2;b<=(z-1);b++)
        {
        ar[b][1]=rs.getString(1)+" "+rs.getString(2);
        ar[b][2]=rs.getString(6);
        }
    }
    rs=st.executeQuery("select * from orderdata where eid='"+act+"' order by ordertime desc");
    while(rs.next())
    {
        //str[y][1]="";
        str[y][1]=rs.getString(4);
        str[y][2]=rs.getString(3);
        str[y][2]=rs.getString(3);
        
        y++;
    }
    int l=1;
    int[][] price=new int[50][50];
    int total=0;
   
    for(int a=1;a<y;a++)
    {
     total=0;   
    rs=st.executeQuery("select * from orderdata where ordertime='"+str[a][2]+"'");
    if(rs.next())
    {
        items=rs.getString(2);
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
                    <h2>Order Details:</h2>
                    <%for(int r=1;r<y;r++){%>
                    <div class="col-lg-10 cart-sec simpleCart_shelfItem " style="margin: 5px;" >
                        <ul class="list-unstyled list-group-item list-inline">
                            <li><h4><span>Order ID: <b><%=str[r][1]%></b></span></h4></li>
                            <li style="margin-left: 410px;"><h4><span>Order Date: <b><%=str[r][2]%></b></span></h4></li>
                        </ul>
                        <br/>
                    <span>
                        <div class="col-lg-5" style="padding: 2px;">
    
                          <table  class="table table-condensed ">
                           <%
                                                           for(int k=1;k<=5;k++)
                                                                         {
                                                                             out.println("<tr>");
                                                                             
                                                                             out.println("<td>");
                                                                             out.println(ar[1][k]);
                                                                            out.println("</td>");
                                                                            
                                                                             out.println("<td>");
                                                                             out.println(ar[r+1][k]);
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
                                                           for(int k=1;k<=no[r];k++)
                                                                         {
                                                                             out.println("<tr>");
                                                                             
                                                                             out.println("<td>");
                                                                             out.println(str[r][k+3]);
                                                                            out.println("</td>");
                                                                            
                                                                            out.println("<td>"); 
                                                                            out.println(price[r][k]);
                                                                            out.println("</td>");
                                                                            
                                                                            
                                                                            out.println("</tr>");
                                                                         }
    
                                                                       %>
                                                                       <tr>
                                                                       <tr></tr>
                                                                           <th>Total</th>
                                                                           <th><% out.println(str[r][3]);%></th>
                                                                       </tr>
                       </table>
                                                                       
                       </div>
                                                                       <div class="col-lg-2 login-right">
						<a href="cancel.jsp?action=<%=str[r][1]%>"><input type="submit" value="Delete Order"></a>
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