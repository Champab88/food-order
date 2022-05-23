<%-- 
    Document   : orders-list
    Created on : Jul 26, 2016, 7:29:47 PM
    Author     : DELL
--%>

<%@page import="java.util.StringTokenizer"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.mailsend.Mail"%>
<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
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
                    <h2>Your Food Order details:</h2>
                    <%!

        String oid="";
        String fprice="";
        String cname="";
        String ddate="";
        String status="confirmed";
        String msgdata="";
        String sdate="";
         String emailid="";

%>
<%
    try
    {
        
    Statement st=null;
    Statement st1=null;
    String eid=(String)session.getAttribute("admin");
    String str=request.getParameter("action");
    sdate=str;
    //out.println("sdate :"+sdate);
    StringTokenizer ssdata=new StringTokenizer(sdate," ");
    while(ssdata.hasMoreTokens())
    {
        oid=ssdata.nextToken();
        fprice=ssdata.nextToken();
        cname=ssdata.nextToken();
       
                                        
    }
//    out.println("oid :"+oid);
//     out.println("fprice:"+fprice);
//      out.println("cname :"+cname);
     
    
    msgdata="Hello "+" "+cname+" "+"Your Food Order Id is:"+" "+oid+" "+" Total Bill Is:"+fprice+" "+"Confirmed .";
   // out.println("eid"+eid);
   // out.println(str);
     Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/onlinefood", "root", "root");
    st1=con.createStatement();
    String iQuery1="select * from register where fname='"+cname+"'";
    ResultSet rs1=st1.executeQuery(iQuery1);
    while(rs1.next())
    {
       emailid=rs1.getString(5); 
    }
    
    
    %>
    <br><br>
    <h3>
    <table border="3px">
    <tr>
        
        <th>Food Id</th>
        <th>Customer Name</th>
        <th>Email:</th>
        <th>Total Bill</th>
        <th>Status</th>
    </tr>
    <tr>
        <td><%=oid%></td>
         <td><%=cname%></td>
         <td><%=emailid%></td>
          <td><%=fprice%></td>
           <td><%=status%></td>
    </tr>
</table></h3><br><br>
    <%
    
    
    st=con.createStatement();
    String iQuery="insert into confirmfoodorder values('"+cname+"','"+oid+"','"+status+"','"+fprice+"','"+status+"')";
    int ii=st.executeUpdate(iQuery);
    if(ii>0)
    {
        out.println("<h1>");
        out.println("Order Confirmed Successfully");
        new Mail(emailid,msgdata); //mail
         out.println("Cinfirmation mail Sent to your Mail id.");
         out.println("</h1>");
    }else
    {
          out.println("<h1>");
          out.println("Order Confirmation Failed");
         out.println("</h1>");
    }
    }catch(Exception e)
    {
        out.println(e);
    }
    
    
   
    
    
    
%>

         </div>
        </div></div><br><br><br><br>
                             </div>
                
        <%@include file="footer.jsp" %>
      
</body>
</html>