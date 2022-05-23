<%-- 
    Document   : contact
    Created on : Jul 26, 2016, 7:29:08 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
    <head>
        <%@include file="head.jsp" %>
    </head>
<body>
    <!-- header-section-starts -->
    <%@include file="nav.jsp" %>
	<!-- header-section-ends -->
	<div class="contact-section-page">
		<div class="contact-head">
		    <div class="container">
				<h3>Contact</h3>
				<p>Home/Contact</p>
			</div>
                    
		</div>
            <span style=" color: red;text-align: center"><h3>
             <% 
                                              String msg0=(String)session.getAttribute("scs");
                                        
                                              if(msg0!=null)
                                              {
                                                  out.println(msg0);
                                              }
                                            session.removeAttribute("scs");
                                          %>
                            </h3> </span>
	
            
		<div class="contact_top">
			 		<div class="container">
			 			<div class="col-md-6 contact_left wow fadeInRight" data-wow-delay="0.4s">
			 				<h4>Contact Form</h4>
			 				<form action="cont.jsp" method="post">
								 <div class="form_details">
					                 		 <input name="sub" type="text" class="text" value="Subject" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Subject';}">
									 <textarea name="msg" value="Message" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Message';}">Message</textarea>
									 <div class="clearfix"> </div>
									 <div class="sub-button wow swing animated" data-wow-delay= "0.4s">
									 	<input name="submit" type="submit" value="Send message">
									 </div>
						          </div>
						       </form>
					        </div>
					        <div class="col-md-6 company-right wow fadeInLeft" data-wow-delay="0.4s">
					        	<div class="contact-map">
		<!--	<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d1578265.0941403757!2d-98.9828708842255!3d39.41170802696131!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x54eab584e432360b%3A0x1c3bb99243deb742!2sUnited+States!5e0!3m2!1sen!2sin!4v1407515822047"> </iframe> -->
		</div>
      
	  <div class="company-right">
					        	<div class="company_ad">
							     		<h3>Contact Info</h3>
							     		<span>knowx innovation pvt ltd</span>
			      						<address>
											 <p>email:<a href="mail-to:  Info@KnowxIndia.com"> Info@KnowxIndia.com</a></p>
											 <p>phone:  +91(80) 41735554 / 41735553</p>
									   		
									   		<p>#56/56, 2nd floor, Pushpagiri complex 
17th cross, 8th main,opp. water tank 
Vijayanagar, Bangalore -560040</p>
									 	 	
							   			</address>
							   		</div>
									</div>	
									
			
							
							 </div>
						</div>
					</div>

	</div>
	<!-- footer-section-starts -->
        <%@include file="footer.jsp" %>
</body>
</html>