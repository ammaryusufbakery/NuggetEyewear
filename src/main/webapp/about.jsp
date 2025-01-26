<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>MeteorEyewear</title>
</head>
<style>
/* General Reset */
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
/* Main content styles */
main .about-us {
    padding: 2rem 1rem;
    color:black;
    font-family: sans-serif;
}

main .about-us .container {
    max-width: 800px;
    margin: 0 auto;
}
main .about-us h2 {
    text-align: center;
    font-size:26px;
    margin-bottom: 1.5rem;
    color: #000000;
     font-family: Andale Mono, monospace;
}
.about-box {
     background-color:#D2B48C;
    padding: 1.5rem;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}
.about-box table {
    width: 100%;
    border-collapse: collapse;
}
.about-box table th,
.about-box table td {
    padding: 1rem;
    text-align: left;
    border-bottom: 2px solid #ddd;
}
.about-box table th {
    background-color: #ffcc99;
    font-weight: bold;
    color: #444;
}
.about-box table td ul {
    margin: 0;
    padding-left: 1.2rem;
    list-style-type: disc;
}
.about-box table tr:last-child td {
    border-bottom: none;
}
/* Footer Section */
footer {
	  display: flex;
	  justify-content: space-around;
	  padding: 20px;
	  background-color:#662200;
	  font-family: monospace;
	  font-size:12px;
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
        </div>
    </div>
    
     <main>
        <section class="about-us">
            <div class="container">
                <h2>ABOUT US</h2>
                <div class="about-box">
                    <table>
                        <tr>
                            <th>Our Mission</th>
                            <td>
                                To enhance vision and style by providing high-quality, innovative eyewear that combines functionality and modern design.
                            </td>
                        </tr>
                        <tr>
                            <th>Our Vision</th>
                            <td>
                                To become a global leader in eyewear solutions, known for sustainability, technology, and customer satisfaction.
                            </td>
                        </tr>
                        <tr>
                            <th>Our Values</th>
                            <td>
                                <ul>
                                    <li>Quality craftsmanship</li>
                                    <li>Customer-first approach</li>
                                    <li>Innovation and sustainability</li>
                                    <li>Style and comfort</li>
                                </ul>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </section>
</main>
    
    
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
</body>
</html>