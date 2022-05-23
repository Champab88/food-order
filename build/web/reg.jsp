<%-- 
    Document   : reg
    Created on : Jul 27, 2016, 8:32:26 PM
    Author     : DELL
--%>

<%@page import="com.mailsend.Mail"%>
<%@page import="java.util.Random"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%
    Statement st=null;
       Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/onlinefood", "root", "root");
    st=con.createStatement();
    
    String str=request.getParameter("action");
    String id1="";
    out.println("sr"+str);
    if("admin".equals(str))
    {
        
        String id=request.getParameter("id");
        String pass=request.getParameter("pwd");
        String cfmpass=request.getParameter("email");
//        Random n = new Random();
//		int secretkey = n.nextInt(2500);
//		String secret = "" + secretkey;
//                out.println("opt is "+secret);
         out.println("srsdgfds"+id);
        ResultSet rs=st.executeQuery("select id from admins where id='"+id+"'");
        if(rs.next())
        {
            id1=rs.getString(1);
            session.setAttribute("msg6", "Username not available.");
        if(!pass.equals(cfmpass))
        {
        session.setAttribute("msg4", "Password don't match.");
         }
            response.sendRedirect("adminsignup.jsp");
            
        }
    
    else
    {
        
        int i=st.executeUpdate("insert into admins values('"+id+"','"+pass+"','"+cfmpass+"')");
        out.println("srsdgfds"+i);
        if(i>0)
        {
            out.println("srsdgfds"+id1);
            //out.println("srsdgfds"+i);
         session.setAttribute("admin", id);
         out.println("sddsrsdgfds"+id);
            if(str.equals("admin"))
            {
             response.sendRedirect("users.jsp");
            }
            else if("cook".equals(str))
            {
                 response.sendRedirect("cook.jsp");
                     
            }
         }
        else
        {
             response.sendRedirect("adminsignup.jsp");
        }
    }
    }
    else
    {
    
    String fnam=request.getParameter("fname");
    String lnam=request.getParameter("lname");
    String phno=request.getParameter("phno");
    String email12=request.getParameter("eid");
    String pass=request.getParameter("pwd");
    String cfmpass=request.getParameter("email");
     Random n = new Random();
		int secretkey = n.nextInt(2500);
		String secret = "" + secretkey;
                out.println("opt is "+secret);
    String msg4,msg6,mg=null;
    session.setAttribute("mg", email12);
    ResultSet rs=st.executeQuery("select eid from register where eid='"+email12+"'");
    if(rs.next())
        {
            session.setAttribute("msg6", "Username not available.");
            if(!pass.equals(cfmpass))
    {
        session.setAttribute("msg4", "Password don't match.");
    }
            response.sendRedirect("register.jsp");
            
        }
    
    
    else
    {
        new Mail(email12,secret);
    int i=st.executeUpdate("insert into register values('"+fnam+"','"+lnam+"','"+email12+"','"+pass+"','"+cfmpass+"','"+phno+"','"+secret+"')");
    
    if(i>0)
    {
        
       session.setAttribute("email", email12);
      
        out.println(" Confirmed Successfully");
        
         out.println("Cinfirmation mail Sent to your Mail id.");
         
        response.sendRedirect("index.jsp");
    }
    else
    {
        response.sendRedirect("register.jsp");
    }
    }
    }
    con.close();
   // session.invalidate();
%>
    