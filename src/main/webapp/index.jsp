<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MeteorEyewear</title>
    <link rel="stylesheet" href="style.css">
</head>
<style>
body {
    margin: 0;
    color: white;
    background-color:#eaeae1;
    
}

/* Navbar Styling */
.navbar {
    font-family: Andale Mono, monospace;
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
    padding-top : 10px;

}

.profile {
display: flex;
}

/* Banner Section */
.banner {
    position: relative;
    height: 50%;
    overflow: hidden;
}

.banner-image {
    width: 1350px;
    height: 500px;
    
}

.banner-overlay {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: rgba(0, 0, 0, 0.5); /* Add a dark overlay */
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    text-align: center;
    color: #fff;
    padding: 20px;
    box-sizing: border-box;
}

.banner-overlay h1 {
    font-size: 24px;
    margin-bottom: 20px;
    line-height: 1.5;
    font-family: cursive;
}


/* Featured Products */
.featured-products {
    padding: 40px;
    text-align: center;
    background-color:#eaeae1;
    
}

.featured-products h2 {
    color: black;
    margin-bottom: 10px;
    font-family: Andale Mono, monospace;
    
}
.featured-products p {
    color:#5a5a3f;
    margin-bottom: 20px;
    font-family: Andale Mono, monospace;
    
}

.product-grid {
    display: flex;
    gap: 20px;
    justify-content: center;
    flex-wrap: wrap;
}

.product-card {
    background-color:#ffe6cc;
    border: 1px solid #ddd;
    border-radius: 8px;
    padding: 10px;
    width: 250px;
    text-align: center;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    margin-right:10px;
    margin-left:10px;
    
}

.product-card img {
    width: 100%;
    border-radius: 8px;
}

.product-card h3 {
    font-size: 14px;
    color: #444;
    margin: 10px 0 5px;
    font-family: sans-serif;
}

.product-card p {
    font-size: 14px;
    color:#abab87;
    margin: 0;
    font-family: cursive;
    
}

.product-card .price {
    color: #e64d00;
    font-weight: bold;
    margin: 10px 0;
    font-family: sans-serif;
    font-size: 13px;
    
}

.product-card .old-price {
    text-decoration: line-through;
    color: #444;
    font-size: 14px;
    margin-right: 5px;
    font-family: sans-serif;
    font-size: 13px;
}

.product-card .discount {
    color: white;
    background-color: #e64d00;
    padding: 2px 5px;
    border-radius: 5px;
    font-size: 12px;
    display: inline-block;
    margin-bottom: 10px;
}
/* Brand */
.brands-container {
    text-align: center;
    padding: 20px;
    margin-bottom:20px;
}

.title {
    font-size: 24px;
    font-weight: bold;
    margin-bottom: 20px;
    color: #000;
    font-family: Andale Mono, monospace;
    
}
.brands-carousel {
    display: flex;
    align-items: center;
    justify-content: center;
    position: relative;
    max-width: 100%;
    margin: 0 auto;
    overflow: hidden;
}
.brands {
    display: flex;
    gap: 30px;
    transition: transform 0.5s ease-in-out;
}

