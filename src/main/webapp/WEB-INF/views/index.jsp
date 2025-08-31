<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Home</title>
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Lato:wght@300;400&display=swap" rel="stylesheet">
  <link rel="stylesheet" type="text/css" href="/css/navbar.css">
  <link rel="stylesheet" type="text/css" href="/css/footer.css">
  <style>
    :root {
      --primary-color: #0077cc;
      --dark-color: #1e1e1e;
      --light-gray: #f3f4f6;
      --text-color: #333;
      --font-main: 'Inter', sans-serif;
    }

    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }

    body {
      font-family: var(--font-main);
      background: var(--light-gray);
      color: var(--text-color);
      line-height: 1.6;
    }

    .header{
      background-color: #111518;
      color: white;
      display: flex;
      justify-content: space-between;
      align-items: center;
      padding-top: 42px;
      padding-right: 3%;
      padding-bottom: 0px;
      padding-left: 6%;
      flex-wrap: wrap;
      font-family:'Lato', sans-serif;
      font-weight: 300;
     }
     
     .shop-button {
      display: inline-block;
      padding: 14px 36px;
      background-color: #075ab3;
      color: white;
      letter-spacing: 2.5px;
      text-transform: uppercase;
      font-size: 16px;
      margin-left: -10px;
      border-radius: 8px;
      font-weight: 500;
      transition: background-color 0.3s ease;
      border: none;
     }

    .shop-button:hover {
      background-color: #054a96;
      cursor: pointer;
    }

    .section {
      padding: 40px 8%;
    }

    .section h2 {
      text-align: center;
      font-size: 32px;
      margin-bottom: 40px;
    }

    .categories {
      display: flex;
      gap: 60px;
      justify-content: center;
      flex-wrap: wrap;
    }

    .category-card {
      background: #fff;
      padding: 20px 10px;
      border-radius: 15px;
      box-shadow: 0 4px 12px rgba(0,0,0,0.08);
      width: 220px;
	  height: 230px;
      text-align: center;
      display: flex;
      flex-direction: column;
      align-items: center;
      justify-content: center;
      transition: transform 0.3s ease, box-shadow 0.3s ease;
    }

    .category-card:hover {
      transform: translateY(-8px);
      box-shadow: 0 8px 20px rgba(0,0,0,0.1);
      color: #06a9d1;
    }

    .category-card img {
      width: 200px;
      height: 200px;
      object-fit: cover;
      margin-bottom: -22px;
      margin-top: -10px;
    }

    .category-card h4 {
      font-size: 18px;
      font-weight: 600;
    }

    .products {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(230px, 1fr));
      gap: 25px;
    }

    .product-card {
      background: #fff;
      border-radius: 12px;
      box-shadow: 0 4px 12px rgba(0,0,0,0.08);
      overflow: hidden;
      transition: transform 0.3s ease;
    }

    .product-card:hover {
      transform: translateY(-5px);
    }

    .product-card img {
      width: 100%;
      height: 180px;
      object-fit: cover;
    }

    .product-card .info {
      padding: 15px;
    }

    .product-card h4 {
      font-size: 17px;
      margin-bottom: 6px;
    }

    .product-card p {
      color: var(--primary-color);
      font-weight: 600;
    }

	.brands-card {
	  background: #fff;
	  padding: 35px 30px;
	  border-radius: 15px;
	  box-shadow: 0 4px 12px rgba(0,0,0,0.08);
	}
	
	.brand-logos {
	  display: flex;
	  justify-content: center;
	  align-items: center;
	  flex-wrap: wrap;
	  gap: 60px;
	  padding: 0;
	  margin: 20px auto;
	  max-width: 1200px;
	}
	
	.brand-logos img {
	  height: 55px;
	  max-width: 160px;
	  object-fit: contain;
	  transition: transform 0.2s ease-in-out;
	
	}
	
	.brand-logos img:hover {
    	transform: scale(1.3);
    	
	}
  </style>
</head>
<body>

<jsp:include page="navbar.jsp" />
  
<!-- Banner -->
<section class="header">
  <div style="flex: 1 1 400px; margin-bottom: 20px; font-family: 'Lato', sans-serif;">
    <h1 style="font-size: 65px; margin-bottom: 20px; margin-top: 110px; margin-right: 20px; margin-left: -10px; font-weight: 300;">SHOPPING  WITH TRENDS.</h1>
    <a href="/mobile" class="shop-button">Shop Product</a>
  </div>
  <div style="flex: 1 1 400px; text-align: right; padding-bottom: 0px; padding-top: 12px;">
    <img src="images/iphone.jpg" style="max-width: 93%; height: auto; display: block; " />
  </div>
