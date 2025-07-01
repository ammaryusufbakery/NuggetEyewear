package model.product;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import connection.OracleConnection;
import model.product.Product;

public class ProductDAO {
Connection con = null;
PreparedStatement stmt = null;
PreparedStatement stmt2 = null;

    // Method to insert product
    public boolean insertFrame(Product product) {
        String query = "INSERT INTO product (productprice, productname, productbrand) VALUES (?, ?, ?)";
        String query2 = "INSERT INTO frame (frameshape, framecolor, productid) VALUES (?, ?, ?)";
        int productId = 0;
        
        try {
        	con = OracleConnection.getConnection();
        	
            stmt = con.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
             
            stmt.setDouble(1, product.getProductPrice());
            stmt.setString(2, product.getProductName());
            stmt.setString(3, product.getProductBrand());

            stmt.executeUpdate();

            /*if (rs1.next()) {
                productId = rs1.getInt("CURR_VAL");
            }*/

            ResultSet rs2 = stmt.getGeneratedKeys();
			while(rs2.next()) {
				productId = rs2.getInt(1);
			}
            
            stmt2 = con.prepareStatement(query2);
            
            stmt2.setString(1, product.getFrameShape());
            stmt2.setString(2, product.getFrameColor());
            stmt2.setInt(3, productId);

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
        String query2 = "INSERT INTO lens (lensprescription, lensastigmatism, productid) VALUES (?, ?, ?)";
        int productId = 0;
        
        try {
        	con = OracleConnection.getConnection();
        	
            stmt = con.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            
            stmt.setDouble(1, product.getProductPrice());
            stmt.setString(2, product.getProductName());
            stmt.setString(3, product.getProductBrand());

            stmt.executeUpdate();

            /*if (rs1.next()) {
                productId = rs1.getInt("CURR_VAL");
            }*/

            ResultSet rs2 = stmt.getGeneratedKeys();
			while(rs2.next()) {
				productId = rs2.getInt(1);
			}
            
            stmt2 = con.prepareStatement(query2);
            
            stmt2.setString(1, product.getLensPrescription());
            stmt2.setString(2, product.getLensAstigmatism());
            stmt2.setInt(3, productId);
            
            stmt2.executeUpdate();
            
            con.close();

            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

}
