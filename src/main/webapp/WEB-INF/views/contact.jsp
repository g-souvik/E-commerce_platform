<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Contact Us</title>
  <link rel="stylesheet" type="text/css" href="/css/navbar.css">
  <link rel="stylesheet" type="text/css" href="/css/footer.css">
  <style>
	.contact-page .contact-section {
      padding: 40px;
      background-color: #f3f4f6;
    }

    .contact-page .container {
      max-width: 850px;
      margin: auto;
      background: #fff;
      padding: 38px 46px;
      border-radius: 12px;
      box-shadow: 0px 4px 12px rgba(0,0,0,0.1);
    }

    .contact-page h1, 
    .contact-page h2 {
      color: #333;
      margin-bottom: 15px;
    }

    .contact-page p {
      line-height: 1.5;
      color: #555;
      margin-top: -5px;
    }

    .contact-page .info {
      margin: 20px 0;
    }

    .contact-page .info p {
      margin: 8px 0;
    }

    .contact-page .highlight {
      color: #007bff;
      font-weight: bold;
    }

    .contact-page .social-links a {
      margin-right: 15px;
      text-decoration: none;
      color: #007bff;
      font-weight: bold;
    }
  </style>
</head>
<body>

<jsp:include page="navbar.jsp" />

  <div class="contact-page">
	<div class="page-wrapper">
	  <!-- Contact Section -->
	  <section class="contact-section">
	    <div class="container">
	      <h1>Contact <span style="color:#007bff;">E.tech</span></h1>
	      <p>
	        Have questions, feedback, or suggestions? We’d love to hear from you. 
	        Reach out to us using the details below.
	      </p>
	
	      <div class="info">
	        <h2>Our Contact Information</h2>
	        <p>Email: <span class="highlight">souvikgh03@gmail.com</span></p>
	        <p>Phone: <span class="highlight">+91 6290679022</span></p>
	        <p>Address: E.tech HQ, Kolkata, India</p>
	      </div>
	
	      <div class="social-links">
	        <h2>Follow Us</h2>
	        <a href="https://github.com/g-souvik" target="_blank">GitHub</a>
	        <a href="http://www.linkedin.com/in/souvik-ghosh-7b9622332" target="_blank">LinkedIn</a>
	      </div>
	    </div>
	  </section>
	</div>
  </div>
  
  <jsp:include page="footer.jsp" />
  
</body>
</html>