</section>


  <!-- Categories -->
  <section class="section">
    <h2>Browse by Category</h2>
    <div class="categories">
      <div class="category-card">
        <a href="/mobile"><img src="images/mobile.jpg" alt="Mobiles"></a>
        <h4>Mobiles</h4>
      </div>
      <div class="category-card">
        <a href="/laptop"><img src="images/laptop.jpg" alt="Laptops"></a>
        <h4>Laptops</h4>
      </div>
      <div class="category-card">
        <a href="/television"><img src="images/tv.jpg" alt="Televisions"></a>
        <h4>Televisions</h4>
      </div>
      <div class="category-card">
        <a href="/camera"><img src="images/camera.jpg" alt="Cameras"></a>
        <h4>Cameras</h4>
      </div>
    </div>
  </section>

  <!-- Advertisement -->
  <section class="section" style="padding-top: 0px; padding-bottom: 0px;">
    <img src="images/banner.jpg" alt="Advertisement" style="max-width: 100%; height: auto; border-radius: 10px;">
  </section>


  <!-- Featured Products -->
  <section class="section">
    <h2>Featured Products</h2>
    <div class="products">
      <div class="product-card">
        <img src="images/iPhone15Pro.jpg" alt="Product">
        <div class="info">
          <h4>iPhone 15 Pro</h4>
          <p>₹90,999.00</p>
        </div>
      </div>
      <div class="product-card">
        <img src="images/DellPro16Plus.jpg" alt="Product">
        <div class="info">
          <h4>Dell Pro 16 Plus</h4>
          <p>₹1,42,647.00</p>
        </div>
      </div>
      <div class="product-card">
        <img src="images/SonyAlphaA7III.jpg" alt="Product">
        <div class="info">
          <h4>Sony Alpha A7 III</h4>
          <p>₹1,46,990.00</p>
        </div>
      </div>
      <div class="product-card">
        <img src="images/Samsung55QLEDTV.jpg" alt="Product">
        <div class="info">
          <h4>Samsung 55" QLED TV</h4>
          <p>₹49,990.00</p>
        </div>
      </div>
    </div>
  </section>

	<!-- Featured Brands Section -->
	<section class="section" style="padding-top: 0px">
	 <h2>Featured Brands</h2>
	  <div class="brands-card">
	
	    <!-- Brand Logo Row -->
	    <div class="brand-logos">
	      <a href="https://www.apple.com/"><img src="images/Apple_logo.png" alt="Apple"></a>
	      <a href="https://www.sony.co.in/homepage"><img src="images/Sony_logo.png" alt="Sony"></a>
	      <a href="https://www.lg.com/in/"><img src="images/LG_logo.png" alt="LG"></a>
	      <a href="https://www.samsung.com/in/"><img src="images/Samsung_logo.png" alt="Samsung"></a>
	      <a href="https://www.dell.com/en-in"><img src="images/Dell_logo.png" alt="Dell"></a>
	      <a href="https://global.canon/en/"><img src="images/Canon_logo.png" alt="Canon"></a>
	    </div>
	  </div>
	</section>

  <!-- Footer -->
  <footer class="footer">
  <div class="footer-content">

    <!-- Column 1: Brand Info -->
    <div class="footer-column">
      <h3 style="margin-bottom: 12px;">E.tech</h3>
      <p>Your trusted store for the latest<br>gadgets and electronics.</p>
    </div>

    <!-- Column 2: Explore -->
    <div class="footer-column">
      <h3 style="margin-bottom: 12px;">Explore</h3>
      <ul>
        <li><a href="/mobile">Mobile</a></li>
        <li><a href="/laptop">Laptop</a></li>
        <li><a href="/television">Television</a></li>
        <li><a href="/camera">Camera</a></li>
      </ul>
    </div>

    <!-- Column 3: Company -->
    <div class="footer-column">
      <h3 style="margin-bottom: 12px;">Company</h3>
      <ul>
        <li><a href="/">Home</a></li>
        <li><a href="/about">About</a></li>
        <li><a href="/contact">Contact Us</a></li>
      </ul>
    </div>

  </div>

  <!-- Footer Bottom -->
  <div class="footer-bottom">
    &copy; 2025 TechCart. All rights reserved.
  </div>
</footer>

</body>
</html>
