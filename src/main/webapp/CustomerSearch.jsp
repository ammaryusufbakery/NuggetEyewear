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

table{
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
        		<p>Welcome, ${sessionScope.name}</p>
        	</div>
        	<div>
        		<a href="ProfileStaffView.jsp">
            	<img src="images/profile.png" alt="Profile"></a>
        	</div>
        <%	
        }%>
        </div>
    </div>
    <main>

    <form action="CustomerSearch" method="post">
     <h1>Search Customer</h1>
     <label for="ic">Customer IC Number</label>
    <input type="text" id="ic" name="ic" required>
    <button class="aa"type="submit">Submit</button>
    <br>
    
    <%
    String name = (String) request.getAttribute("name");
	String phone = (String) request.getAttribute("phone");
	String email = (String) request.getAttribute("email");
	String address = (String) request.getAttribute("address");
	String ic = (String) request.getAttribute("ic");
    
    if(name!=null){
    	Integer profileidInt = (Integer) request.getAttribute("profileid");
    	int profileid = profileidInt;
    	Integer orderidInt = (Integer) request.getAttribute("orderid");
    	int orderid = orderidInt;
    	Integer custidInt = (Integer) request.getAttribute("id");
    	int custid = custidInt;
    %>
    <table border="1">
    <tr>
    	<th>Name</th>
    	<th>Phone</th>
    	<th>Email</th>
    	<th>Address</th>
    	<th colspan="2">Spectacle Profile</th>
    	<th colspan="2">Order</th>
    </tr>
    <tr>
    	<td><%=name %></td>
    	<td><%=phone %></td>
    	<td><%=email %></td>
    	<td><%=address %></td>
    	<td><a href="spectacleProfile.jsp?ic=<%=ic %>">Create</a></td>
    	<td><a href="spectacleProfileView.jsp?profileid=<%=profileid %>">View</a></td>
    	<td><a href="OrderDetails.jsp?ic=<%=ic %>">Create</a></td>
    	<td><a href="OrderDetailsView.jsp?orderid=<%=orderid %>&custid=<%=custid %>">View</a></td>
    </tr>
    </table>
    <% } %>
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