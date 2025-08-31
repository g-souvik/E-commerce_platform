<%@ page import="java.util.*" %>
<%@ page import="com.example.jpa.entity.Product" %>
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
           
            <div class="cardbox">
                <div class="card">
                    <div>
                        <div class="numbers">0</div>
                        <div class="cardname">Active Users</div>
                    </div>
                    <div class="iconbox">
                        <i class="fa fa-users" aria-hidden="true"></i>
                    </div>
                </div>
                
                <div class="card">
                    <div>
                        <div class="numbers">0</div>
                        <div class="cardname">Sales</div>
                    </div>
                    <div class="iconbox">
                        <i class="fa fa-shopping-cart" aria-hidden="true"></i>
                    </div>
                </div>
            </div>

            <div class="details">
                <div class="recentorders">
                    <div class="cardheader">
                        <h2>Product Details</h2><br><br>
                    </div>
                    
                    <table>
                        <thead>
                            <tr>
                                <th style="text-align:center;">Prod ID</th>
                                <th style="text-align:center;">Prod Name</th>
                                <th style="text-align:center;">Category</th>
                                <th style="text-align:center;">Brand</th>
                                <th style="text-align:center;">Quantity</th>
                                <th style="text-align:center;">Price</th>
                                <th style="text-align:center;">Image</th>
                            </tr>
                        </thead>
                        
                     	<tbody>
	           				<%
	           					List<Product> product=(List<Product>)request.getAttribute("data");
	           					if(product!=null && !product.isEmpty()) {
	           						for(Product prod:product) {
	           				%>
	           				<tr>
		           				<td style="text-align:center;"><%= prod.getId() %></td>
		           				<td style="text-align:center;"><%= prod.getName() %></td>
		           				<td style="text-align:center;"><%= prod.getCategory() %></td>
		           				<td style="text-align:center;"><%= prod.getBrand() %></td>
		           				<td style="text-align:center;"><%= prod.getQuantity() %></td>
		           				<td style="text-align:center;"><%= prod.getPrice() %></td>
		           				<td style="text-align:center;">
	           						<%
	           							String filePath = prod.getFilePath();
								    	if (filePath != null && !filePath.isEmpty()) { 
									 %>
							    		<img src="<%= filePath %>" width="90" height="50"/>
							 		<% } else { %>
							 			N/A
							 		<% } %>
								</td>
		           				<td style="text-align:right;">
		           					<a href="/viewrecord/<%=prod.getId()%>" class="btn">Edit</a>
		           				</td>
		           				<td style="text-align:center;">
		           					<a href="/deleteProd/<%=prod.getId()%>" onclick="return confirm('Are you sure?')" class="btn">Delete</a>
		           				</td>
		           			</tr>
           					<%
           							}
           						} else {
           					%>
           					<tr>
								<td colspan="9" style="text-align:center;"><h4>Record Not Found!</h4></td>
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