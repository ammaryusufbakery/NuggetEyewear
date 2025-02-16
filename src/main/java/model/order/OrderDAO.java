package model.order;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import connection.OracleConnection;

public class OrderDAO {
	
	public void addOrder(String ic, int custid, String shipAddress, int frameid, int lensid, int orderid) {
		try {
			Connection con = OracleConnection.getConnection();
			
			PreparedStatement ps1 = con.prepareStatement("SELECT * FROM customer WHERE custic=?");
			ps1.setString(1,ic);
			ResultSet rs1 = ps1.executeQuery();
			while(rs1.next()) {
				custid = rs1.getInt(1);
			}

			String sql = ("INSERT INTO orderdetails(shipaddress, frameid, lensid, custid) VALUES (?,?,?,?)");
			PreparedStatement ps2 = con.prepareStatement(sql);
			ps2.setString(1, shipAddress);
			ps2.setInt(2, frameid);
			ps2.setInt(3, lensid);
			ps2.setInt(4, custid);
			ps2.executeUpdate();
			
			Statement stmnt = con.createStatement();
			ResultSet rs2 = stmnt.executeQuery("SELECT orderid_seq.CURRVAL FROM DUAL");
			while(rs2.next()) {
				orderid = rs2.getInt(1);
			}
			
			con.close();
		}
		catch (Exception e){
			System.out.println(e);
		}
	}
	
	public void editOrder(String address, int orderid) {
		try {
			Connection con = OracleConnection.getConnection();
			
			PreparedStatement ps1 = con.prepareStatement("UPDATE orderdetails SET shipaddress=? WHERE orderid=?");
			ps1.setString(1,address);
			ps1.setInt(2,orderid);
			ps1.executeUpdate();
			
			con.close();
		}
		catch (Exception e){
			System.out.println(e);
		}
	}
}
