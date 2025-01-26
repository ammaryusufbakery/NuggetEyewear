<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="connection.OracleConnection" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MeteorEyewear</title>
    <link rel="stylesheet" href="style.css">
    <style>
        /* Reset default margins and paddings */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        html, body {
            margin: 0;
            padding: 0;
            font-family: sans-serif;
            height: 100%; /* Ensures body spans the viewport height */
            color : white ;
            background-color: #eaeae1;
        }

        /* Wrapper to manage header, main content, and footer */
        .wrapper {
            display: flex;
            flex-direction: column;
            min-height: 100vh; /* Makes the wrapper span the full height of the viewport */
        }

        main {
            flex: 1; /* Ensures the main content fills available space */
	 padding: 20px;
	 text-align: center;
	 color : black;
}
	

        header {
            background-color: #662200;
            padding: 10px 20px;
        }

        header .navbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            font-family: monospace;
        }

        header .navbar .menu a {
            margin: 0 15px;
            text-decoration: none;
            color: white;
            font-size: 20px;
            font-weight: bold;
        }

        header .navbar .menu a:hover {
            color: #e64d00;
        }

        header .navbar .profile img {
            height: 30px;
            border-radius: 50%;
            margin-left: 8px;
        }
        
        h1 {
	   color: #333;
	   font-size: 30px;
	   margin-bottom: 20px;
	   text-align:center;
}
        
        td, th {
        border: 1px solid #444444; /* Darker border for contrast */
        text-align: left;
        padding: 8px;
        background-color: white ;
       }
       
       th{
         background-color: #CC9966;
       }
       
       button {
	  padding: 5px 10px;
	  background-color: #f90;
	  color: white;
	  border: none;
	  cursor: pointer;
	  }

        /* Footer Styling */
        footer {
            display: flex;
            justify-content: space-around;
            padding: 20px;
            background-color: #662200;
            color: white;
            font-family: monospace;
            
        }

        footer .footer-section h4 {
            margin-bottom: 10px;
            font-size: 20px;
        }

        footer .footer-section ul {
            list-style: none;
            padding: 0;
        }

        footer .footer-section ul li {
            margin-bottom: 5px;
        }

        footer .footer-section ul li a {
            text-decoration: none;
            color: white;
        }

        footer .footer-section ul li a:hover {
            color: #ff6600;
            transform: scale(1.02);
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
    <div class="wrapper">
        <!-- Header Section -->
        <header>
            <div class="navbar">
                <div class="logo">
                    <a href="index.jsp">
                        <img src="images/logo.jpg" alt="Logo" style="height: 50px; border-radius: 50%;">
                    </a>
                </div>
                <div class="menu">
                    <a href="AddProduct.jsp">PRODUCT</a>
                    <a href="spectacleProfile.jsp">SPECTACLE PROFILE</a>
                    <a href="OrderDetails.jsp">ORDER</a>
                </div>
                <div class="profile">
                    <img src="images/profile.png" alt="Profile">
                </div>
            </div>
        </header>

        <!-- Main Content Section -->
    <main>
    <br>
    <h1 style="color: black;">Product Available</h1>
    <br>
    <!-- Search Bar -->
    <form method="GET" action="ProductList.jsp">
        <input type="text" name="search" placeholder="Search by Frame Shape or Color" 
               value="<%= request.getParameter("search") != null ? request.getParameter("search") : "" %>" 
               style="color: black; font-size: 16px;">
        <button type="submit">Search</button>
    </form>
    <br><br>

    <!-- Frames Table -->
    <table border="1" style="width: 100%; border-collapse: collapse; background-color: #eaeae1;">
    <tr>
        <th style="color: black;">Product ID</th>
        <th style="color: black;">Product Name</th>
        <th style="color: black;">Product Brand</th>
        <th style="color: black;">Frame Shape</th>
        <th style="color: black;">Frame Color</th>
        <th style="color: black;">Actions</th>
    </tr>
    <%
        String search = request.getParameter("search");

        // Updated SQL query with JOIN
        String query = "SELECT f.PRODUCTID, f.FRAMESHAPE, f.FRAMECOLOR, p.PRODUCTNAME, p.PRODUCTBRAND " +
                       "FROM Frame f " +
                       "JOIN PRODUCT p ON f.PRODUCTID = p.PRODUCTID";

        // Add search functionality
        if (search != null && !search.trim().isEmpty()) {
            query += " WHERE LOWER(f.FRAMESHAPE) LIKE ? OR LOWER(f.FRAMECOLOR) LIKE ? OR LOWER(p.PRODUCTNAME) LIKE ? OR LOWER(p.PRODUCTBRAND) LIKE ?";
        }

        try (Connection connection = OracleConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {

            if (search != null && !search.trim().isEmpty()) {
                String searchPattern = "%" + search.toLowerCase() + "%";
                statement.setString(1, searchPattern);
                statement.setString(2, searchPattern);
                statement.setString(3, searchPattern);
                statement.setString(4, searchPattern);
            }

            try (ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    int productId = resultSet.getInt("PRODUCTID");
                    String frameShape = resultSet.getString("FRAMESHAPE");
                    String frameColor = resultSet.getString("FRAMECOLOR");
                    String productName = resultSet.getString("PRODUCTNAME");
                    String productBrand = resultSet.getString("PRODUCTBRAND");
    %>
    <tr>
        <td style="color: black;"><%= productId %></td>
        <td style="color: black;"><%= productName != null ? productName : "N/A" %></td>
        <td style="color: black;"><%= productBrand != null ? productBrand : "N/A" %></td>
        <td style="color: black;"><%= frameShape != null ? frameShape : "N/A" %></td>
        <td style="color: black;"><%= frameColor != null ? frameColor : "N/A" %></td>
        <td>
            <button onclick="window.location.href='ProductUpdate.jsp?productId=<%= productId %>'" style="margin-right: 10px;">Update</button>
            <button onclick="window.location.href='ProductDelete.jsp?productId=<%= productId %>'">Delete</button>
        </td>
    </tr>
    <%
                }
            }
        } catch (SQLException e) {
            out.println("<tr><td colspan='6' style='color: black;'>Error fetching frames: " + e.getMessage() + "</td></tr>");
        }
    %>
</table>

<script>
function updateProduct(productId) {
    if (!productId) {
        alert("Invalid product ID!");
        return;
    }
    window.location.href = 'ProductUpdate.jsp?productId=${productId}';
}



    function deleteProduct(productId) {
        // Confirm deletion before proceeding
        if (confirm(`Are you sure you want to delete Product ID ${productId}?`)) {
            // Redirect to the delete action with the product ID
            window.location.href = 'ProductDelete.jsp?productId=${productId}';
        }
    }
</script>

    <br>
    <button type="button" onclick="location.href='ProductAdd.jsp';">ADD NEW PRODUCT</button>
</main>

        <!-- Footer Section -->
        <footer>
            <div class="footer-section">
                <h4>Contact Us</h4>
                <p>METEOR EYEWEAR<br>Jc 2.G, Jalan Bmu 1,<br>Bandar Baru Merlimau Utara,<br>Merlimau 77300, Melaka</p>
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
                <br>
                    <input type="email" placeholder="Your Email">
                    <button type="submit">Subscribe</button>
                </form>
            </div>
        </footer>
    </div>
</body>
</html>
