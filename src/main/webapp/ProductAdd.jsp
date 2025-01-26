<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MeteorEyewear</title>
    <link rel="stylesheet" href="style.css">
    <style>
        /* Reset default margins and paddings */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        html, body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            height: 100%; /* Ensures body spans the viewport height */
            justify-content: center;
            align-items: center;
            color : white ;
            background-color: #eaeae1;
        }

        /* Wrapper to manage header, main content, and footer */
        .wrapper {
            display: flex;
            flex-direction: column;
            min-height: 100vh; /* Makes the wrapper span the full height of the viewport */
            
        }

        main {
    flex: 1; /* Ensures the main content fills available space */
    padding: 20px;
    display: flex; /* Enable flexbox */
    justify-content: center; /* Center horizontally */
    align-items: center; /* Center vertically */
    text-align: center;
    color: black;
    background-color: #eaeae1; /* Optional: Ensure the background is visible */
}
        
        
        header {
            background-color: #662200;
            padding: 10px 20px;
        }

        header .navbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            font-family: monospace;
        }

        header .navbar .menu a {
            margin: 0 15px;
            text-decoration: none;
            color: white;
            font-size: 20px;
            font-weight: bold;
        }

        header .navbar .menu a:hover {
            color: #e64d00;
        }

        header .navbar .profile img {
            height: 30px;
            border-radius: 50%;
            margin-left: 8px;
        }
       
        h1{
	   color: #333;
	   font-size: 30px;
	   margin-bottom: 20px;
	   text-align:center;
        }
        
       
       button .footer {
	  padding: 5px 10px;
	  background-color: #f90;
	  color: white;
	  border: none;
	  cursor: pointer;
	  }
	  
	    .form-container {
            background: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 400px;
                       
        }

        .form-group {
            margin-bottom: 15px;
            
        }

        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }

        .form-container input, .form-container select {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 14px;
            background-color: #fafafa;
        }

        .form-group.hidden {
            display: none;
        }

        .submit-button {
            width: 100%;
            padding: 10px;
            background-color: #F90;
            color: white;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
        }

        .submit-button:hover {
            background-color: #0056b3;
        }

        /* Footer Styling */
        footer {
            display: flex;
            justify-content: space-around;
            padding: 20px;
            background-color: #662200;
            color: white;
            font-family: monospace;
            
        }

        footer .footer-section h4 {
            margin-bottom: 10px;
            font-size: 20px;
        }

        footer .footer-section ul {
            list-style: none;
            padding: 0;
        }

        footer .footer-section ul li {
            margin-bottom: 5px;
        }

        footer .footer-section ul li a {
            text-decoration: none;
            color: white;
        }

        footer .footer-section ul li a:hover {
            color: #ff6600;
            transform: scale(1.02);
        }

        footer form input {
            padding: 5px;
            margin-right: 10px;
        }

        footer form button {
            padding: 5px 10px;
            background-color: #f90;
            color: white;
            border: none;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <div class="wrapper">
        <!-- Header Section -->
        <header>
            <div class="navbar">
                <div class="logo">
                    <a href="index.jsp">
                        <img src="images/logo.jpg" alt="Logo" style="height: 50px; border-radius: 50%;">
                    </a>
                </div>
                <div class="menu">
                    <a href="ProductList.jsp">PRODUCT</a>
                    <a href="spectacleProfile.jsp">SPECTACLE PROFILE</a>
                    <a href="OrderDetails.jsp">ORDER</a>
                </div>
                <div class="profile">
                    <img src="images/profile.png" alt="Profile">
                </div>
            </div>
        </header>

        <!-- Main Content Section -->
       <main>
    <div class="form-container">
        <form id="productForm" action="AddProduct" method="post">
            <div class="form-group">
                <label for="productName">Product Name</label>
                <input type="text" id="productName" name="productName" required>
            </div>

            <div class="form-group">
                <label for="productBrand">Product Brand</label>
                <input type="text" id="productBrand" name="productBrand" required>
            </div>
            
            <div class="form-group">
                <label for="frameShape">Frame Shape</label>
                <input type="text" id="frameShape" name="frameShape" required>
            </div>

            <div class="form-group">
                <label for="frameColor">Frame Color</label>
                <input type="text" id="frameColor" name="frameColor" required>
            </div>

            <button type="submit" class="submit-button">Submit</button>
        </form>
    </div>
</main>


        

        <!-- Footer Section -->
        <footer>
            <div class="footer-section">
                <h4>Contact Us</h4>
                <p>METEOR EYEWEAR<br>Jc 2.G, Jalan Bmu 1,<br>Bandar Baru Merlimau Utara,<br>Merlimau 77300, Melaka</p>
                <p>+606-263-1175</p>
                <p>Email: merlimau@meteor-eyewear.com</p>
            </div>
            <div class="footer-section">
                <h4>About Us</h4>
                <ul>
                    <li><a href="about.jsp">About Us</a></li>
                    <li><a href="store.jsp">Our Store</a></li>
                </ul>
            </div>
            <div class="footer-section">
                <h4>Help</h4>
                <ul>
                    <li><a href="#contact">Contact Us</a></li>
                    <li><a href="#terms">Terms of Use</a></li>
                    <li><a href="#privacy">Privacy Policy</a></li>
                </ul>
            </div>
            <div class="footer-section">
                <h4>Be In Touch With Us</h4>
                <p>Subscribe to our newsletter for the latest updates and promo codes.</p>
                <form>
                <br>
                    <input class="footer-input" type="email" placeholder="Your Email">
                    <button class="footer" type="submit">Subscribe</button>
                </form>
            </div>
        </footer>
    </div>
</body>
</html>