<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MeteorEyewear</title>
    
</head>
<style>

/* General Reset */
body {
    margin: 0;
    font-family: Arial, sans-serif;
    color: white;
    
}
/* Navbar Styling */
.navbar {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 10px 20px;
    background-color: #662200;
    border-bottom: 1px solid #ddd;
    
    
}

.navbar .logo img {
     height: 50px;
     border-radius: 50%;
     margin-right: 8px;
}

.navbar .menu a {
     margin: 0 15px;
     text-decoration: none;
     color: white;
     font-size: 20px;
     font-weight: bold;
}

.navbar .menu a:hover {
     color:#e64d00;
}

.navbar .profile img {
       height: 30px;
       border-radius: 50%;
       margin-left: 8px;

}
/* Main Content Section */
.main-content {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 20px;
    background-color:#eaeae1;
    color:black;
    
}

.a{
	text-align:center;
	color:black
}

.image-section img {
       width:580px;
       height: 100%;
       border-radius: 15px;
       margin-left:150px;
}

.login-section {
       background-color: #fff;
       padding: 40px;
       border: 3px solid #ccccb3;
       border-radius: 15px;
       box-shadow: 0 2px 2px rgba(0, 0, 0, 0.1);
       width: 450px;
       margin-right:150px;
}

.login-section h3 {
    margin-bottom: 20px;
    font-size: 18px;
    color: #333;
}

.login-section .social-login button {
    display: block;
    width: 100%;
    margin-bottom: 10px;
    padding: 10px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-size: 14px;
}

.login-section .social-login button:nth-child(1) {
    background-color:#c2c2a3;
    color: white;
}

.login-section .social-login button:nth-child(2) {
    background-color: #4267b2;
    color: white;
}

.login-section .social-login button:hover {
 /* Slightly darker hover state */
    transform: scale(1.02);
}
.login-section form input {
    width: 100%;
    margin-bottom: 10px;
    padding: 10px;
    border: 1px solid #ddd;
    border-radius: 5px;
    font-size: 14px;
}

.login-section form button {
    padding: 14px;
    margin-left:80px;
    background-color: #ff3300; /* Modern blue */
    color: #ffffff;
    border: none;
    border-radius: 8px;
    font-size: 14px;
    font-weight: bold;
    cursor: pointer;
    text-align: center;
    width:200px;
    transition: background-color 0.2s ease, transform 0.2s ease;
}

.login-section form button:hover {
    background-color: #ff9900; /* Slightly darker hover state */
    transform: scale(1.02);
}

/* For a cleaner, less cluttered appearance */
.login-section input::placeholder {
    color: #aaa; /* Subtle placeholder text */
    font-size: 13px;
}
.login-section a {
    color: #ff6347;
    text-decoration: none;
    font-size: 14px;
}

/* Footer Section */
footer {
	  display: flex;
	  justify-content: space-around;
	  padding: 20px;
	  background-color:#662200;
	  font-family: monospace;
}

	
.footer-section h4 {
	  margin-bottom: 10px;
	  font-size: 20px;
	  font-family: monospace;
}
	
.footer-section ul {
	  list-style: none;
	  padding: 0;
	  font-family: monospace;
}
	
.footer-section ul li {
	  margin-bottom: 5px;
	  font-family: monospace;
}


.footer-section ul li a:hover {
    color:#ff6600; /* Slightly darker hover state */
    transform: scale(1.02);
}
	
.footer-section ul li a {
	  text-decoration: none;
	  color: white;
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
<body>
    <!-- Header Section -->
    <div class="navbar">
        <div class="logo">
        <a href="index.jsp">
            <img src="<%= request.getContextPath() %>/images/logo.jpg" alt="Logo"> </a>
        </div>
    </div>

    <!-- Main Content Section -->
    <div class="main-content">
        <div class="image-section">
            <img src="<%= request.getContextPath() %>/images/login2.jpg" alt="Glasses Display">
        </div>
        <div class="login-section">
            <h3>Staff Log In</h3>
            <div class="social-login">
                <button onclick="window.location.href='https://www.google.co.uk/'">Sign up with Google</button>
                <button onclick="window.location.href='https://www.facebook.com/'">Sign up with Facebook</button>
            </div>
            <p class="a" >- OR -</p>
            <form action="StaffLogin" method="post">
                <input type="email" name="email" placeholder="Enter your email" required>
<!--                 <input type="password" id="password" name="password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" placeholder="Enter your password" required>
 --><input type="password" id="password" name="password" placeholder="Enter your password" required>
 			
 			<% String errorMessage = (String) request.getAttribute("error"); %>
 			<% if(errorMessage!=null){ %>
            <p style="color: red;"><%= errorMessage %></p>
            <% } %>
                
                <button type="submit">Log in</button>
            </form>
  
        </div>
    </div>

    <!-- Footer Section -->
    <footer>
        <div class="footer-section">
            <h4>Contact Us</h4>
            <p>METEOR EYEWEAR<br>Jc 2.G,Jalan Bmu 1,<br>Bandar Baru Merlimau Utara,<br> Merlimau 77300,Melaka</p>
            <p>+606-263-1175</p>
            <p>Email: merlimau@meteor-eyewear.com</p>
        </div>
        <div class="footer-section">
            <h4>About Us</h4>
            <ul>
                <li><a href="#">About Us</a></li>
                <li><a href="#">Our Store </a></li>
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
            <h4>Be in Touch</h4>
            <p>Subscribe to our newsletter for the latest updates and promo codes.</p>
            <form action="<%= request.getContextPath() %>/subscribe" method="post">
                <input type="email" name="email" placeholder="Your Email" required>
                <button type="submit">Subscribe</button>
            </form>
        </div>
    </footer>
</body>
</html>