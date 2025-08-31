<%@page import="com.example.jpa.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>User Profile</title>
  <link rel="stylesheet" type="text/css" href="/css/navbar.css">
  
  <style>
    body {
      font-family: Arial, sans-serif;
      background: linear-gradient(rgba(255, 255, 255, 0.1), rgba(255, 255, 255, 0.1)),
      			  url('/images/profile-background.jpg') no-repeat center center fixed;
      background-size: cover;
      margin: 0;
      padding: 0;
    }

    .profile-container {
      max-width: 550px;
      margin: 51px auto 10px auto;
      padding: 27px 30px;
      background: rgba(255, 255, 255, 0.95);
      border-radius: 20px;
      box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
    }

    .profile-container h6 {
      text-align: center;
      margin-bottom: 1.5rem;
      font-size: 1.75rem;
      color: #333;
      font-weight: 500;
    }

    .profile-container label {
      font-size: 1rem;
      font-weight: 400;
      line-height: 1.5;
      margin-bottom: 2.5rem;
      color: #212529;
      text-align: left;
    }

    .profile-container input {
      width: 100%;
      padding: .375rem .75rem;
      margin: 10px 0 15px 0;
      border: 1px solid #ccc;
      border-radius: 6px;
      font-size: 1rem;
    }

    .profile-container button {
      width: 100%;
      padding: 12px;
      background-color: #007bff;
      border-color: #007bff;
      border: 1px solid transparent;
      padding: .375rem .75rem;
      line-height: 1.5;
      color: #fff;
      font-size: 1rem;
      border: none;
      border-radius: 25px;
      cursor: pointer;
      font-weight: 400;
      margin-top: 5px;
    }

    .profile-container button:hover {
      background-color: #0056b3;
    }
  </style>
</head>
<body>

<jsp:include page="navbar.jsp" />

		<% User user = (User)request.getAttribute("details");
		   if(user != null)
		%>

<div class="profile-container">
    <h6>My Profile</h6>

    <form action="/edit" method="post">
      <label for="fullname">Full Name</label>
      <input type="text" id="name" name="name" value="<%= user.getName() %>">

      <label for="email">Email Address</label>
      <input type="email" id="email" name="email" value="<%= user.getEmail() %>">

      <label for="phone">Phone Number</label>
      <input type="text" id="phone" name="phone" value="<%= user.getPhno() %>">
      
      <label for="phone">Password</label>
      <input type="password" id="password" name="password" value="<%= user.getPassword() %>">

      <button type="submit">Save Changes</button>
    </form>
  </div>

</body>
</html>
