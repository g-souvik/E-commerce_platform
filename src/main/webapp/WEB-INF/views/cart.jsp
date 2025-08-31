<%@page import="java.util.zip.CRC32"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*" %>
    <%@ page import="com.example.jpa.entity.Cart" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Your Cart</title>
  <link rel="stylesheet" type="text/css" href="/css/navbar.css">
  <link rel="stylesheet" type="text/css" href="/css/footer.css">
  <style>
    * {
      box-sizing: border-box;
      margin: 0;
      padding: 0;
    }

    body {
      font-family: 'Segoe UI', sans-serif;
      background-color: #f3f4f6;
    }

    html, body {
      height: 100%;
    }

    .page-wrapper {
      min-height: 100%;
      display: flex;
      flex-direction: column;
    }

    .content-wrapper {
      flex: 1;
      display: flex;
      justify-content: center;
      align-items: center;
      padding: 20px 0;
    }

    .cart-container {
      width: 60%;
      max-width: 900px;
      background: #fff;
      border-radius: 10px;
      padding: 20px;
      box-shadow: 0 5px 15px rgba(0,0,0,0.1);
      margin: 20px 20px;
    }

    h1 {
      margin-bottom: 16px;
      text-align: center;
      color: #333;
      font-size: 28px;
      font-weight: bold;
    }

    .cart-item {
      display: flex;
      align-items: center;
      justify-content: space-between;
      border-bottom: 1px solid #eee;
      padding: 20px 23px 17px 20px;
    }

    .item-details {
      display: flex;
      align-items: center;
      gap: 27px;
      flex: 2;
    }

    .cart-item img {
      width: 90px;
      height: 90px;
      border-radius: 6px;
      object-fit: contain;
      border: 1px solid #ddd;
      padding: 2px;
    }

    .item-info {
      display: flex;
      flex-direction: column;
    }

    .item-title {
      font-size: 1.1rem;
      font-weight: 600;
      margin-bottom: 5px;
      color: #333;
    }

    .subtotal {
      font-size: 1rem;
      color: #666;
    }

    .item-actions {
      display: flex;
      align-items: center;
      gap: 18px;
    }

    .quantity-input {
      width: 50px;
      padding: 6px;
      text-align: center;
      border: 1px solid #ccc;
      border-radius: 8px;
    }
    
    .buy-btn {
      background: #007bff;
      border: none;
      color: white;
      padding: 6px 12px;
      border-radius: 8px;
      cursor: pointer;
      font-size: 0.9rem;
    }
    
    .buy-btn:hover {
      background: #0056b3;
    }
    
    .remove-btn {
      background: #e63946;
      border: none;
      color: white;
      padding: 6px 12px;
      border-radius: 8px;
      cursor: pointer;
      font-size: 0.9rem;
    }

    .remove-btn:hover {
      background: #c12f3a;
    }

    .cart-summary {
      display: flex;
      justify-content: space-between;
      align-items: center;
      font-size: 1.2rem;
      padding: 20px 10px 0 10px;
    }

    .checkout-btn {
      background: #007bff;
      color: white;
      padding: 6px 12px 8px 12px;
      border: none;
      border-radius: 8px;
      font-size: 1rem;
      cursor: pointer;
    }

    .checkout-btn:hover {
      background: #0056b3;
    }

    @media (max-width: 600px) {
      .cart-item {
        flex-direction: column;
        align-items: flex-start;
        gap: 10px;
      }

      .cart-summary {
        flex-direction: column;
        align-items: flex-start;
        gap: 10px;
      }

      .checkout-btn {
        width: 100%;
        text-align: center;
      }
    }
  </style>
</head>
<body>
<div class="page-wrapper">

<jsp:include page="navbar.jsp" />

<main class="content-wrapper">
<div class="cart-container">
  <h1>Your Shopping Cart</h1>
  
   <%	// Getting cart data from request attribute
		List<Cart> cart=(List<Cart>)request.getAttribute("cdata");
   		double total = 0;
      	if(cart!=null && !cart.isEmpty()) {
      		for(Cart cr:cart) {
      			total += cr.getProduct().getPrice();
	%>
	
  <!-- Cart Items -->
  <div class="cart-item">
    <div class="item-details">
      <img src="<%= cr.getProduct().getFilePath() %>" alt="Product">
      <div class="item-info">
        <div class="item-title"><%= cr.getProduct().getName() %>, <%= cr.getProduct().getBrand() %></div>
        <div class="subtotal">₹<%= cr.getProduct().getPrice() %></div>
      </div>
    </div>
    <div class="item-actions">
      <input type="number" class="quantity-input" value="1" min="1">
      <a class="buy-btn" href="pdetails?prodid=<%=cr.getProduct().getId()%>&price=<%=cr.getProduct().getPrice()%>&email=<%=cr.getUser().getEmail()%>">Buy Now</a>
      <a class="remove-btn" href="deleteItem?itemid=<%= cr.getId() %>&email=<%= cr.getUser().getEmail() %>">Remove</a>
    </div>
  </div>
  <% } %>
  
  <!-- Cart Summary -->
  <div class="cart-summary">
    <div><strong>Total:</strong> ₹<%= total %></div>
    <button class="checkout-btn">Proceed to Checkout</button>
  </div>
  <% } else { %>
      	<p style="text-align:center; padding-top: 10px;">No Product to display.</p>
  <% } %>
</div>
</main>

<jsp:include page="footer.jsp" />

</div>
</body>
</html>