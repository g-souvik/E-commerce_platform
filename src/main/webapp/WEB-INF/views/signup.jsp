<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="ISO-8859-1">
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Sign Up</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
  <link rel="stylesheet" type="text/css" href="/css/navbar.css">
  <style>
    body {
        background: linear-gradient(rgba(255, 255, 255, 0.1), rgba(255, 255, 255, 0.1)),
                url('images/signup-background.jpg') no-repeat center center fixed;
        background-size: cover;
        background-position: center;
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        margin: 0;
        padding: 0;
    }

    .signup-container {
        margin-top: 41px;
        margin-bottom: 30px;
        display: flex;
        justify-content: center;
    }

    .card {
        padding: 27px 30px 18px 30px;
        border-radius: 20px;
        box-shadow: 0px 0px 20px rgba(0,0,0,0.3);
        background-color: rgba(255, 255, 255, 0.95);
    }
    
    .form-group {
    	margin-bottom: 13px;
	}
    
    .form-control:focus {
        box-shadow: none;
        border-color: #007bff;
    }

    .btn-primary {
        border-radius: 25px;
        margin-top: 20px;
    }
  </style>
</head>
<body>

<jsp:include page="navbar.jsp" />

<div class="signup-container">
    <div class="card col-md-5">
        <h3 class="text-center mb-4">Create Your Account</h3>

        <form action="regproc" method="post"> <!-- Replace with your servlet/controller -->
            <div class="form-group">
                <label for="name">Full Name</label>
                <input type="text" name="name" class="form-control" id="name" placeholder="Enter your full name" required>
            </div>
            <div class="form-group">
                <label for="email">Email address</label>
                <input type="email" name="email" class="form-control" id="email" placeholder="Enter your email" required>
            </div>
            <div class="form-group">
                <label for="phone">Phone Number</label>
                <input type="text" name="phone" class="form-control" id="phone" placeholder="Enter your phone number" required>
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" name="password" class="form-control" id="password" placeholder="Create a password" required>
            </div>
            <div class="form-group text-center">
                <button type="submit" class="btn btn-primary btn-block">Sign Up</button>
            </div>
            <div class="text-center">
                <small>Already have an account? <a href="log">Login here</a></small>
            </div>
        </form>
    </div>
</div>
</body>
</html>
