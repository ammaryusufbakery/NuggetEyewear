<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
   <title>MeteorEyewear</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" rel="stylesheet">
    <link rel="stylesheet" href="styles/stores.css">
</head>
<style>
/* General Reset */
body {
    margin: 0;
    color: white;
    background-color:#eaeae1;
    font-family: Andale Mono, monospace;   
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
h2 {
    text-align: center;
    font-size:26px;
    margin-bottom: 1.5rem;
    color: #000000;
}

/* Main content styles */
.store-list {
    display: flex;
    flex-wrap: wrap;
    gap: 20px;
    justify-content: center;
    margin-top:20px;
    margin-bottom:50px;
    
}

.store {
    background: #fff;
    border: 1px solid #ddd;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    padding: 15px;
    width: 300px;
    text-align: left;
    color:black;
    background-color:#D2B48C;
    font-family: cursive;
}


.store h3 {
    margin: 0 0 10px;
    font-size: 1.2rem;
    color: #444;
}

.store p {
    margin: 5px 0;
    font-size: 0.9rem;
    line-height: 1.4;
    display: flex;
    align-items: center;
}

.store p i  {
    margin-right: 8px;
    color: #003366;
    font-size: 1rem;
}

.store a {
    color: black;
    text-decoration: none;
    font-weight: bold;
}

.store a:hover {
    text-decoration: underline;
}

/* Footer Section */
footer {
	  display: flex;
	  justify-content: space-around;
	  padding: 20px;
	  background-color:#662200;
	  font-size:12px
	  
}

	
.footer-section h4 {
	  margin-bottom: 10px;
	  font-size: 20px;
	  
}
	
.footer-section ul {
	  list-style: none;
	  padding: 0;

}
	
.footer-section ul li {
	  margin-bottom: 5px;
	
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
        </div>
    </div>
     <h2>OUR STORE</h2>
    <div class="store-list">
        <div class="store">
            <h3>Meteor Eyewear - Duyong </h3>
            <p><i class="fas fa-map-marker-alt"></i> 9a, Jalan Seri Duyong 1/2, Taman Seri Duyong, 75460 Ayer Molek, Melaka</p>
            <p><i class="fas fa-phone"></i> 06-281 5678</p>
            <p><i class="fas fa-envelope"></i> duyong@meteor-eyewear.com</p>
            <p><i class="fab fa-whatsapp"></i> 017-818 1135</p>
            <p><i class="fas fa-location-arrow"></i> <a href="https://www.waze.com/live-map/directions/my/melaka/ayer-molek/meteor-eyewear-%28duyong-outlet%29?to=place.ChIJJ_RF0Pru0TERY-maL5BJPMo" target="_blank">Google Maps</a></p>
        </div>
        <div class="store">
            <h3>Meteor Eyewear - Krubong </h3>
            <p><i class="fas fa-map-marker-alt"></i> Jalan Pantai Belimbing, Kampung Krubong, 75260 Melaka</p>
            <p><i class="fas fa-phone"></i> 06-282 9012</p>
            <p><i class="fas fa-envelope"></i> krubong@meteor-eyewear.com</p>
            <p><i class="fab fa-whatsapp"></i>  017-575 5778</p>
            <p><i class="fas fa-location-arrow"></i> <a href="https://www.waze.com/live-map/directions/my/melaka/melaka/meteor-eyewear-%28krubong-outlet%29?to=place.ChIJq67mHC770TERfoVcccZZnV0" target="_blank">Google Maps</a></p>
        </div>
        <div class="store">
            <h3>Meteor Eyewear - Alor Gajah </h3>
            <p><i class="fas fa-map-marker-alt"></i> km18-1, jalan perniagaan jelatang Pusat Perniagaan Jelatang, 78000 Alor Gajah, Melaka</p>
            <p><i class="fas fa-phone"></i> 06-283 5678</p>
            <p><i class="fas fa-envelope"></i> alorgajah@meteor-eyewear.com</p>
            <p><i class="fab fa-whatsapp"></i> 010-820 3838</p>
            <p><i class="fas fa-location-arrow"></i> <a href="https://www.waze.com/ms/live-map/directions/my/melaka/alor-gajah/meteor-eyewear-%28alor-gajah%29?to=place.ChIJzbHX_psDzjER27i9SSJMovY" target="_blank">Google Maps</a></p>
        </div>
         <div class="store">
            <h3>Meteor Eyewear - Masjid Tanah </h3>
            <p><i class="fas fa-map-marker-alt"></i> MT1419, Kompleks Perniagaan, Masjid Tanah, 78300, Melaka</p>
            <p><i class="fas fa-phone"></i> 06-384 8566</p>
            <p><i class="fas fa-envelope"></i> masjidtanah@meteor-eyewear.com</p>
            <p><i class="fab fa-whatsapp"></i>  012-882 2196</p>
            <p><i class="fas fa-location-arrow"></i> <a href="https://www.waze.com/live-map/directions/my/melaka/masjid-tanah/meteor-eyewear-(masjid-tanah-outlet)?to=place.ChIJp4OMsx7_0TER8h8qEIJSsYQ" target="_blank">Google Maps</a></p>
        </div>
         <div class="store">
            <h3>Meteor Eyewear - Bemban </h3>
            <p><i class="fas fa-map-marker-alt"></i> JC533, Jln Bestari 5, BANDAR JASIN BESTARI, 77200 Bemban, Melaka</p>
            <p><i class="fas fa-phone"></i> 06-223 5768</p>
            <p><i class="fas fa-envelope"></i> benbanmelaka@meteor-eyewear.com</p>
            <p><i class="fab fa-whatsapp"></i> 016-735 5688</p>
            <p><i class="fas fa-location-arrow"></i> <a href="https://www.waze.com/ms/live-map/directions/my/melaka/alor-gajah/meteor-eyewear-%28alor-gajah%29?to=place.ChIJzbHX_psDzjER27i9SSJMovY" target="_blank">Google Maps</a></p>
        </div>
         <div class="store">
            <h3>Meteor Eyewear - Tampin </h3>
            <p><i class="fas fa-map-marker-alt"></i> JPS 4, 2, Seksyen 1, Bandar Satelit Sebang, 78000 Alor Gajah, Melaka</p>
            <p><i class="fas fa-phone"></i> 06-233 5096</p>
            <p><i class="fas fa-envelope"></i> tampinmelakah@meteor-eyewear.com</p>
            <p><i class="fab fa-whatsapp"></i> 017-622 1288</p>
            <p><i class="fas fa-location-arrow"></i> <a href="https://www.waze.com/live-map/directions/my/melaka/alor-gajah/meteor-eyewear-tampin?to=place.ChIJFYVI3-kDzjERoyL3C-dCe3kY" target="_blank">Google Maps</a></p>
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
                <li><a href="#">Our Store</a></li>
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

</body>
</html>