<%@ page import="java.util.*" %>
<%@ page import="com.example.jpa.entity.Order" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Ecommerce</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="/css/admindashboard.css">   
</head>
<body>

    <!-- Dashboard section starts here -->
    <div class="container">
        <div class="navigation">
            <ul>
                <li>
                	<span class="title">Admin Dashboard</span>
                </li>
                
                <li>
                    <a href="viewitem">&nbsp&nbsp&nbsp&nbsp
                        <span class="icon"><i class="fa fa-home" aria-hidden="true"></i></span>
                        <span class="title">Home</span>
                    </a>
                </li>
                
                <li>
                    <a href="addform">&nbsp&nbsp&nbsp&nbsp
                        <span class="icon"><i class="fa fa-id-card" aria-hidden="true"></i></span>
                        <span class="title">Add Product</span>
                    </a>
                </li>
                
                <li>
                    <a href="viewuser">&nbsp&nbsp&nbsp&nbsp
                        <span class="icon"><i class="fa fa-user" aria-hidden="true"></i></span>
                        <span class="title">View User</span>
                    </a>
                </li>
                
                <li>
                    <a href="viewrecord">&nbsp&nbsp&nbsp&nbsp
                        <span class="icon"><i class="fa fa-shopping-cart" aria-hidden="true"></i></span>
                        <span class="title">View Order</span>
                    </a>
                </li>
                
                <li>
                    <a href="/">&nbsp&nbsp&nbsp&nbsp
                        <span class="icon"><i class="fa fa-sign-out" aria-hidden="true"></i></span>
                        <span class="title">Log out</span>
                    </a>
                </li>
            </ul>
        </div>
        <!-- Dashboard section ends here -->

        <div class="main">
            <div class="topbar">
                <div class="toggle"></div>
                
                <div class="search">
	                <label for="html">
	                    <input type="text" placeholder="Search Here">
	                    <i class="fa fa-search" aria-hidden="true"></i>
	                </label>
                </div>
                
                <div class="user">
                    <img src="https://pic.onlinewebfonts.com/thumbnails/icons_325791.svg" style="height:30px;">
                </div>
            </div>

            <div class="details">
                <div class="recentorders">
                    <div class="cardheader">
                        <h2>Order Details</h2><br><br>
                    </div>
                    
                    <table>
                        <thead>
                            <tr>
                                <th style="text-align:center;">Order ID</th>
                                <th style="text-align:center;">Name</th>
                                <th style="text-align:center;">Phone No</th>
                                <th style="text-align:center;">Address</th>
                                <th style="text-align:center;">Prod Name</th>
                                <th style="text-align:center;">Price</th>
                            </tr>
                        </thead>
                        
                        <tbody>
                        	<%
                        		// Get the "odata" attribute from request and cast it into a List of Order objects
                        		List<Order> order=(List<Order>)request.getAttribute("odata");
           						if(order !=null && !order.isEmpty()) {
           							for(Order us:order) {
           					%>
           					<tr>
		           				<td style="text-align:center;"><%= us.getOrderId() %></td>
		           				<td style="text-align:center;"><%= us.getName() %></td>
		           				<td style="text-align:center;"><%= us.getPhno() %></td>
		           				<td style="text-align:center;"><%= us.getAddress() %></td>
		           				<td style="text-align:center;"><%= us.getProdName() %></td>
		           				<td style="text-align:center;"><%= us.getPrice() %></td>
	           				</tr>
	           				<%
	           						}
	           					} else {
	           				%>
	           				<tr>
	           					<td colspan="6" style="text-align:center;"><h4>Record Not Found!</h4></td>
	           				</tr>
	           						<% } %>
           				</tbody>
           			</table>
                </div>
            </div>
     	</div>
    </div>
</body>
</html>
