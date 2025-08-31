<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% String transactionId = request.getParameter("payment_id"); %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Order Details</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
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

        .order-container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 90vh;
        }

        .card {
            padding: 25px 30px;
            border-radius: 20px;
            box-shadow: 0px 0px 20px rgba(0,0,0,0.3);
            background-color: rgba(255, 255, 255, 0.95);
            text-align: center;
            max-width: 500px;
            width: 100%;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .btn-primary {
            border-radius: 25px;
            width: 100%;
        }
    </style>
</head>
<body>

<div class="order-container">
    <div class="card">
        <h3 class="mb-4">Order Details</h3>

        <form action="/order" method="post">
            <div class="form-group text-left">
                <label for="address">Delivery Address</label>
                <input type="text" class="form-control" id="address" name="address" placeholder="Enter your address" required>
            </div>

            <input type="hidden" name="tdetails" value="<%= transactionId %>">

            <div class="form-group">
                <button type="submit" class="btn btn-primary">Place Order</button>
            </div>
        </form>
    </div>
</div>

</body>
</html>
