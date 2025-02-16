package model.staff;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import connection.OracleConnection;

public class StaffDAO {
	
	public void editStaff(String phone, int id) {
		try {
			Connection con = OracleConnection.getConnection();
			
			PreparedStatement ps = con.prepareStatement("UPDATE staff SET staffphone=? WHERE staffid=?");
			ps.setString(1, phone);
			ps.setInt(2, id);
			ps.executeUpdate();
			
			con.close();
		}
		catch (Exception e){
			System.out.println(e);
		}
	}
	
	public void loginStaff(String email, String password, int id, String name) {
		try {
			Connection con = OracleConnection.getConnection();
			
			Statement smnt = con.createStatement();
			ResultSet rs = smnt.executeQuery("SELECT * FROM staff WHERE staffemail='" + email + "' AND staffpass='" + password + "'");
			if(rs.next()) {
				id = rs.getInt(1);
				name = rs.getString(2);
			}
			
			con.close();
		}
		catch (Exception e){
			System.out.println(e);
		}
	}
}
