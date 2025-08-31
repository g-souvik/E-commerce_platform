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
                    	<h4>${msg}</h4>
                	</div>
                	
<div class="form-container">
  <form action="additem"  method="post" enctype="multipart/form-data" >
  	<h2>Add Product</h2>
  	
    <label for="prodid">Product Id</label>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
    <input type="text"  name="prodid" placeholder="Product Id.."><br><br>

    <label for="prodname">Product Name</label>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
    <input type="text"  name="prodname" placeholder="Product name.."><br><br>

    <label for="category">Category</label>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
    <select id="category" name="category">
      <option disabled selected>Select Category</option>
      <option value="Mobile">Mobile</option>
      <option value="Laptop">Laptop</option>
      <option value="Television">Television</option>
      <option value="Camera">Camera</option>
    </select><br><br>
    
    <label for="brand">Brand</label>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
    <input type="text"  name="brand" placeholder="Brand name.."><br><br>
    
    <label for="qty">Quantity</label>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
    <input type="text"  name="qty" placeholder="Quantity.."><br><br>
    
    <label for="price">Price</label>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
    <input type="text"  name="price" placeholder="Price.."><br><br>
    
    <label for="file">Select Image:</label>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
    <input type="file" name="file" accept="image/"/><br><br>
    
    <div class="form-buttons">
      <input type="submit" value="Submit">
      <input type="reset" value="Clear">
    </div>
    
  </form>
</div>
			 </div>
          </div>
       </div>     
    </div>

</body>
</html>