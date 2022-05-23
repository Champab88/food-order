
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
	<div class="main">
	   <div class="container">
		  <div class="register">
                      <form action="reg.jsp" method="post">
                          	 <div class="register-top-grid">
					<h3>Enter your details:</h3>
                                        
					 <div class="wow fadeInLeft" data-wow-delay="0.2s">
						<span>First Name<label>*</label></span>
                                                <input type="text" name="fname" required="required" class="text"> 
					 </div>
                                        <div class="wow fadeInRight" data-wow-delay="0.4s">
						<span>Last Name<label>*</label></span>
						<input type="text" name="lname" required="required"> 
					 </div>
                                        <div class="wow fadeInRight" data-wow-delay="0.4s">
					<span>Phone Number<label>*</label></span>
                                        <input type="text" name="phno" required="required" minlength="10"> 
					 </div>
                                        
                                        
                                        <div class="wow fadeInRight" data-wow-delay="0.4s">
						 <span>Username<label>*</label></span>
						 <input type="text" name="eid" required="required"> 
					 </div>
					 <div class="wow fadeInLeft" data-wow-delay="0.2s">
					<span>Password<label>*</label></span>
                                         <input type="password" name="pwd" required="required">
                                        </div>
							 
                                        <div class="wow fadeInRight" data-wow-delay="0.4s">
                                        <span>Email-Id:<label>*</label></span>
                                        <input type="email" name="email" required="required" >
                                        </div>
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
                      
				<div class="clearfix"> </div>
				<div class=" login-right">
                                    
                                    <input type="submit"  value="Sign Up" name="submit" >
                            
                                        <input type="reset" value="Reset" name="submit">
                                </div>	   <div class="clearfix"> </div>
                                   
				</div>
                      </form>
		   </div>
	     </div>
	    </div>
<div class="clearfix"></div>
<%@include file="footer.jsp" %>
</body>
</html>