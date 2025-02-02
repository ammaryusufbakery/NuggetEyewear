<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
 <meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>MeteorEyewear</title>
<style>
/* General styling */
body {
     margin: 0;
     color: black;
     background-color:#eaeae;
     font-family: Arial;
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
    font-size: 14px;
    font-weight: bold;
}

.navbar .menu a:hover {
    color:#FFF8DC;
}

.navbar .profile img {
     height: 30px;
     border-radius: 50%;
     margin-left: 8px;

}

        /* Form container for landscape layout */
.form-container {
    display: flex;
    justify-content: center;
    align-items: center;
    min-height: calc(100vh - 120px); /* Full height minus header and footer */
    padding: 20px;
    background-color: #f4f4f4; /* Neutral background */
    background-image: url('images/bg.jpg'); /* Optional */
    background-color:#D2B48C;
    background-size: cover;
    background-position: center;
    background-repeat: no-repeat;
}

.form {
    width: 100%;
    max-width: 500px; /* Narrower for a cleaner, focused layout */
    background-color: #ffffff;
    border-radius: 12px; /* Slightly rounded corners */
    padding: 30px;
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1); /* Softer shadow */
    display: flex;
    flex-direction: column;
    gap: 20px;
}

.form-group {
    display: flex;
    flex-direction: column;
    gap: 10px; /* Consistent spacing */
}

.form-group label {
    font-size: 14px;
    font-weight: 500;
    color: #333; /* Neutral, clean text color */
}

.form-group input, 
.form-group select {
    padding: 14px;
    border: 1px solid #ddd; /* Subtle border */
    border-radius: 8px;
    font-size: 14px;
    background-color: #f9f9f9; /* Slight contrast */
    transition: border-color 0.2s ease, background-color 0.2s ease;
}

.form-group input:focus, 
.form-group select:focus {
    border-color: #1a73e8; /* Modern blue accent */
    background-color: #ffffff; /* Clearer focus */
    outline: none;
    box-shadow: 0 0 4px rgba(26, 115, 232, 0.3);
}

.form-group button {
     padding: 14px;
     margin-left:150px;
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

.form-group button:hover {
    background-color: #ff9900; /* Slightly darker hover state */
    transform: scale(1.02);
}

/* For a cleaner, less cluttered appearance */
.form-group input::placeholder {
    color: #aaa; /* Subtle placeholder text */
    font-size: 13px;
}

a {
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
	  color:white;
}

	
.footer-section h4 {
	  margin-bottom: 10px;
	    font-size: 20px;
	    font-family: monospace;
	    color:white;
}
	
.footer-section ul {
	  list-style: none;
	  padding: 0;
	  font-family: monospace;
	  color:white;
}
	
.footer-section ul li {
	  margin-bottom: 5px;
	  font-family: monospace;
	  color:white;
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
	  color:white;
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
    <!-- Header Section -->
    <div class="navbar">
        <div class="logo">
        <a href="index.jsp">
            <img src="images/logo.jpg" alt="Logo"> </a>
        </div>
    </div>
    <!-- Form container -->
    <div class="form-container">
        <form action="CustomerAdd" method="post" class="form">
        <h1>Sign Up</h1>
            <div class="form-group">
                <label for="name">Name</label>
                <input type="text" id="name" name="name" placeholder="Enter your name" required>
            </div>
            <div class="form-group">
                <label for="phone">Phone Number</label>
                <input type="text" id="phone" name="phone" placeholder="Enter your phone number" required>
            </div>
            <div class="form-group">
                <label for="email">Email</label>
                <input type="email" id="email" name="email" placeholder="Enter your email address" required>
            </div>
            <div class="form-group">
                <label for="ic">IC Number</label>
                <input type="text" id="ic" name="ic" placeholder="Enter your IC number" required>
            </div>
            <div class="form-group">
                <label for="add">Address</label>
                <textarea id="add" name="add" rows="4" cols="50" placeholder="Enter your address" style="resize: none;" required></textarea>
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                 <!-- <input type="password" id="password" name="password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" placeholder="Enter your password" required> -->
            <input type="password" id="password" name="password" placeholder="Enter your password" required>
            </div>
            <div class="form-group">
                <label for="confirmPassword">Confirm Password</label>
                <!-- <input type="password" id="password" name="password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" placeholder="Confirm your password" required> -->
            <input type="password" id="password" name="password" placeholder="Enter your password" required>
            </div>
            <div class="form-group">
                <button type="submit">Register</button>
            </div>
            <p class="a">Already have an account? <a href="<%= request.getContextPath() %>/Login.jsp">Login</a></p>
            
        </form>
    </div>

       <!-- Footer Section -->
    <!-- Footer Section -->
    <footer>
        <div class="footer-section">
            <h4>Contact Us</h4>
            <p>METEOR EYEWEAR<br>10, Jalan Inai 3, Taman Inai<br>Selangor, Malaysia</p>
            <p>+60 3-1234 5678</p>
            <p>Email: info@meteor-eyewear.com</p>
        </div>
        <div class="footer-section">
            <h4>About Us</h4>
            <ul>
                <li><a href="#">About Us</a></li>
                <li><a href="#">Our store</a></li>
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
