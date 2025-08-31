<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Checkout</title>
    <script src="https://checkout.razorpay.com/v1/checkout.js"></script>
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

        .checkout-container {
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
        }

        h3 {
            margin-bottom: 20px;
        }

        .loader {
            margin-top: 20px;
        }
    </style>
</head>
<body>

<div class="checkout-container">
    <div class="card">
        <h3>Redirecting to Razorpay...</h3>
        <p>Please do not refresh the page.</p>
        <div class="loader">
            <div class="spinner-border text-primary" role="status">
              <span class="sr-only">Loading...</span>
            </div>
        </div>
    </div>
</div>

<script>
    var options = {
        "key": "${key}",
        "amount": "${amount*100}", 
        "currency": "INR",
        "name": "Test Company",
        "description": "Demo Transaction",
        "handler": function (response){
            window.location.href = "/orderdetails?payment_id=" + response.razorpay_payment_id;
        },
        "prefill": {
            "name": "${custName}",
            "email": "${custEmail}",
            "contact": "${custContact}"
        },
        "theme": {
            "color": "#3399cc"
        }
    };
    var rzp1 = new Razorpay(options);
    rzp1.open();
</script>

</body>
</html>
