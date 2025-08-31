<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="ISO-8859-1">
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Login</title>
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
        margin-top: 110px;
        margin-bottom: 100px;
        display: flex;
        justify-content: center;
    }

    .card {
        padding: 30px 30px 18px 30px;
        border-radius: 20px;
        box-shadow: 0px 0px 20px rgba(0,0,0,0.3);
        background-color: rgba(255, 255, 255, 0.95);
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
        <h3 class="text-center mb-4">Login Here</h3>
        <h4 style="color: ${msg == 'Registered Succesfully!' ? 'green' : 'red'}; font-size: 15px; margin-top: -14px;">${msg}</h4>
        <form action="logproc" method="post"> <!-- Replace with your servlet/controller -->
            
            <div class="form-group">
                <label for="email">Email address</label>
                <input type="email" name="email" class="form-control" id="email" placeholder="Enter your email" required>
            </div>
            
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" name="password" class="form-control" id="password" placeholder="Enter your password" required>
            </div>
            <div class="form-group text-center">
                <button type="submit" class="btn btn-primary btn-block">Login</button>
            </div>
            <div class="text-center">
                <small>New User? <a href="reg" style="color: #0d6efd;">Sign Up here</a></small>
            </div>
        </form>
    </div>
</div>
</body>
</html>
