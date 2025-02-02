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

main {
            max-width: 800px;
            margin: 20px auto;
            padding: 20px;
            border-radius: 10px;
             font-family: sans-serif;
            
        }
       



        h1 {
            text-align: center;
            font-size: 24px;
            margin-bottom: 20px;
            font-family: sans-serif;
            color: black;
        }
        
        h2 {
            text-align: center;
            font-size: 20px;
            margin-bottom: 20px;
            font-family: sans-serif;
            color: black;
        }


        label {
            font-weight: bold;
            margin-top: 10px;
        }

        input, select {
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .aa {
            margin-top: 20px;
            margin-left:230px;
            padding: 10px 20px;
            background-color: #ff6600;
            border: none;
            color: white;
            font-weight: bold;
            cursor: pointer;
            border-radius: 5px;
            width:150px;
        }


        a:hover {
            text-decoration: underline;
        }
        
    form {
    display: flex;
    flex-direction: column;
    max-width: 600px;
    margin: 0 auto;
    background-color: #fff;
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); /* Optional: adds a subtle shadow */
    
    }

    form label{
    font-weight: bold;
    margin-top: 15px;
    display: block;
    text-align: left;
    font-size: 14px;
    font-family: sans-serif;
    color: black;
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
       		<a href="CustomerFrame.jsp">PRODUCT</a>
       		<a href="Login.jsp">log in</a>
            <a href="Signup.jsp">sign up</a>
        <%	
        } 
        else if (role.equals("customer")){ 
        Integer custidInt = (Integer) session.getAttribute("id");
		int custid = custidInt;%>
        	<a href="CustomerFrame.jsp">PRODUCT</a>
            <a href="CustomerSpectacleProfile.jsp?custid=<%= custid%>">SPECTACLE PROFILE</a>
            <a href="CustomerOrderDetails.jsp?custid=<%= custid%>">ORDER</a>
            <a href="StaffLogout">log out</a>
        <%
        }
        %>
        </div>
        <div class="profile">
        <%	
        if(role!=null && role.equals("customer")){ %>
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

    <form action="" method="post">
    <h1>Sign Up Successful</h1>
    <h2><a href="index.jsp">Proceed to homepage</a></h2>
</form>
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