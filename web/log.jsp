<%-- 
    Document   : log
    Created on : Jul 28, 2016, 10:29:05 AM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%!
String email="";
String pwd="";
String str="";
%>
<%
     RequestDispatcher rd;
     email=request.getParameter("eid");
     pwd=request.getParameter("pwd");
     str=request.getParameter("action");
    System.out.println("request is:"+str);
    try{
        
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/onlinefood", "root", "root");
        
    Statement st=con.createStatement();
    ResultSet rs=null;
    if(str.equals("admin") || str.equals("cook"))
    {
    rs=st.executeQuery("select * from admins where id='"+email+"' and password='"+pwd+"'");
    if(rs.next())
    {
            session.setAttribute("admin", email);
            
            if("admin".equals(str))
            {
           
           
             response.sendRedirect("users.jsp");
            }
            else if("cook".equals(str))
            {
                 response.sendRedirect("cook.jsp");
                     
            } else{
                response.sendRedirect("adminlogin.jsp");
            }
    }
    else
    {
          session.setAttribute("msg", "Invalid Admin credentials");
          rd=request.getRequestDispatcher("adminlogin.jsp");
             rd.forward(request, response);
    }
    }
    else if(str.equals("forgot"))
            {
                rs=st.executeQuery("select * from register where eid='"+email+"' and phno='"+pwd+"'");
                if(rs.next())
                {
                    String pw=rs.getString(4);
                    pw="Your password is "+pw;
                    session.setAttribute("ms", pw);
                     response.sendRedirect("forgot.jsp");
            
                }
                else
                {
                    response.sendRedirect("forgot.jsp");
            
                }
            }
    else 
    {
    rs=st.executeQuery("select * from register where eid='"+email+"' and password='"+pwd+"'");
    if(rs.next())
    {
        
        session.setAttribute("pwd", pwd);
        
            session.setAttribute("email", email);
            
            if(str.equals("order"))
            {
                response.sendRedirect("menu.jsp");
            }
            else if(str.equals("checkout"))
            {
                response.sendRedirect("checkout.jsp");
            }
            else if(str.equals("cuisines"))
            {
                response.sendRedirect("menu.jsp");
            }
            else
            {
                response.sendRedirect("index.jsp");
            }
            
        
    }
   
    else
        {
       
        
        session.setAttribute("msg", "Invalid Email or password");
             rd=request.getRequestDispatcher("login.jsp");
             rd.forward(request, response);
             
       }
    }
    con.close();
        
        
    }catch(Exception e)
    {
        out.println(e);
    }
    
    
%>