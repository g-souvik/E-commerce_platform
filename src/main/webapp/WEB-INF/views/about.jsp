<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>About</title>
  <link rel="stylesheet" type="text/css" href="/css/navbar.css">
  <link rel="stylesheet" type="text/css" href="/css/footer.css">
  <style>
	.about-page .about-section {
	  padding: 40px;
	  background-color: #f3f4f6;
	}
	
	.about-page .container {
	  max-width: 1000px;
	  margin: auto;
	  background: #fff;
	  padding: 40px 42px 27px 43px;
	  border-radius: 12px;
	  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
	}
	
	.about-page h1,
	.about-page h2,
	.about-page h3 {
	  color: #333;
	  margin-bottom: 15px;
	}
	
	.about-page p {
	  line-height: 1.9;
	  color: #555;
	  margin-top: -5px;
	}
	
	.about-page ul {
	  list-style-type: disc;
	  padding-left: 20px;
	  color: #444;
	  margin-bottom: 25px;
	}
	
	.about-page ul li {
	  margin-bottom: 8px;
	}
	
	.about-page .mission {
	  background: #47f7ff;
	  color: #fff;
	  padding: 20px;
	  border-radius: 8px;
	  margin: 30px 0;
	}
	
	.about-page .mission h3 {
	  margin-top: 0;
	  color: #291cd5;
	}
  </style>
</head>
<body>

<jsp:include page="navbar.jsp" />

  <div class="about-page">
	<div class="page-wrapper">
	  <!-- About Section -->
	  <section class="about-section">
	    <div class="container">
	      <h1>About <span style="color:#007bff;">E.tech</span></h1>
	      <p>
	        Welcome to <strong>E.tech</strong> - your one-stop destination for the latest electronic gadgets. 
	        From smartphones and laptops to cameras and televisions, we bring you top-quality products at competitive prices.
	      </p>
	      <p>
	        This project was developed as part of a student project to demonstrate complete 
	        <strong>eCommerce functionality</strong> using Spring Boot, JSP, and MySQL. 
	        The aim is to deliver an intuitive user experience with secure login, dynamic product listings, 
	        and smooth cart management.
	      </p>
	
	      <div class="mission">
	        <h3>Our Mission</h3>
	        <p>To make technology accessible, affordable, and enjoyable for everyone.</p>
	      </div>
	
	      <h3>Key Features</h3>
	      <ul>
	        <li>User Authentication & Profile Management</li>
	        <li>Browse Products by Categories</li>
	        <li>Shopping Cart & Quantity Updates</li>
	        <li>Secure Checkout (Simulated)</li>
	        <li>Responsive & User-Friendly Design</li>
	      </ul>
	
	      <h3>Technologies Used</h3>
	      <p>
	        <strong>Backend:</strong> Spring Boot, Java <br>
	        <strong>Frontend:</strong> JSP, HTML, CSS, Bootstrap <br>
	        <strong>Database:</strong> MySQL
	      </p>
	    </div>
	  </section>
	
	</div>
</div>

<jsp:include page="footer.jsp" />

</body>
</html>
