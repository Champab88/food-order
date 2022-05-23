<%-- 
    Document   : nav
    Created on : Jul 28, 2016, 4:58:02 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- header-section-starts -->
	<div class="header">
		<div class="container">
			<div class="top-header">
                            <div class="logo">
                                    <a href="index.jsp"><img src="images/fd11.jpg" width="240" height="90"  class="img-responsive" alt="" /></a>
				</div>
				<div class="queries">
					<p>
                                            <label></label></p>
				</div>
				<div class="header-right">
						<div class="cart box_1">
                                                    <span>
                                                         <% 
                                              String txt=(String)session.getAttribute("admin");
                                            if("admin".equals(txt)&&txt!=null||"cook".equals(txt))
                                            {}else{%>
                                           
							<a href="checkout.jsp">
								<h3><img src="images/bag.png" alt=""></h3>
							</a>
                                            <%}%>
							<div class="clearfix"> </div>
						</div>
					</div>
				<div class="clearfix"></div>
			</div>
		</div>
			<div class="menu-bar">
			<div class="container">
				<div class="top-menu">
					<ul>
                                            <li class="active"><a href="index.jsp">Home</a></li>| 
                                            <span style="margin-left: 5px;">
                                            <% 
                                            if("admin".equals(txt)&&txt!=null)
                                            {%>
                                             <li><a href="users.jsp">Users</a></li>|
						<li><a href="allorders.jsp">Orders</a></li>|
                                           
                                                    <%}else
                                                    if("cook".equals(txt)&&txt!=null)
                                            {%>
                                            <li><a href="cook.jsp">Orders</a></li>|
                                               <%}else{%>
                                                <li><a href="menu.jsp">Order</a></li>|
						<li><a href="contact.jsp">contact</a></li>|
                                                <%}%>

                                                 </span>
                                               <div class="clearfix"></div>
					</ul>
				</div>
				<div class="login-section">
					<ul>
                                            <span style="color: #E24425">
                                                    <% if((session.getAttribute("admin")=="")||
                                                            (session.getAttribute("admin")==null)){%>
                                                    
                                            <li>
                                                <span style="color: #E24425">
                                                    <% if((session.getAttribute("email")=="")||
                                                            (session.getAttribute("email")==null)){%>
                                                    <a href="login.jsp">Login</a>
                                                     </li> |
						<li><a href="register.jsp">Sign Up</a> </li> |
                                                <li><a href="adminlogin.jsp">Admin Login</a>
                                           
                                                    <%}else{%>
                                                    Welcome, <%= session.getAttribute("email")%>
                                                    <li><a href="logout.jsp">Logout</a></li> 
                                                    <%}%> 
                                                </span>
                                                    <%}else{%>
                                                    Welcome, <%= session.getAttribute("admin")%>
                                                    <li><a href="logout.jsp">Logout</a></li> 
                                                    <%}%> 
                                                </span>
                                             </li> |
						<div class="clearfix"></div>
					</ul>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
		
	</div>
	<!-- header-section-ends -->