.brand img {
    max-width: 150px;
    max-height: 100px;
    display: block;
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
            <img src="images/logo.jpg" alt="Logo"></a>
        </div>
        <div class="menu">
        <%
        String role = (String) session.getAttribute("role");
        if(role==null){ %>
       		<a href="#">FRAME</a>
            <a href="#">LENS</a>
       		<a href="Login.jsp">log in</a>
            <a href="Signup.jsp">sign up</a>
        <%	
        } 
        else if (role.equals("customer")){ 
        Integer custidInt = (Integer) session.getAttribute("id");
		int custid = custidInt;%>
        	<a href="#">FRAME</a>
            <a href="#">LENS</a>
            <a href="CustomerSpectacleProfile.jsp?custid=<%= custid%>">SPECTACLE PROFILE</a>
            <a href="CustomerOrderDetails.jsp?custid=<%= custid%>">ORDER</a>
            <a href="StaffLogout">log out</a>
        <%
        }
        else{ %>
        	<a href="AddProduct.jsp">PRODUCT</a>
            <a href="spectacleProfile.jsp">SPECTACLE PROFILE</a>
            <a href="OrderDetails.jsp">ORDER</a>
            <a href="CustomerSearch.jsp">CUSTOMER</a>
            <a href="StaffLogout">log out</a>
        <%
        }%>
        </div>
       
            <!-- <a href="#">FRAME</a>
            <a href="#">LENS</a>
            <a href="spectacleProfile.jsp">SPECTACLE PROFILE</a>
            <a href="OrderDetails.jsp">ORDER</a>
            <a href="Login.jsp">log in</a>
            <a href="Signup.jsp">sign up</a> -->
        
        <div class="profile">
        <%
        if(role!=null && role.equals("staff")){ %>
       		<div>
        		<p>Welcome, ${name}</p>
        	</div>
        	<div>
        		<a href="ProfileStaffView.jsp">
            	<img src="images/profile.png" alt="Profile"></a>
        	</div>
        <%	
        } 
        else if(role!=null && role.equals("customer")){ %>
    	<div>
        		<p>Welcome, ${name}</p>
        	</div>
        	<div>
        		<a href="ProfileCustomerView.jsp">
            	<img src="images/profile.png" alt="Profile"></a>
        	</div>
    	<%
    	}%>
        	<!-- <div>
        		<p>Welcome</p>
        	</div>
        	<div>
        		<a href="ProfileStaffView.jsp">
            	<img src="images/profile.png" alt="Profile"></a>
        	</div> -->
        </div> 
    </div> 

 <!-- Main Banner Section -->
<div class="banner">
    <img id="banner-image" src="images/a.jpg" alt="Sunglasses" class="banner-image">
</div>
 <!-- Featured Products Section -->
    <section class="featured-products">
        <h2>NEW ARRIVALS</h2>
        <p>New products available now</p>
           <div class="product-grid">
            <!-- Product 1 -->
             <div class="product-card">
                <img src="images/new1.jpg" alt="Ray-Ban">
                <div class="discount">-20%</div>
                <h3>GUESS</h3>
                <p>GUESS SP 5766 size:50 Eyeglasses</p>
                <div>
                    <span class="old-price">RM 929.00</span>
                    <span class="price">RM 557.40</span>
                </div>
            </div>
            <!-- Product 2 -->
            <div class="product-card">
                <img src="images/new2.jpg" alt="Vogue">
                <div class="discount">-20%</div>
                <h3>VOGUE</h3>
                <p>VOGUE SP 3552 size:53 Eyeglasses</p>
                <div>
                    <span class="old-price">RM 470.00</span>
                    <span class="price">RM 383.20</span>
                </div>
            </div>
            <!-- Product 3 -->
                <div class="product-card">
                <img src="images/new4.jpg" alt="Ray-Ban 4">
                <div class="discount">-20%</div>
                <h3>ASHLEY LOLA</h3>
                <p>ASHLEY SP 9331 size:53 Eyeglasses</p>
                <div>
                    <span class="old-price">RM 589.00</span>
                    <span class="price">RM 412.30</span>
                </div>
            </div>
            <!-- Product 4 -->
        
             <div class="product-card">
                <img src="images/new6.jpg" alt="Ray-Ban">
                <div class="discount">-20%</div>
                <h3>RAYBAN</h3>
                <p>RAY BAN SP 5766 size:50 Eyeglasses</p>
                <div>
                    <span class="old-price">RM 580.00</span>
                    <span class="price">RM 412.30</span>
                </div>
            </div>
        </div>
    </section>
    <!-- Brand  -->
    <div class="brands-container">
        <h1 class="title">TOP BRANDS</h1>
        <div class="brands-carousel">

            <div class="brands">
                <div class="brand"><img src="images/ashley.png" alt="Ashley"></div>
                <div class="brand"><img src="images/guess.png" alt="Guess"></div>
                <div class="brand"><img src="images/rayban1.png" alt="Rayban"></div>
                <div class="brand"><img src="images/coach.png" alt="Rayban"></div>
                <div class="brand"><img src="images/shinakaya.png" alt="Shinayakana"></div>
                <div class="brand"><img src="images/vogue.png" alt="Vogue"></div>
                <div class="brand"><img src="images/whoosh.png" alt="Whoosh"></div>
      
            </div>
         
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
                <input type="email" placeholder="Your Email">
                <button type="submit">Subscribe</button>
            </form>
            
        </div>
        
</footer>
    
<script>
    let images = [
        "images/aaa.jpg",
        "images/a.jpg",
   
        // Add more image paths as needed
    ];

    let currentIndex = 0;
    const bannerImage = document.getElementById('banner-image');

    function changeImage() {
        currentIndex++;
        if (currentIndex >= images.length) {
            currentIndex = 0; // Reset to the first image after the last
        }
        bannerImage.src = images[currentIndex];
    }

    // Change the image every 5 seconds
    setInterval(changeImage, 2000);
    
</script>
</body>
</html>
