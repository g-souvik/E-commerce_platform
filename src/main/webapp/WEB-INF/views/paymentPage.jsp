<%@page import="com.example.jpa.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Secure Payment</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
  <style>
    body {
        background: linear-gradient(rgba(255, 255, 255, 0.3), rgba(255, 255, 255, 0.1)),
                    url('images/payment-background.jpg') no-repeat center center fixed;
        background-size: cover;
        background-position: center;
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        margin: 0;
        padding: 0;
    }

    .payment-container {
        margin-top: 67px;
        margin-bottom: 50px;
        display: flex;
        justify-content: center;
    }

    .card {
        padding: 25px 30px;
        border-radius: 20px;
        box-shadow: 0px 0px 20px rgba(0,0,0,0.3);
        background-color: rgba(255, 255, 255, 0.95);
        margin-bottom: 0;
    }
    
    .form-group {
        margin-bottom: 15px;
    }

    .form-control:focus {
        box-shadow: none;
        border-color: #007bff;
    }

    .btn-primary {
        border-radius: 25px;
    }

    .secure-note {
        text-align: center;
        
        font-size: 1em;
        color: #4CAF50;
        margin-bottom: 15px;
    }
    
    .mb2 {
    	margin-bottom: 1rem;
    }
  </style>
</head>
<body>

<%
    User user = (User) request.getAttribute("user");
    String price = (String) request.getAttribute("price");
%>

<!-- Payment Form -->
<div class="payment-container">
    <div class="card col-md-5">
        <h3 class="text-center mb2">Complete Your Payment</h3>
        <p class="secure-note">Your payment is secure and encrypted.</p>

        <form action="createOrder" method="post">
            <div class="form-group">
                <label>Amount</label>
                <input type="number" name="amount" class="form-control" value="<%= price %>" readonly>
            </div>
            <div class="form-group">
                <label>Name</label>
                <input type="text" name="name" class="form-control" value="<%= user.getName() %>" readonly>
            </div>
            <div class="form-group">
                <label>Email</label>
                <input type="email" name="email" class="form-control" value="<%= user.getEmail() %>">
            </div>
            <div class="form-group">
                <label>Contact</label>
                <input type="text" name="contact" class="form-control" value="<%= user.getPhno() %>">
            </div>
            <div class="form-group text-center mb-0">
                <button type="submit" class="btn btn-primary btn-block">Pay Now</button>
            </div>
        </form>
    </div>
</div>

</body>
</html>