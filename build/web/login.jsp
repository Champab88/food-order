<%-- 
    Document   : login
    Created on : Jul 26, 2016, 7:27:09 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% String str=request.getParameter("action");%>
<html>
<head>
    
    <%@include file="head.jsp" %>
    <style>
        @media print {
    .print {
        background-color: white;
        height: 100%;
        width: 100%;
        position: fixed;
        top: 0;
        left: 0;
        margin: 0;
        padding: 15px;
        font-size: 14px;
        line-height: 18px;
    }
}
    </style>
    <script>
        function valid()
        {
            var x=document.getElementById("eid").value;
            if(x==null)
            {
                document.getElementById("div").innerHTML="Required";
            }
        }
    </script>
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
                    <span style=" color: red;text-align: center"><h3>
             <% 
                                              String msg0=(String)session.getAttribute("msg0");
                                            if(msg0!=null)
                                              {
                                                  out.println(msg0);
                                              }
                                            session.removeAttribute("msg0");
                                          %>
                            </h3> </span>
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
			   <div class="account_grid">
                              <div class="col-md-6 login-right wow fadeInRight" data-wow-delay="0.4s">
			  	<h3>REGISTERED CUSTOMERS</h3>
				<p>If you have an account with us, please log in.</p>
                                <form action="log.jsp?action=<%=str%>" method="post">
                                 
				  <div>
					<span>Username<label>*</label></span>
                                        <input id="eid" type="text" 
                                               name="eid" onsubmit="valid()"> 
                                        <p id="div"></p>
				  </div>
				  <div>
					<span>Password<label>*</label></span>
                                        <input id="pwd" type="password" required="required"
                                               name="pwd"> 
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
                                      <a class="forgot" href="forgot.jsp">Forgot Your Password?</a>
                                  <input type="submit" value="Login" name="submit">
			    </form>
			   </div>	

			   <div id="print" class="col-md-6 login-right wow fadeInLeft" data-wow-delay="0.4s">
			  	 <h3>NEW CUSTOMERS</h3>
				 <p>By creating an account with our store, you will be able to move through the checkout process faster, store multiple shipping addresses, view and track your orders in your account and more.</p>
				 <a class="acount-btn" href="register.jsp">Create an Account</a>
			   </div>
			   <div class="clearfix"> </div>
			 </div>
		   </div>
</div>
<div class="clearfix"></div>
</div>
	<!-- content-section-ends -->
	<!-- footer-section-starts -->
        <%@include file="footer.jsp" %>
</body>
</html>