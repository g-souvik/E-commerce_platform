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
                    <a href="/viewitem">&nbsp&nbsp&nbsp&nbsp
                        <span class="icon"><i class="fa fa-home" aria-hidden="true"></i></span>
                        <span class="title">Home</span>
                    </a>
                </li>
                
                <li>
                    <a href="/addform">&nbsp&nbsp&nbsp&nbsp
                        <span class="icon"><i class="fa fa-id-card" aria-hidden="true"></i></span>
                        <span class="title">Add Product</span>
                    </a>
                </li>
                
                <li>
                    <a href="/viewuser">&nbsp&nbsp&nbsp&nbsp
                        <span class="icon"><i class="fa fa-user" aria-hidden="true"></i></span>
                        <span class="title">View User</span>
                    </a>
                </li>
                
                <li>
                    <a href="/viewrecord">&nbsp&nbsp&nbsp&nbsp
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
                </div>
             
             <%
             	Product product=(Product)request.getAttribute("prod");
				if(product!=null) {
             %>
             
<div class="form-container">
  <form action="/update"  method="post" enctype="multipart/form-data" >
  	<h2>Edit Product</h2>
  	
    <label for="prodid">Product Id</label>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
    <input type="text"  name="prodid" value="<%=product.getId()%>" readonly><br><br>

    <label for="prodname">Product Name</label>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
    <input type="text"  name="prodname" value="<%=product.getName()%>"><br><br>

    <label for="category">Category</label>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
    <input type="text"  name="category" value="<%=product.getCategory()%>"><br><br>
    
    <label for="brand">Brand</label>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
    <input type="text"  name="brand" value="<%=product.getBrand() %>"><br><br>
    
    <label for="lname">Quantity</label>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
    <input type="text"  name="qty" value="<%=product.getQuantity()%>"><br><br>
    
    <label for="lname">Price</label>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
    <input type="text"  name="price" value="<%=product.getPrice()%>"><br><br>
    
    <label>Select Image:</label>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
    <input type="file" name="file" accept="image/"/><br><br>
    <% } %>
    
    <div class="form-buttons">
	    <input type="submit" value="Submit">
	    <input type="reset" value="Clear">
    <div class="form-buttons">
    
  </form>
</div>
            </div>
         </div>     
      </div>
   </div>
  
</body>
</html>