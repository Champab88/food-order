<%-- 
    Document   : order
    Created on : Jul 26, 2016, 7:27:44 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
    response.setHeader("Cache-Control", "no-cache");
    response.setHeader("Cache-Control", "no-store");
    response.setDateHeader("Expires", 0);
    response.setHeader("Pragma", "no-cache");
    
    String m=(String)session.getAttribute("email");
        if(m==null)
        {
            session.setAttribute("msg0", "Please login first.");
           // RequestDispatcher rd=request.getRequestDispatcher("login.jsp?action=order");
            //rd.forward(request, response);
            response.sendRedirect("login.jsp?action=order");
        }
        %>

<!DOCTYPE html>
<html>
<head>
<title> order page </title>
<link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="js/jquery.min.js"></script>
<!-- Custom Theme files -->
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<!-- Custom Theme files -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!--webfont-->
<link href='http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900,200italic,300italic,400italic,600italic,700italic,900italic' rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Lobster+Two:400,400italic,700,700italic' rel='stylesheet' type='text/css'>
<!--Animation-->
<script src="js/wow.min.js"></script>
<link href="css/animate.css" rel='stylesheet' type='text/css' />
<script>
	new WOW().init();
</script>
<script type="text/javascript" src="js/move-top.js"></script>
<script type="text/javascript" src="js/easing.js"></script>
<script type="text/javascript">
			jQuery(document).ready(function($) {
				$(".scroll").click(function(event){		
					event.preventDefault();
					$('html,body').animate({scrollTop:$(this.hash).offset().top},1200);
				});
			});
		</script>
<script src="js/jquery.carouFredSel-6.1.0-packed.js"></script>
<script src="js/tms-0.4.1.js"></script>
<script>
 $(window).load(function(){
      $('.slider')._TMS({
              show:0,
              pauseOnHover:false,
              prevBu:'.prev',
              nextBu:'.next',
              playBu:false,
              duration:800,
              preset:'fade', 
              pagination:true,//'.pagination',true,'<ul></ul>'
              pagNums:false,
              slideshow:8000,
              numStatus:false,
              banners:false,
          waitBannerAnimation:false,
        progressBar:false
      })  
      });
      
     $(window).load (
    function(){$('.carousel1').carouFredSel({auto: false,prev: '.prev',next: '.next', width: 960, items: {
      visible : {min: 1,
       max: 4
},
height: 'auto',
 width: 240,

    }, responsive: false, 
    
    scroll: 1, 
    
    mousewheel: false,
    
    swipe: {onMouse: false, onTouch: false}});
    
    
    });      

     </script>
<script src="js/jquery.easydropdown.js"></script>
<script src="js/simpleCart.min.js"> </script>
<script src="js/jquery-form-validation-min.js"></script>
<script>
    //function validate()
    {
        if(document.register.phno.value<10)
        {
            alert("Invalid phone number");
            document.register.phno.focus();
            return false;
        }
        
    }
