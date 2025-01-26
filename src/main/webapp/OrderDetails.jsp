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
            font-family: sans-serif;
            color: white;
            background-color: #eaeae1;
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

/* Main Section */
main {
	 padding: 20px;
	 text-align: center;
	 color : black;
}
	
.back-button {
	text-align: left;
	margin-bottom: 20px;
}
	
.back-button a {
	display: inline-block;
	color:white;
	text-decoration: none;
	font-size: 14px;
	font-weight: bold;
	padding: 10px 15px;
	background-color: #a4713d;
	border-radius: 5px;
	transition: background-color 0.3s;
}
.back-button a:hover {
	  background-color: #c4a484;
	  color: black;
}
	
h1 {
	   color: #333;
	   font-size: 24px;
	   margin-bottom: 20px;
	   text-align:center;
}
	
form {
	max-width: 600px;
	margin: 0 auto;
	background-color: #fff;
	padding: 20px;
	border-radius: 10px;
	box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
	text-align: left;
}
.a{
	display : flex;
    gap : 10px;
}
form select, form textarea {
	 width: 100%;
	 padding: 8px;
	 margin-top: 10px;
	 border: 1px solid #ccc;
	           border-radius: 5px;
}
            
.outlets {
 margin-bottom:2px;
  display: inline-block;
}

.outlets-content {
  display: none;
  position: absolute;
  background-color: #f9f9f9;
  min-width: 160px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  padding: 12px 16px;
  
}
form .submit-button {
    background-color: #ff471a;
    color: #fff;
    border: none;
    padding: 10px 20px;
    margin-top: 20px;
    margin-left:245px;
    cursor: pointer;
    border-radius: 5px;
    font-size: 14px;
    width: 100px;
    font-weight: bold;
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
	

footer  input {
	  padding: 5px;
	  margin-right: 10px;
}
	
footer  button {
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
        else if(role.equals("staff")){ %>
        	<a href="AddProduct.jsp">PRODUCT</a>
            <a href="spectacleProfile.jsp">SPECTACLE PROFILE</a>
            <a href="OrderDetails.jsp">ORDER</a>
            <a href="CustomerSearch.jsp">CUSTOMER</a>
            <a href="StaffLogout">log out</a>
        <%
        }%>
        </div>
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
        }%>
        </div>
    </div>
     <!-- Main Content -->
    <main>
    <!-- <div class="back-button"> 
    <a href="index.jsp">&#x2190; Back</a>
</div>-->
       
        <form action="AddOrder" method="post">
         <h1>Order Details</h1>
        <div class = "a">
            <label for="ic">Customer IC Number :</label>
            <input type="text" id="ic" name="ic" value="<%=request.getParameter("ic") %>" readonly/>
		</div>
		<br>
		<div class = "a">
            <label for="frameid">Frame ID :</label>
            <input type="text" id="frameid" name="frameid"/>
		</div>
		<br>
		<div class = "a">
            <label for="lensid">Lens ID :</label>
            <input type="text" id="lensid" name="lensid"/>
		</div>
           <p>Ship to outlet?</p>
            <div class="radio-group">
                <input type="radio" id="shipYes" name="ship" value="Yes" onclick="toggleSelection()">
                <label for="shipYes">Yes</label>

                <input type="radio" id="shipNo" name="ship" value="No" onclick="toggleSelection()">
                <label for="shipNo">No</label>
            </div>
            
            <p id="outletLabel" style="display: none;">Select Outlet</p>
           <div class="outlets" id="outletDiv" style="display: none;">
    		<select name="outlets" id="outlets">
		        <option value="Merlimau">Merlimau</option>
		        <option value="Masjid Tanah">Masjid Tanah</option>
		        <option value="Bemban">Bemban</option>
		        <option value="Duyong">Duyong</option>
		        <option value="Krubong">Krubong</option>
		        <option value="Alor Gajah">Alor Gajah</option>
    		</select>
			</div>
           
          <br><label for="customerAddress" id="addressLabel" style="display: none;">Customer Address</label>
            <textarea id="customerAddress" name="customerAddress" rows="4" cols="50" style="display: none; resize: none; width: 97%;"></textarea>

 
           <button type="submit" class="submit-button">Submit</button> 
        </form>
    </main>
    
    <script>
    function toggleSelection() {
        // Get the value of the selected radio button
        var shipToOutlet = document.querySelector('input[name="ship"]:checked').value;

        // Get the outlet and address elements
        var outletDiv = document.getElementById("outletDiv");
        var outletLabel = document.getElementById("outletLabel");
        var customerAddress = document.getElementById("customerAddress");
        var addressLabel = document.getElementById("addressLabel");

        // Show/hide elements based on the selected option
        if (shipToOutlet === "Yes") {
            outletDiv.style.display = "block";
            outletLabel.style.display = "block";
            customerAddress.style.display = "none";
            addressLabel.style.display = "none";
        } else {
            outletDiv.style.display = "none";
            outletLabel.style.display = "none";
            customerAddress.style.display = "block";
            addressLabel.style.display = "block";
        }
    }
</script>
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
           
                <input type="email" placeholder="Your Email">
                <button type="submit">Subscribe</button>
      
   
        </div>
    </footer>

</body>
</html>