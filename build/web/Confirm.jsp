<%-- 
    Document   : cancel
    Created on : Aug 3, 2016, 8:23:12 AM
    Author     : DELL
--%>

<%@page import="com.mailsend.Mail"%>
<%@page import="java.util.StringTokenizer"%>
<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
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
    out.println("sdate :"+sdate);
    StringTokenizer ssdata=new StringTokenizer(sdate," ");
    while(ssdata.hasMoreTokens())
    {
        oid=ssdata.nextToken();
        fprice=ssdata.nextToken();
        cname=ssdata.nextToken();
       
                                        
    }
    out.println("oid :"+oid);
     out.println("fprice:"+fprice);
      out.println("cname :"+cname);
     
    
    msgdata="Hello "+" "+cname+" "+"Your Food Order Id is:"+" "+oid+" "+" Total Bill Is:"+fprice+" "+"Confirmed .";
   // out.println("eid"+eid);
    out.println(str);
     Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/onlinefood", "root", "root");
    st1=con.createStatement();
    String iQuery1="select * from register where fname='"+cname+"'";
    ResultSet rs1=st1.executeQuery(iQuery1);
    while(rs1.next())
    {
       emailid=rs1.getString(5); 
    }
    
    
    
    
    
    st=con.createStatement();
    String iQuery="insert into confirmfoodorder values('"+cname+"','"+oid+"','"+status+"','"+fprice+"','"+status+"')";
    int ii=st.executeUpdate(iQuery);
    if(ii>0)
    {
        out.println("<h1>");
        out.println("Order Confirmed Successfully");
        new Mail(emailid,msgdata);
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