<%-- 
    Document   : recover
    Created on : Sep 16, 2016, 8:23:42 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<%  
    RequestDispatcher rd;
    String email=request.getParameter("eid");
    String pwd=request.getParameter("pwd");
    Class.forName("oracle.jdbc.OracleDriver");
    Connection con=DriverManager.getConnection("jdbc:oracle:thin:LOCAL/1234@localhost:1521:XE");
    
        
    Statement st=con.createStatement();
    ResultSet rs=null;
    String pw="";
   // if("forgot".equals(str))
            
                rs=st.executeQuery("select * from register where eid='"+email+"' and phno='"+pwd+"'");
                if(rs.next())
                {
                    pw=rs.getString(4);
                    out.println(pw);
    
                   // pw="Your password is "+pw;
                  //   response.sendRedirect("forgot.jsp");
                  
            
                }
                else
                {
                  //  response.sendRedirect("forgot.jsp");
            
                }
            
    //else
    {
        
    }
    

%>
