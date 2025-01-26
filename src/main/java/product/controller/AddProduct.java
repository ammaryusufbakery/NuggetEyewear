package product.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
 
import connection.OracleConnection;
import product.dao.ProductDAO;
import product.model.Product;

/**
 * Servlet implementation class AddProductController
 */
public class AddProduct extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get form data
        String productName = request.getParameter("productName");
        String productBrand = request.getParameter("productBrand");
        String frameShape = request.getParameter("frameShape");
        String frameColor = request.getParameter("frameColor");

        // Create a product object
        Product product = new Product();
        
        product.setProductName(productName);
        product.setProductBrand(productBrand);
        product.setFrameShape(frameShape);
        product.setFrameColor(frameColor);

        // Insert the product into the database
        ProductDAO productDAO = new ProductDAO();
        boolean isInserted = productDAO.insertProduct(product);

        // Provide feedback to the user
        if (isInserted) {
            response.sendRedirect("ProductList.jsp");  // Redirect to a success page
        } else {
            response.sendRedirect("error.jsp");  // Redirect to an error page if insertion failed
        }
    }
}
