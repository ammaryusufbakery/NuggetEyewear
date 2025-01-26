package product.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import connection.OracleConnection;
import product.model.Product;

public class ProductDAO {
Connection con = null;
PreparedStatement stmt = null;
PreparedStatement stmt2 = null;
    // Database credentials
//    private static final String DB_URL = "jdbc:oracle:thin:@localhost:1521:xe";  // Modify based on your DB setup
//    private static final String DB_USER = "system";
//    private static final String DB_PASSWORD = "ADIB123";

    // Method to insert product
    public boolean insertProduct(Product product) {
        String query = "INSERT INTO product (productname, productbrand) VALUES (?, ?)";
        String query2 = "INSERT INTO frame (productid, frameshape, framecolor) VALUES (productid_seq.currval, ?, ?)";
        try {
        	con = OracleConnection.getConnection();
        	
            stmt = con.prepareStatement(query);
            stmt2 = con.prepareStatement(query2);
             
            stmt.setString(1, product.getProductName());
            stmt.setString(2, product.getProductBrand());
            stmt2.setString(1, product.getFrameShape());
            stmt2.setString(2, product.getFrameColor());

            stmt.executeUpdate();
            stmt2.executeUpdate();
            
            con.close();

            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    
  

}
