<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="connection.OracleConnection" %>
<%@ page import="java.sql.*" %>
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

/*main*/
main {
            max-width: 800px;
            margin: 20px auto;
            padding: 20px;
            border-radius: 10px;
            color:black;
}

	

h1 {
            text-align: center;
            font-size: 24px;
            margin-bottom: 20px;
            font-family: sans-serif;
            color: black;
}

     .back-button {
	text-align: left;
	margin-top: 20px;
	margin-left:20px;
	
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

.edit-button {
            margin-top: 20px;
            margin-left:230px;
            padding: 10px 20px;
            background-color: #ffcc00;
            border: none;
            color: white;
            font-weight: bold;
            cursor: pointer;
            border-radius: 5px;
            width:100px;
}


a {
	     color: #fff;
	     text-decoration: none;
	     margin-bottom: 20px;
}

a:hover {
   		text-decoration: underline;
}
        
form {
	    display: flex;
	    flex-direction: column;
	    max-width: 600px;
	    margin-top:10px;
	    margin-left:100px;
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
       		<a href="Login.jsp">LOG IN</a>
            <a href="Signup.jsp">SIGN UP</a>
        <%	
        }
        else if(role.equals("staff")){ %>
        	<a href="ProductList.jsp">PRODUCT</a>
            <a href="CustomerSearch.jsp">CUSTOMER</a>
            <a href="StaffLogout">LOG OUT</a>
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
    
<div class="back-button">
    <a href="CustomerSearch.jsp">&#x2190; Back</a>
</div>

<main>
  
<div class="profile-form">
<%
int profileid = Integer.parseInt(request.getParameter("profileid"));
String name=null;
String phone=null;
String email=null;
String ic=null;
double powerLeft=0;
double powerRight=0;
String prescription=null;
String astigmatism=null;

try{
	Connection con = OracleConnection.getConnection();
	Statement stmnt = con.createStatement();
	ResultSet rs = stmnt.executeQuery("SELECT * FROM spectacleprofile JOIN customer ON spectacleprofile.custid = customer.custid WHERE specprofileid=" + profileid);
	while(rs.next()){
		name = rs.getString(8);
		phone = rs.getString(9);
		email = rs.getString(10);
		ic = rs.getString(12);
		powerLeft = rs.getDouble(2);
		powerRight = rs.getDouble(3);
		prescription = rs.getString(4);
		astigmatism = rs.getString(5);
	}
	con.close();
	
}
catch (Exception e){
	System.out.println(e);
}
%>
  <%
	if(profileid==0){%>
		<form>
			<p><strong>No Spectacle Profile Record Found!</strong></p>
		</form>
	<%}
	else{%>
<form action="spectacleProfileUpdate.jsp" method="post">



<h1>Spectacle Profile Details</h1>
    <input type="hidden" name="profileid" value="<%= profileid %>">
    
    <p><strong>Customer Name:</strong> <%= name %></p>
    <input type="hidden" name="name" value="<%= name %>">
    
    <p><strong>Customer Phone Number:</strong> <%= phone %></p>
    <input type="hidden" name="phone" value="<%= phone %>">
    
    <p><strong>Customer Email Address:</strong> <%= email %></p>
    <input type="hidden" name="email" value="<%= email %>">
    
    <p><strong>Customer IC Number:</strong> <%= ic %></p>
    <input type="hidden" name="ic" value="<%= ic %>">
    
    <p><strong>Eye Power Left:</strong>  <%= powerLeft %></p>
    <input type="hidden" name="eyePowerLeft" value="<%= powerLeft %>">
    
    <p><strong>Eye Power Right:</strong>  <%= powerRight %></p>
    <input type="hidden" name="eyePowerRight" value="<%= powerRight %>">
    
    <p><strong>Prescription:</strong> <%= prescription %></p>
    <input type="hidden" name="prescription" value="<%= prescription %>">
    
    <p><strong>Astigmatism:</strong> <%= astigmatism %></p>
    <input type="hidden" name="astigmatism" value="<%= astigmatism %>">
    
    <button type="submit" class="edit-button">Edit</button>
     <%}%>
</form>
</div>
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
