<%-- 
    Document   : process
    Created on : Aug 3, 2016, 9:11:04 AM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
       String m=(String)session.getAttribute("email");
        if(m!=null)
        {
            response.sendRedirect("order.jsp");
        }
        else
        {
            response.sendRedirect("loginfirst.jsp");
        }
        %>