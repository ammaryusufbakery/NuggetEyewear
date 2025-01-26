<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="connection.OracleConnection" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Phone Number</title>
    <link rel="stylesheet" href="style.css">
    <style>
        body {
            margin: 0;
            color: white;
            background-color: #eaeae1;
        }

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
            color: #e64d00;
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

        .profile-section {
            background-color: white;
            padding: 20px;
            margin: 20px auto;
            width: 500px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            color: black;
            font-family: sans-serif;
        }

        .profile-header {
            display: flex;
            align-items: center;
            gap: 20px;
        }

        .profile-header img {
            height: 100px;
            width: 100px;
            border-radius: 50%;
        }

        .profile-details p {
            margin: 5px 0;
            font-size: 16px;
            color: black;
        }

        footer {
            display: flex;
            justify-content: space-around;
            padding: 20px;
            background-color: #662200;
            font-family: monospace;
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
            color: #ff6600;
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
</head>
<body>

<div class="navbar">
    <div class="logo">
        <a href="index.jsp">
            <img src="images/logo.jpg" alt="Logo">
        </a>
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

<div class="profile-section">
    <% 
    Integer idInt = (Integer) session.getAttribute("id");
    int id = idInt;

    String name=null;
    String email=null;
    String phone=null;
    String address=null;

    try {
    	Connection con = OracleConnection.getConnection();
    	
    	Statement smnt = con.createStatement();
    	
    		ResultSet rs1 = smnt.executeQuery("SELECT * FROM customer WHERE custid=" + id);
    		if(rs1.next()) {
    			name=rs1.getString(2);
    			email=rs1.getString(4);
    			phone=rs1.getString(3);
    			address=rs1.getString(7);
    		}
    	
    	con.close();
    }
    catch (Exception e){
    	System.out.println(e);
    }
    %>
    <div class="profile-header">
        <img src="images/profile.png" alt="User Image">
        <div>
            <h2><%= name %></h2>
        </div><br>
    </div>
    <div class="profile-details">
        <p><strong>Email:</strong> <%= email %></p><br>
        <p><strong>Phone Number:</strong> <%= phone %></p><br>
        <p><strong>Address:</strong> <%= address %></p><br>
    </div>
</div>

<footer>
    <div class="footer-section">
        <h4>Contact Us</h4>
        <p>METEOR EYEWEAR<br>JC 2.G, Jalan BMU 1,<br>Bandar Baru Merlimau Utara,<br>Merlimau 77300, Melaka</p>
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

</body>
</html>