<%-- 
    Document   : adminlogin
    Created on : Sep 5, 2016, 6:43:55 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
    
    <%@include file="head.jsp" %>	
</head>
<body>    <!-- header-section-starts -->
    <%@include file="nav.jsp" %>
	<!-- header-section-ends -->
	<!-- content-section-starts -->
        <div>
            
        </div>
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
                       Login
                    </li>
                    
                </ul>
                <ul class="previous">
                    
                	<li><a href="index.jsp">Back to Previous Page</a></li>
                </ul>
                <div class="clearfix"></div>
			   </div>
			   <div class="col-md-6 login-right wow fadeInRight" data-wow-delay="0.4s">
			  	<h3>Administrator Login</h3>
				<form action="log.jsp" method="post">
                                    <%-- --%>
				  <div>
					<span>ID<label>*</label></span>
                                        <input type="text" required="required"
                                               name="eid"> 
				  </div>
				  <div>
					<span>Password<label>*</label></span>
                                        <input type="password" required="required"
                                               name="pwd"> 
				  </div>
                                  <div>
					<span>Type<label>*</label></span>
                                        <select name="action">
                                            <option value="admin">Admin</option>
                                            <option value="cook">Cook</option>
                                        </select> 
				  </div>
                                  <div>
                                      
                                      <span style="color: red">
                                          <% 
                                              String msg=(String)session.getAttribute("msg");
                                            if(msg!=null)
                                              {
                                                  out.println(msg);
                                              }
                                            session.removeAttribute("msg");
                                          %>
                                      </span>
                                  </div>
                                  <input type="submit" value="Login" name="submit">
			    </form>
			   </div>
                           <div class="col-md-6 login-right wow fadeInLeft" data-wow-delay="0.4s">
			  	 <h3>Not Registered</h3>
				 <a class="acount-btn" href="adminsignup.jsp">Register here</a>
			   </div>

			   <div class="clearfix"> </div>
			 </div>
		   </div>
</div>
                                      
	<!-- content-section-ends -->
	<!-- footer-section-starts -->
        <%@include file="footer.jsp" %>
</body>
</html>