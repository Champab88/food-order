<%-- 
    Document   : register
    Created on : Jul 26, 2016, 7:27:27 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!--
Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE html>
<html>
    <head>
        <%@include file="head.jsp" %>
    </head>
<body>
    <!-- header-section-starts -->
    <%@include file="nav.jsp" %>	<!-- header-section-ends -->
	<!-- content-section-starts -->
        	<div class="content">
	<div class="container">
		<div class="login-page">
                    	    <div class="dreamcrub">
			   	 <ul class="breadcrumbs">
                    <li class="home">
                       <a href="index.jsp" title="Go to Home Page">Home</a>&nbsp;
                       <span>&gt;</span>
                    </li>
                    <li class="women">
                       Register
                    </li>
                    
                </ul>
                <ul class="previous">
                    
                	<li><a href="index.jsp">Back to Previous Page</a></li>
                </ul>
                
			   </div>
          			   <div class="col-md-6 login-right wow fadeInRight" data-wow-delay="0.4s">
			  	<h3>Administrator Registeration</h3>
				<form action="reg.jsp?action=admin" method="post">
                                    <%-- --%>
				  <div>
					<span>ID<label>*</label></span>
                                        <input type="text" required="required"
                                               name="id"> 
				  </div>
				  <div>
					<span>Password<label>*</label></span>
                                        <input type="password" required="required"
                                               name="pwd"> 
				  </div>
                                  <div>
					<span>Confirm Password<label>*</label></span>
                                        <input type="password" required="required"
                                               name="cfmpwd"> 
				  </div>
                                  <div>
                                              <span style="color: red">
                                          <% 
                                              String msg5=(String)session.getAttribute("msg4");
                                              if(msg5!=null)
                                              {
                                                  out.println(msg5);
                                              }
                                              session.removeAttribute("msg4");
                                              %>
                                                         </span>
                                                         <span style="color: red">
                                              <%
                                              String msg7=(String)session.getAttribute("msg6");
                                              if(msg7!=null)
                                              {
                                                  out.println(msg7);
                                              }
                                              session.removeAttribute("msg6");
                                              %>
                                      </span>
                                                   
                                  </div>
                                     <input type="submit" value="register" name="submit">
                                     <input type="reset" value="reset" name="submit">
			    </form>
			   </div>
     
			   <div class="clearfix"> </div>
			 </div>
		   </div>
</div>
                         
<div class="clearfix"></div>
<%@include file="footer.jsp" %>
</body>
</html>