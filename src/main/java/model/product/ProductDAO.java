package model.product;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import connection.OracleConnection;
import model.product.Product;

public class ProductDAO {
Connection con = null;
PreparedStatement stmt = null;
PreparedStatement stmt2 = null;

    // Method to insert product
    public boolean insertFrame(Product product) {
        String query = "INSERT INTO product (productprice, productname, productbrand) VALUES (?, ?, ?)";
        String query2 = "INSERT INTO frame (frameshape, framecolor, productid) VALUES (?, ?, productid_seq.currval)";
        
        try {
        	con = OracleConnection.getConnection();
        	
            stmt = con.prepareStatement(query);
            stmt2 = con.prepareStatement(query2);
             
            stmt.setDouble(1, product.getProductPrice());
            stmt.setString(2, product.getProductName());
            stmt.setString(3, product.getProductBrand());
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
    
    public boolean insertLens(Product product) {
        String query = "INSERT INTO product (productprice, productname, productbrand) VALUES (?, ?, ?)";
        String query2 = "INSERT INTO lens (lensprescription, lensastigmatism, productid) VALUES (?, ?, productid_seq.currval)";
        
        try {
        	con = OracleConnection.getConnection();
        	
            stmt = con.prepareStatement(query);
            stmt2 = con.prepareStatement(query2);
             
            stmt.setDouble(1, product.getProductPrice());
            stmt.setString(2, product.getProductName());
            stmt.setString(3, product.getProductBrand());
            stmt2.setString(1, product.getLensPrescription());
            stmt2.setString(2, product.getLensAstigmatism());

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