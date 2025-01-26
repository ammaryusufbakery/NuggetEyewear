<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="connection.OracleConnection" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MeteorEyewear</title>
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
            position: relative;
            color: black;
            font-family: sans-serif;
        }

        .save-button {
            position: absolute;
            top: 20px;
            right: 20px;
            background-color: #ffcc00;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 14px;
            font-weight: bold;
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

        .profile-details {
            margin-top: 20px;
        }

        .profile-details p {
            margin: 5px 0;
            font-size: 16px;
            color: black;
        }

        .popup {
            display: none;
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background-color: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            text-align: center;
            z-index: 1000;
            
        }

        .popup p {
            margin: 0 0 20px;
            font-size: 16px;
            color: black;
            font-family: sans-serif;
           
        }

        .popup button {
            background-color: #ffcc00;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
        }

        .overlay {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            z-index: 999;
        }
        
  textarea {
    width: 90%; /* Full width of the parent container */
    max-width: 90%; /* Prevent growing beyond container */
    height: auto; /* Adjusts height dynamically */
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
    font-size: 16px;
    font-family: sans-serif;
    box-shadow: inset 0 1px 3px rgba(0, 0, 0, 0.1);
}
text {
    width: 80%; /* Full width of the parent container */
    max-width: 80%; /* Prevent growing beyond container */
    height: auto; /* Adjusts height dynamically */
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
    font-size: 16px;
    font-family: sans-serif;
    box-shadow: inset 0 1px 3px rgba(0, 0, 0, 0.1);
}
  
 input[type="text"]{
 padding: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
    font-size: 16px;
    font-family: sans-serif;
    box-shadow: inset 0 1px 3px rgba(0, 0, 0, 0.1);
 
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
    <script>
        function showPopup() {
            document.querySelector('.popup').style.display = 'block';
            document.querySelector('.overlay').style.display = 'block';
        }

        function closePopup() {
            document.querySelector('.popup').style.display = 'none';
            document.querySelector('.overlay').style.display = 'none';
        }

        function handleFormSubmission(event) {
            event.preventDefault(); // Prevent default form submission
            showPopup();

            setTimeout(() => {
                event.target.submit(); // Submit the form after showing popup
            }, 1500);
        }
    </script>
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

<%
Integer idInt = (Integer) session.getAttribute("id");
int id = idInt;

int managerid=0;

String name=null;
String role2=null;
String email=null;
String phone=null;
String manager=null;

try {
	Connection con = OracleConnection.getConnection();
	
	Statement smnt = con.createStatement();
	ResultSet rs = smnt.executeQuery("SELECT managerid FROM staff WHERE staffid=" + id);
	if(rs.next()) {
		managerid = rs.getInt(1);
	}
	
	if(managerid!=0){
		ResultSet rs1 = smnt.executeQuery("SELECT * FROM staff worker JOIN staff manager ON worker.managerid = manager.staffid WHERE worker.staffid=" + id);
		if(rs1.next()) {
			name=rs1.getString(2);
			role2=rs1.getString(6);
			email=rs1.getString(4);
			phone=rs1.getString(3);
			manager=rs1.getString(9);
		}
	}
	else{
		ResultSet rs2 = smnt.executeQuery("SELECT * FROM staff WHERE staffid=" + id);
		if(rs2.next()) {
			name=rs2.getString(2);
			role2=rs2.getString(6);
			email=rs2.getString(4);
			phone=rs2.getString(3);
			manager = "-";
		}
	}
	
	con.close();
}
catch (Exception e){
	System.out.println(e);
}
%>

<div class="profile-section">
    <form action="StaffEdit" method="post" onsubmit="handleFormSubmission(event)">
        <div class="profile-header">
            <img src="images/profile.png" alt="User Image">
            <div>
                <h2><%= name %></h2>
                <p><%= role2 %></p>
            </div>
        </div>
        <div class="profile-details">
            <p><strong>Staff ID:</strong> <%= id %></p><br>
            <p><strong>Email:</strong> <%= email %></p><br>
             <p><strong>Phone Number:</strong>
            <input type="text" name="phone" value="<%= phone %>" required></p><br>
            <p><strong>Manager:</strong> <%= manager %></p><br>
           
    

        </div>
        <button type="submit" class="save-button">Save</button>
    </form>
</div>

<div class="overlay" onclick="closePopup()"></div>
<div class="popup">
    <p>Successfully Updated!</p>
    <button onclick="closePopup()">OK</button>
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