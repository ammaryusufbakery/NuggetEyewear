package controller.product;

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
import model.product.Product;
import model.product.ProductDAO;

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
        String lensPrescription = request.getParameter("lensPrescription");
        String lensAstigmatism = request.getParameter("lensAstigmatism");
        double productPrice = Double.parseDouble(request.getParameter("productPrice"));

        // Create a product object
        Product product = new Product();
        
        product.setProductName(productName);
        product.setProductBrand(productBrand);
        product.setFrameShape(frameShape);
        product.setFrameColor(frameColor);
        product.setLensPrescription(lensPrescription);
        product.setLensAstigmatism(lensAstigmatism);
        product.setProductPrice(productPrice);

        // Insert the product into the database
        ProductDAO productDAO = new ProductDAO();
        boolean isInserted=false;
        if(frameShape!=null)
        	isInserted = productDAO.insertFrame(product);
        else
        	isInserted = productDAO.insertLens(product);

        // Provide feedback to the user
        if (isInserted) {
            response.sendRedirect("ProductList.jsp");  // Redirect to a success page
        } else {
            response.sendRedirect("error.jsp");  // Redirect to an error page if insertion failed
        }
    }
}
