<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Order Success</title>
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

        .success-container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 90vh;
        }

        .card {
            padding: 30px;
            border-radius: 20px;
            box-shadow: 0px 0px 20px rgba(0,0,0,0.3);
            background-color: rgba(255, 255, 255, 0.95);
            max-width: 500px;
            width: 100%;
            text-align: center;
        }

        .btn-home {
            margin-top: 20px;
            border-radius: 25px;
            width: 100%;
        }
    </style>
</head>
<body>

<div class="success-container">
    <div class="card">
        <h3>Payment Successful</h3>
        <p class="mt-3">Your payment was successful!</p>
        <a href="/" class="btn btn-primary btn-home">Go Back to Home</a>
    </div>
</div>

</body>
</html>
