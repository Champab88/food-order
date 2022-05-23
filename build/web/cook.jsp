<%-- 
    Document   : orders-list
    Created on : Jul 26, 2016, 7:29:47 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<% 
//    response.setHeader("Cache-Control", "no-cache");
//    response.setHeader("Cache-Control", "no-store");
//    response.setDateHeader("Expires", 0);
//    response.setHeader("Pragma", "no-cache");
//    
//    String m=(String)session.getAttribute("admin");
//        if(m==null||!m.equals("cook"))
//        {
//            session.setAttribute("msg0", "Please login with administrator credentials to access this page.");
//            RequestDispatcher rd=request.getRequestDispatcher("adminlogin.jsp");
//            rd.forward(request, response);
//        } 
//       

        %>
<%
    Class.forName("com.mysql.jdbc.Driver");
 Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/onlinefood", "root", "root");
    Statement st=con.createStatement();
    ResultSet rs=null;
    
    int[] no=new int[20];
    String items="";
    char ch2;
    String[][] str=new String[20][100];
    int y=1;
    
    rs=st.executeQuery("select * from orderdata order by ordertime asc");
    while(rs.next())
    {
        //str[y][1]="";
        str[y][1]=rs.getString(4);
        str[y][2]=rs.getString(1);
        str[y][3]=rs.getString(3);
        
        y++;
    }
    int l=1;
    for(int a=1;a<y;a++)
    {
        
    rs=st.executeQuery("select * from orderdata where oid='"+str[a][1]+"'");
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
        }
    }
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
                             <div class="cart-sec" style="margin-bottom:200px;margin-top: 50px;">
       
	<div class="">
	<div class="container">
                <div>
                    <h2>All Orders:</h2><br/>
                    <%for(int n=1;n<y;n++){%>
                <div class="col-lg-2"  style="margin: 5px; background-color: white;padding: 5px; width: 215px;height: 400px;" >
                    <h4><%=n%>. Order ID: <span style="color: #E24425"><%= str[n][1]%> </span></h4>
                    <br/>
                    <span>
                        <h5><b>Email:</b> <%=str[n][2]%></h5>
                        <h5><b>Order date:</b> <%=str[n][3]%></h5><br/>
                        <div class="">
                       <table class="table table-condensed">
                           <tr>
                                                <th>Items:</th>
                           </tr>
                         <%
                                                           for(int k=1;k<=no[n];k++)
                                                                         {
                                                                             out.println("<tr>");
                                                                             
                                                                             out.println("<td>");
                                                                             out.println(str[n][k+3]);
                                                                            out.println("</td>");
                                                                            
                                                                            out.println("</tr>");
                                                                         }
    
                                                                       %>
                       </table>
                        </div>
                    </span>
                </div><%}%>
                
         </div>
        </div></div>
                             </div>
                
        <%@include file="footer.jsp" %>
      
</body>
</html>