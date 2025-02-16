package model.profile;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import connection.OracleConnection;

public class ProfileDAO {
	
	public void addSpecProfile(String ic, int custid, double powerLeft, double powerRight, String prescription, String astigmatism, int profileid) {
		try {
			Connection con = OracleConnection.getConnection();
			
			PreparedStatement ps1 = con.prepareStatement("SELECT * FROM customer WHERE custic=?");
			
			ps1.setString(1,ic);
			
			ResultSet rs1 = ps1.executeQuery();
			while(rs1.next()) {
				custid = rs1.getInt(1);
			}
			
			String sql = "INSERT INTO spectacleprofile(specprofileleft, specprofileright, specprofileprescription, specprofileastigmatism, custid) VALUES(?,?,?,?,?)";
			PreparedStatement ps = con.prepareStatement(sql);
			
			ps.setDouble(1, powerLeft);
			ps.setDouble(2, powerRight);
			ps.setString(3, prescription);
			ps.setString(4, astigmatism);
			ps.setInt(5, custid);
			
			ps.executeUpdate();
			
			Statement stmnt2 = con.createStatement();
			ResultSet rs2 = stmnt2.executeQuery("SELECT specprofileid_seq.CURRVAL FROM DUAL");
			while(rs2.next()) {
				profileid = rs2.getInt(1);
			}
			
			con.close();
		}
		catch (Exception e){
			System.out.println(e);
		}
	}
	
	public void editSpecProfile(int profileid, double powerLeft, double powerRight, String prescription, String astigmatism) {
		try {
	    	Connection con = OracleConnection.getConnection();
	    	
	    	String sql = "UPDATE spectacleprofile SET specprofileleft=?, specprofileright=?, specprofileprescription=?, specprofileastigmatism=? WHERE specprofileid=" + profileid;
			PreparedStatement ps = con.prepareStatement(sql);
			
			ps.setDouble(1, powerLeft);
			ps.setDouble(2, powerRight);
			ps.setString(3, prescription);
			ps.setString(4, astigmatism);
			
			ps.executeUpdate();
			con.close();
	    }
	    catch (Exception e){
			System.out.println(e);
		}
	}
}
