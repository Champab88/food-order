<%-- 
    Document   : orderlist
    Created on : Jul 30, 2016, 8:50:38 PM
    Author     : DELL
--%>


<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*,java.util.Random"%>
<%
    String[] val=request.getParameterValues("ord");
    if(val==null)
    {
       response.sendRedirect("menu.jsp");
       session.setAttribute("value", "No item selected");
         
    }
    else
    {
    String y=(String)session.getAttribute("email");
    String s = "";
        double d;
        for (int i = 1; i <= 5; i++) {
            d = Math.random() * 10;
            s = s + ((int)d);
            if (i % 2 == 0 && i != 5) {
                s = s;
            }
        }
    String str="";
    String dt=new java.util.Date().toLocaleString();
    for(int x=0;x<val.length;x++)
    {
    str=str+val[x];
    }
   // out.println(str);
    
    
    
        Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/onlinefood", "root", "root");
    Statement st=con.createStatement();
    int i=st.executeUpdate("insert into orderdata values('"+y+"','"+str+"','"+dt+"','"+s+"')");
    if(i>0)
    {
        response.sendRedirect("order.jsp");
        session.setAttribute("oid", s);
        
  
    }
    
   con.close();
    }
%>