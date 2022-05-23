<%-- 
    Document   : login
    Created on : Jul 26, 2016, 7:27:09 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
    
    <%@include file="head.jsp" %>
    <script>
        function forgot(str1,str2)
        {
            var xhttp=new XMLHttpRequest();
            xhttp.onreadystatechange = function() {
    if (xhttp.readyState == 4 && xhttp.status == 200) {
      
            document.getElementById("pw").innerHTML=xhttp.responseText;
        }
    };
            xhttp.open("GET","recover.jsp?eid="+str1+"&pwd="+str2,true);
            xhttp.send();
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
                       Forget
                    </li>
                    
                </ul>
                <ul class="previous">
                    
                	<li><a href="index.jsp">Back to Previous Page</a></li>
                </ul>
               	   </div>
			   <div class="account_grid">
                              <div class="col-md-6 login-right wow fadeInRight" data-wow-delay="0.4s">
			  	<h3>Forget your password</h3>
				<p>Please enter your:</p>
                                <form action="">
                                 
				  <div>
					<span>Username<label>*</label></span>
                                        <input id="eid" type="text" required="required"
                                               name="eid"> 
				  </div>
				  <div>
					<span>Phone Number<label>*</label></span>
                                        <input id="pwd"type="text" name="pwd" required="required" minlength="10"> 
                                    </div>
                                     </form>
                                      <p>Your Password: <span id="pw"></span></p>
                                                                     <div class="login-right">
						
					
                                                                         <input type="submit"  value="Recover password"name="submit" onclick="forgot(eid.value,pwd.value)">
                                                                     </div>
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