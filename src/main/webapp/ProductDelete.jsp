<%@ page import="java.sql.*" %>
<%@ page import="connection.OracleConnection" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Delete Product</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .form-container {
            background: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 6px 8px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 500px;
            text-align: center;
        }

        h1 {
            color: #f90;
            margin-bottom: 20px;
        }

        ul {
            list-style: none;
            padding: 0;
            margin: 20px 0;
            text-align: left;
        }

        ul li {
            margin-bottom: 10px;
            font-size: 16px;
        }

        strong {
            color: #333;
        }

        .submit-button, .cancel-button {
            padding: 10px 20px;
            font-size: 16px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            margin: 10px 5px;
            text-decoration: none;
        }

        .submit-button {
            background-color: #f90;
            color: white;
        }

        .submit-button:hover {
            background-color: #e68000;
        }

        .cancel-button {
            background-color: #ccc;
            color: #333;
        }

        .cancel-button:hover {
            background-color: #b3b3b3;
        }

        p {
            color: #666;
            margin-top: 20px;
        }
    </style>
</head>
<body>
<%
    // Retrieve the productId from the request
    String productIdParam = request.getParameter("productId");
    int productId = 0;

    // Validate productId
    if (productIdParam == null || productIdParam.trim().isEmpty()) {
        out.println("<p style='color: red;'>Error: Product ID is missing or invalid.</p>");
        return;
    }

    try {
        productId = Integer.parseInt(productIdParam);
    } catch (NumberFormatException e) {
        out.println("<p style='color: red;'>Error: Product ID format is invalid.</p>");
        return;
    }

    // Database connection details
    
    String productName = "";
    String productBrand = "";
    String frameShape = "";
    String frameColor = "";

    // Fetch product details
    try (Connection con = OracleConnection.getConnection()) {
        String query = "SELECT p.PRODUCTNAME, p.PRODUCTBRAND, f.FRAMESHAPE, f.FRAMECOLOR " +
                       "FROM PRODUCT p " +
                       "JOIN FRAME f ON p.PRODUCTID = f.PRODUCTID " +
                       "WHERE p.PRODUCTID = ?";

        try (PreparedStatement ps = con.prepareStatement(query)) {
            ps.setInt(1, productId);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    productName = rs.getString("PRODUCTNAME");
                    productBrand = rs.getString("PRODUCTBRAND");
                    frameShape = rs.getString("FRAMESHAPE");
                    frameColor = rs.getString("FRAMECOLOR");
                } else {
                    out.println("<p style='color: red;'>No product found with the given ID.</p>");
                    return;
                }
            }
        }
    } catch (SQLException e) {
        out.println("<p style='color: red;'>Database error: " + e.getMessage() + "</p>");
    }
%>

<div class="form-container">
    <h1>Delete Product</h1>
    <p>Are you sure you want to delete the following product?</p>
    <ul>
        <li><strong>Product Name:</strong> <%= productName %></li>
        <li><strong>Product Brand:</strong> <%= productBrand %></li>
        <li><strong>Frame Shape:</strong> <%= frameShape %></li>
        <li><strong>Frame Color:</strong> <%= frameColor %></li>
    </ul>
    <form method="POST" action="ProductDelete.jsp">
        <input type="hidden" name="productId" value="<%= productId %>">
        <button type="submit" class="submit-button">Confirm Delete</button>
        <a href="ProductList.jsp" class="cancel-button">Cancel</a>
    </form>
</div>

<%
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        // Perform deletion
        try (Connection con = OracleConnection.getConnection()) {
            // Delete from FRAME table
            String deleteFrameQuery = "DELETE FROM FRAME WHERE PRODUCTID = ?";
            try (PreparedStatement psFrame = con.prepareStatement(deleteFrameQuery)) {
                psFrame.setInt(1, productId);
                psFrame.executeUpdate();
            }

            // Delete from PRODUCT table
            String deleteProductQuery = "DELETE FROM PRODUCT WHERE PRODUCTID = ?";
            try (PreparedStatement psProduct = con.prepareStatement(deleteProductQuery)) {
                psProduct.setInt(1, productId);
                int rowsDeleted = psProduct.executeUpdate();

                if (rowsDeleted > 0) {
                    out.println("<script>alert('Product deleted successfully.'); window.location.href='ProductList.jsp';</script>");
                } else {
                    out.println("<script>alert('No product found with the given ID.');</script>");
                }
            }
        } catch (SQLException e) {
            out.println("<p style='color: red;'>Database error: " + e.getMessage() + "</p>");
        }
    }
%>
</body>
</html>