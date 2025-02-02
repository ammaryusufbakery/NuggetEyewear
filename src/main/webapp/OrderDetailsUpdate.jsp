<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="connection.OracleConnection" %>
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
     <!-- Main Content -->
    
    <div class="back-button"> 
    <a href="CustomerSearch.jsp">&#x2190; Back</a>
</div>

<main>
    

<%
int orderid = Integer.parseInt(request.getParameter("orderid"));
int custid = Integer.parseInt(request.getParameter("custid"));

String name=null;
String phone=null;
String email=null;
String ic=null;
double powerLeft=0;
double powerRight=0;
String prescription=null;
String astigmatism=null;
String shipAddress=null;

try{
	Connection con = OracleConnection.getConnection();
	
	Statement stmnt1 = con.createStatement();
	ResultSet rs1 = stmnt1.executeQuery("SELECT * FROM customer WHERE custid=" + custid);
	while(rs1.next()){
		name = rs1.getString(2);
		phone = rs1.getString(3);
		email = rs1.getString(4);
		ic = rs1.getString(6);
	}
	
	Statement stmnt2 = con.createStatement();
	ResultSet rs2 = stmnt2.executeQuery("SELECT * FROM spectacleprofile p1 JOIN (SELECT custid, MAX(specprofileid) profid FROM spectacleprofile WHERE custid=" + custid + " GROUP BY custid) p2 ON p1.custid=p2.custid AND p1.specprofileid=p2.profid");
	while(rs2.next()){
		powerLeft = rs2.getDouble(2);
		powerRight = rs2.getDouble(3);
		prescription = rs2.getString(4);
		astigmatism = rs2.getString(5);
	}
	
	Statement stmnt3 = con.createStatement();
	ResultSet rs3 = stmnt3.executeQuery("SELECT * FROM orderdetails WHERE orderid=" + orderid);
	while(rs3.next()){
		shipAddress=rs3.getString(2);
	}
	
	con.close();
}
catch (Exception e){
	System.out.println(e);
	System.out.println("sini error 2");
}
%>
       
        <form action="UpdateOrder" method="post">
         <h1>Order Details</h1>
         <input type="hidden" name="orderid" value="<%= orderid %>">
         <input type="hidden" name="custid" value="<%= custid %>">
        
        <p><strong>Customer Name:</strong> <%= name %></p>
    <input type="hidden" name="name" value="<%= name %>" readonly>
    
    <p><strong>Customer Phone Number:</strong> <%= phone %></p>
    <input type="hidden" name="phone" value="<%= phone %>" readonly>
    
    <p><strong>Customer Email Address:</strong> <%= email %></p>
    <input type="hidden" name="email" value="<%= email %>" readonly>
    
    <p><strong>Customer IC Number:</strong> <%= ic %></p>
    <input type="hidden" name="ic" value="<%= ic %>" readonly>
           
            
           
            <p><strong>Eye Power Left:</strong>  <%= powerLeft %></p>
    		<input type="hidden" name="eyePowerLeft" value="<%= powerLeft %>" readonly>
    
   		 	<p><strong>Eye Power Right:</strong>  <%= powerRight %></p>
    		<input type="hidden" name="eyePowerRight" value="<%= powerRight %>" readonly>
    
    		<p><strong>Prescription:</strong> <%= prescription %> </p>
    		<input type="hidden" name="prescription" value="<%= prescription %>" readonly>
     
    		<p><strong>Astigmatism:</strong> <%= astigmatism %> </p>
    		<input type="hidden" name="astigmatism" value="<%= astigmatism %>" readonly>
    		
    		<!-- <br><br><label for="customerAddress">Ship Address</label> -->
    		<h1>Ship Address</h1>
            <textarea id="shipAdress" name="shipAddress" rows="4" cols="50" style="resize: none; width: 97%;"><%= shipAddress %> </textarea>

 
           <button type="submit" class="submit-button">Save</button> 
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