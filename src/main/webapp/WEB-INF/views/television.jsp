<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.example.jpa.entity.Product" %>
<% String ses = (String)session.getAttribute("udata"); %>
<% String str = (String)session.getAttribute("udata");
	if(str != null)
	    	str = str;
	    else
	    	str = "Guest";
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Televisions</title>
  <link rel="stylesheet" type="text/css" href="/css/product.css">
  <link rel="stylesheet" type="text/css" href="/css/navbar.css">
  <link rel="stylesheet" type="text/css" href="/css/footer.css">
</head>
<body>

<jsp:include page="navbar.jsp" />

<div class="container">
    <div class="product-grid">
    
	    <%  // Get the "product" attribute from request and cast it into a List of Product objects
	    	List<Product> product=(List<Product>)request.getAttribute("product");
	    	if(product!=null && !product.isEmpty()) {
	    		for(Product prod:product) {
		%>
	
	<div class="product-card">
		<img src="<%= prod.getFilePath() %>" alt="product Image" class="product-image">
		<h5><%= prod.getName() %></h5>
		<div class="brand"><%= prod.getBrand() %></div>
		<p>Available Quantity: <%= prod.getQuantity() %></p>
		<p>Price: ₹<%= prod.getPrice() %></p>
		
		<div class="button-group">
				
				<%	if(str.equals("Guest")) { %>
						<a href="log">Buy Now</a>
						<a href="log">Add to Cart</a>
				<%	} else { %>
						<a href="pdetails?prodid=<%=prod.getId()%>&price=<%=prod.getPrice()%>&email=<%=ses%>">Buy Now</a>
						<a href="cdetails?prodid=<%=prod.getId()%>&email=<%=ses%>">Add to Cart</a>
				<% } %>
				
				</div>
        	</div>
        	<%		}
		   		}
	   			else { %>
		   		<tr>
					<td colspan="3">No Product to display.</td>
				</tr>
			<% } %>
			</div>
		</div>

<jsp:include page="footer.jsp" />

</body>
</html>