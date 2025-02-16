package model.customer;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import connection.OracleConnection;

public class CustomerDAO {
	
	public void addCustomer(int id, String name, String phone, String email, String password, String ic, String address) {
		try {
			Connection con = OracleConnection.getConnection();
			
			PreparedStatement ps1 = con.prepareStatement("INSERT INTO customer(custname, custphone, custemail,  custpass, custic, custaddress) VALUES (?,?,?,?,?,?)");
			
			ps1.setString(1,name);
			ps1.setString(2,phone);
			ps1.setString(3,email);
			ps1.setString(4,password);
			ps1.setString(5,ic);
			ps1.setString(6,address);
			
			
			ps1.executeUpdate();
			
			Statement stmnt2 = con.createStatement();
			ResultSet rs2 = stmnt2.executeQuery("SELECT custid_seq.CURRVAL FROM DUAL");
			while(rs2.next()) {
				id = rs2.getInt(1);
			}
			
			con.close();
		}
		catch (Exception e){
			System.out.println(e);
		}
	}
	
	public void editCustomer(String phone, String email, String address, int id) {
		try {
			Connection con = OracleConnection.getConnection();
			
			PreparedStatement ps = con.prepareStatement("UPDATE customer SET  custphone=?, custemail=?, custaddress=? WHERE custid=?");
			ps.setString(1, phone);
			ps.setString(2, email);
			ps.setString(3, address);
			ps.setInt(4, id);
			ps.executeUpdate();
			
			con.close();
		}
		catch (Exception e){
			System.out.println(e);
		}
	}
	
	public void loginCustomer(String email, String password, int id, String name) {
		try {
			Connection con = OracleConnection.getConnection();
			
			Statement smnt = con.createStatement();
			ResultSet rs = smnt.executeQuery("SELECT * FROM customer WHERE custemail='" + email + "' AND custpass='" + password + "'");
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
	
	public void searchCustomer(String ic, int id, String name, String phone, String email, String address, int profileid, int orderid) {
		try {
		    Connection con = OracleConnection.getConnection();
		    
		    PreparedStatement ps = con.prepareStatement("SELECT * FROM customer WHERE custic = ?");
		    ps.setString(1, ic);
		    
		    ResultSet rs = ps.executeQuery();
		    if (rs.next()) {
		        id = rs.getInt(1);
		        name = rs.getString(2);
		        phone = rs.getString(3);
		        email = rs.getString(4);
		        address = rs.getString(7);
		    }
		    
		    Statement stmnt2 = con.createStatement();
			ResultSet rs2 = stmnt2.executeQuery("SELECT * FROM spectacleprofile p1 JOIN (SELECT custid, MAX(specprofileid) profid FROM spectacleprofile WHERE custid=" + id + " GROUP BY custid) p2 ON p1.custid=p2.custid AND p1.specprofileid=p2.profid");
			if(rs2.next()){
				profileid = rs2.getInt(1);
			}
			
			Statement stmnt3 = con.createStatement();
			ResultSet rs3 = stmnt3.executeQuery("SELECT * FROM orderdetails o1 JOIN (SELECT custid, MAX(orderid) orid FROM orderdetails WHERE custid=" + id + " GROUP BY custid) o2 ON o1.custid=o2.custid AND o1.orderid=o2.orid");
			if(rs3.next()){
				orderid = rs3.getInt(1);
			}

		    con.close();
		} 
		
		catch (Exception e) {
		    System.out.println("Error: " + e.getMessage());
		}
	}
}
