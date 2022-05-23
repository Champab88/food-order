<%-- 
    Document   : orders-list
    Created on : Jul 26, 2016, 7:29:47 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<% 
    response.setHeader("Cache-Control", "no-cache");
    response.setHeader("Cache-Control", "no-store");
    response.setDateHeader("Expires", 0);
    response.setHeader("Pragma", "no-cache");
    
    String m=(String)session.getAttribute("email");
        if(m==null)
        {
            session.setAttribute("msg0", "Please login first.");
           // RequestDispatcher rd=request.getRequestDispatcher("login.jsp");
            //rd.forward(request, response);
            response.sendRedirect("login.jsp?action=cuisines");
        }
        %>

<!DOCTYPE html>
<html>
    <head>
        <%@include file="head.jsp" %>
    </head>
<body>
    <!-- header-section-starts -->
    <%@include file="nav.jsp" %>

	<!-- header-section-ends -->
	<!-- content-section-starts -->
        <div>
                           <span style=" color: red;text-align: center"><h3>
             <% 
                                              String msg0=(String)session.getAttribute("value");
                                            if(msg0!=null)
                                              {
                                                  out.println(msg0);
                                              }
                                            session.removeAttribute("value");
                                          %>
                            </h3> </span>
		       </div>
	<div class="orders">
	<div class="container">
            <form method="post" action="orderlist.jsp" class="">
                <div>
                <div class="col-lg-6" style="padding: 15px">
                    <h3>Pizzas</h3>
                    <br/>
                       <table class="table">
                           
                        <tr>
                                <th>Items</th>
                                <th>Price($)</th>
                                <th>Pick Item</th>
                        </tr>
                    
                        <tr>
                            <td>Cheese & Basil Pizza</td>
                            <td>160</td>
                            <td><input type="checkbox" value="a" name="ord"></td>
                        </tr>
                        <tr>
                            <td>Vegetable Pizza</td>
                            <td>180</td>
                            <td><input type="checkbox" value="b" name="ord"></td>
                        </tr>
                        <tr>
                            <td>Chicken Pizza</td>
                            <td>250</td>
                            <td><input type="checkbox" value="c" name="ord"></td>
                        </tr>
                         
                       </table>
                </div>
                
                <div class="col-lg-6" style="padding: 15px">
                    <h3>Burgers</h3>
                    <br/>
                       <table class="table">
                           
                        <tr>
                                <th>Items</th>
                                <th>Price($)</th>
                                <th>Pick Item</th>
                        </tr>
                    
                        <tr>
                            <td>Vegetable Burger</td>
                            <td>140</td>
                            <td><input type="checkbox" value="d" name="ord"></td>
                        </tr>
                        <tr>
                            <td>Cheese Burger</td>
                            <td>70</td>
                            <td><input type="checkbox" value="e" name="ord"></td>
                        </tr>
                        <tr>
                            <td>Chicken Burger</td>
                            <td>160</td>
                            <td><input type="checkbox" value="f" name="ord"></td>
                        </tr>
                         
                       </table>
                </div>
                </div>
                
                <div>
                <div class="col-lg-6" style="padding: 15px">
                    <h3>Cold Beverages</h3>
                    <br/>
                       <table class="table">
                           
                        <tr>
                                <th>Items</th>
                                <th>Price($)</th>
                                <th>Pick Item</th>
                        </tr>
                    
                        <tr>
                            <td>Strawberry Milk Shake</td>
                            <td>50</td>
                            <td><input type="checkbox" value="g" name="ord"></td>
                        </tr>
                        <tr>
                            <td>Chocolate Milk Shake</td>
                            <td>80</td>
                            <td><input type="checkbox" value="h" name="ord"></td>
                        </tr>
                         
                       </table>
                </div>
                
                <div class="col-lg-6" style="padding: 15px">
                    <h3>Ice Creams</h3>
                    <br/>
                       <table class="table">
                           
                        <tr>
                                <th>Items</th>
                                <th>Price($)</th>
                                <th>Pick Item</th>
                        </tr>
                    
                        <tr>
                            <td>Butter Scotch</td>
                            <td>40</td>
                            <td><input type="checkbox" value="i" name="ord"></td>
                        </tr>
                        <tr>
                            <td>Chocolate with Orange</td>
                            <td>170</td>
                            <td><input type="checkbox" value="j" name="ord"></td>
                        </tr>
                         
                       </table>
                </div>
                   
                    <div>
                <div class="col-lg-6" style="padding: 15px">
                    <h3>Starters</h3>
                    <br/>
                       <table class="table">
                           
                        <tr>
                                <th>Items</th>
                                <th>Price($)</th>
                                <th>Pick Item</th>
                        </tr>
                    
                        <tr>
                            <td>Tandoori Paneer Tikka</td>
                            <td>220</td>
                            <td><input type="checkbox" value="k" name="ord"></td>
                        </tr>
                        <tr>
                            <td>Chilly Paneer Dry</td>
                            <td>150</td>
                            <td><input type="checkbox" value="l" name="ord"></td>
                        </tr>
                         
                       </table>
                </div>
                        
                        <div>
                <div class="col-lg-6" style="padding: 15px">
                    <h3>South-Indian</h3>
                    <br/>
                       <table class="table">
                           
                        <tr>
                                <th>Items</th>
                                <th>Price($)</th>
                                <th>Pick Item</th>
                        </tr>
                    
                        <tr>
                            <td>Rice Idli</td>
                            <td>80</td>
                            <td><input type="checkbox" value="m" name="ord"></td>
                        </tr>
                        <tr>
                            <td>Sambhar Vada</td>
                            <td>85</td>
                            <td><input type="checkbox" value="n" name="ord"></td>
                        </tr>
                         
                       </table>
                </div>
                            
                            
                            <div>
                <div class="col-lg-6" style="padding: 15px">
                    <h3>Rice</h3>
                    <br/>
                       <table class="table">
                           
                        <tr>
                                <th>Items</th>
                                <th>Price($)</th>
                                <th>Pick Item</th>
                        </tr>
                    
                        <tr>
                            <td>Sambhar Rice</td>
                            <td>$15</td>
                            <td><input type="checkbox" value="o" name="ord"></td>
                        </tr>
                        <tr>
                            <td>Curd Rice</td>
                            <td>$20</td>
                            <td><input type="checkbox" value="p" name="ord"></td>
                        </tr>
                        
                        <tr>
                            <td>Veg. Fried Rice</td>
                            <td>160</td>
                            <td><input type="checkbox" value="y" name="ord"></td>
                        </tr>
                        
                        <tr>
                            <td>Chilly Garlic Rice</td>
                            <td>120</td>
                            <td><input type="checkbox" value="z" name="ord"></td>
                        </tr>
                         
                       </table>
                </div>
                                
                                <div>
                <div class="col-lg-6" style="padding: 15px">
                    <h3>Breads</h3>
                    <br/>
                       <table class="table">
                           
                        <tr>
                                <th>Items</th>
                                <th>Price($)</th>
                                <th>Pick Item</th>
                        </tr>
                    
                        <tr>
                            <td>Tandoori Roti</td>
                            <td>40</td>
                            <td><input type="checkbox" value="q" name="ord"></td>
                        </tr>
                        <tr>
                            <td>Butter Naan</td>
                            <td>60</td>
                            <td><input type="checkbox" value="r" name="ord"></td>
                        </tr>
                         
                       </table>
                </div>
                                    
                                    <div>
                <div class="col-lg-6" style="padding: 15px">
                    <h3>North Indian</h3>
                    <br/>
                       <table class="table">
                           
                        <tr>
                                <th>Items</th>
                                <th>Price($)</th>
                                <th>Pick Item</th>
                        </tr>
                    
                        <tr>
                            <td>Thali Regular</td>
                            <td>190</td>
                            <td><input type="checkbox" value="s" name="ord"></td>
                        </tr>
                        <tr>
                            <td>Thali Special</td>
                            <td>280</td>
                            <td><input type="checkbox" value="u" name="ord"></td>
                        </tr>
                         
                       </table>
                </div>
                                        
                                                      <div>
                <div class="col-lg-6" style="padding: 15px">
                    <h3>Main Course</h3>
                    <br/>
                       <table class="table">
                           
                        <tr>
                                <th>Items</th>
                                <th>Price($)</th>
                                <th>Pick Item</th>
                        </tr>
                    
                        <tr>
                            <td>Chilly Paneer Gravy </td>
                            <td>150</td>
                            <td><input type="checkbox" value="v" name="ord"></td>
                        </tr>
                        <tr>
                            <td>Shreded Potatoes in Hot Garlic </td>
                            <td>240</td>
                            <td><input type="checkbox" value="w" name="ord"></td>
                        </tr>
                        <tr>
                            <td>Manchurian Gravy </td>
                            <td>160</td>
                            <td><input type="checkbox" value="x" name="ord"></td>
                        </tr>
                         
                       </table>
                </div>
                    
                </div>
                
                                                                   
	        <div class="clearfix"></div>
  
                <div class="form_details">
                    <div class="clearfix"></div>
                    <input type="submit" value="Proceed to Checkout" class="">
                    <input type="reset" value="Reset" class="">
                <div class="clearfix"></div>
                </div>
            </form>
	</div>
</div>
        <%@include file="footer.jsp" %>
</body>
</html>