</script>
</head>
<body>
    <!-- header-section-starts -->
		<div class="header">
		<div class="container">
			<div class="top-header">
                            <div class="logo">
                                    <a href="index.jsp"><img src="images/images (3).png" width="156" height="40"  class="img-responsive" alt="" /></a>
				</div>
				<div class="queries">
					
				</div>
				<div class="header-right">
						<div class="cart box_1">
                                                    <span>
                                                         <% 
                                              String txt=(String)session.getAttribute("admin");
                                            if("admin".equals(txt)&&txt!=null||"cook".equals(txt))
                                            {}else{%>
                                           
							<a href="checkout.jsp">
								<h3>Cart<img src="images/bag.png" alt=""></h3>
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
	<div class="order-section-page">
		<div class="ordering-form">
			<div class="container">
			<div class="order-form-head text-center wow bounceInLeft" data-wow-delay="0.4s">
											</div>
				<div class="col-md-6 order-form-grids">
                                    <form method="post" action="orderprocess.jsp">
					
					<div class="order-form-grid  wow fadeInLeft" data-wow-delay="0.4s">
						<h2>Delivery Details:</h2>
                              
                                        <input name="address"  type="text" class="text" value="Address" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Address';}"><br>
					<input name="time"  type="text" class="text" value="Time" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Time';}"><br>
					 <div class="dropdown-button">           			
                                             <select name="type" class="dropdown" tabindex="9" data-settings='{"wrapperClass":"flat"}'>
            			<option value="Cash On Delivery">Cash On Delivery</option>	
						</select>
                                         </div>
<br>
                			<div class="sub-button wow swing animated login-right" data-wow-delay= "0.2s">
                                                <input type="submit" value="Place order">
					</div>
					</div>
                                    </form>
				</div>
				
			</div>
		</div>
<div class="special-offers-section">
			<div class="container">
				<div class="special-offers-section-head text-center dotted-line">
					<h4>Special Offers</h4>
				</div>
				<div class="special-offers-section-grids">
				 <div class="m_3"><span class="middle-dotted-line"> </span> </div>
				   <div class="container">
					  <ul id="flexiselDemo3">
						<li>
							<div class="offer">
								<div class="offer-image">	
									<img src="images/p1.jpg" class="img-responsive" alt=""/>
								</div>
								<div class="offer-text">
									<h4>Olister Combo pack lorem</h4>
									<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. </p>
									<input type="button" value="Grab It">
									<span></span>
								</div>
								<div class="clearfix"></div>
							</div>
						</li>
						<li>
							<div class="offer">
								<div class="offer-image">	
									<img src="images/p2.jpg" class="img-responsive" alt=""/>
								</div>
								<div class="offer-text">
									<h4>Chicken Jumbo pack lorem</h4>
									<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. </p>
									<input type="button" value="Grab It">
									<span></span>
								</div>
								<div class="clearfix"></div>
							</div>
						</li>
						<li>
							<div class="offer">
								<div class="offer-image">	
									<img src="images/p3.jpg" class="img-responsive" alt=""/>
								</div>
								<div class="offer-text">
									<h4>Crab Combo pack lorem</h4>
									<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. </p>
									<input type="button" value="Grab It">
									<span></span>
								</div>
								
								<div class="clearfix"></div>
								</div>
						</li>
						<li>
							<div class="offer">
								<div class="offer-image">	
									<img src="images/p2.jpg" class="img-responsive" alt=""/>
								</div>
								<div class="offer-text">
									<h4>Chicken Jumbo pack lorem</h4>
									<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. </p>
									<input type="button" value="Grab It">
									<span></span>
								</div>
								
								<div class="clearfix"></div>
								</div>
					    </li>
					 </ul>
				 <script type="text/javascript">
					$(window).load(function() {
						
						$("#flexiselDemo3").flexisel({
							visibleItems: 3,
							animationSpeed: 1000,
							autoPlay: true,
							autoPlaySpeed: 3000,    		
							pauseOnHover: true,
							enableResponsiveBreakpoints: true,
							responsiveBreakpoints: { 
								portrait: { 
									changePoint:480,
									visibleItems: 1
								}, 
								landscape: { 
									changePoint:640,
									visibleItems: 2
								},
								tablet: { 
									changePoint:768,
									visibleItems: 3
								}
							}
						});
						
					});
				    </script>
				    <script type="text/javascript" src="js/jquery.flexisel.js"></script>
				</div>
			</div>
		</div>
		</div>
	</div>
	<!-- footer-section-starts -->
	<div class="footer">
		<div class="container">
			<p class="wow fadeInLeft" data-wow-delay="0.4s">&copy; 2014  All rights  Reserved | Template by &nbsp;<a href="http://w3layouts.com" target="target_blank">W3Layouts</a></p>
		</div>
	</div>
	<!-- footer-section-ends -->
	  <script type="text/javascript">
						$(document).ready(function() {
							/*
							var defaults = {
					  			containerID: 'toTop', // fading element id
								containerHoverID: 'toTopHover', // fading element hover id
								scrollSpeed: 1200,
								easingType: 'linear' 
					 		};
							*/
							
							$().UItoTop({ easingType: 'easeOutQuart' });
							
						});
					</script>
				<a href="#" id="toTop" style="display: block;"> <span id="toTopHover" style="opacity: 1;"> </span></a>

</body>
</html>