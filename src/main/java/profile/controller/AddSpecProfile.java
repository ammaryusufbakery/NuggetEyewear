package profile.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import connection.OracleConnection;

/**
 * Servlet implementation class AddSpecProfile
 */
public class AddSpecProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddSpecProfile() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		//retrieve input from HTML
				String ic = request.getParameter("ic");
				double powerLeft = Double.parseDouble(request.getParameter("eyePowerLeft"));
				double powerRight = Double.parseDouble(request.getParameter("eyePowerRight"));
				String prescription = request.getParameter("prescription");
				String astigmatism = request.getParameter("astigmatism");
				int custid = 0;
				int profileid = 0;
				
				try {
					Connection con = OracleConnection.getConnection();
					
					PreparedStatement ps1 = con.prepareStatement("SELECT * FROM customer WHERE custic=?");
					
					ps1.setString(1,ic);
					
					ResultSet rs1 = ps1.executeQuery();
					while(rs1.next()) {
						custid = rs1.getInt(1);
					}
					System.out.println(custid);
					
					/*
					 * Statement stmnt1 = con.createStatement(); ResultSet rs1 =
					 * stmnt1.executeQuery("SELECT * FROM customer WHERE custic='" + ic + "'");
					 * System.out.println(ic); if(rs1.next()) { custid = rs1.getInt(1);
					 * System.out.println(rs1.getString(2)); } System.out.println(custid);
					 */
					
					//String sql = "INSERT INTO profile VALUES(profileid_seq.NEXTVAL, ?,?,?,?,?)";
					String sql = "INSERT INTO spectacleprofile(specprofileleft, specprofileright, specprofileprescription, specprofileastigmatism, custid) VALUES(?,?,?,?,?)";
					PreparedStatement ps = con.prepareStatement(sql);
					
					ps.setDouble(1, powerLeft);
					ps.setDouble(2, powerRight);
					ps.setString(3, prescription);
					ps.setString(4, astigmatism);
					ps.setInt(5, custid);
					
					ps.executeUpdate();
					
					Statement stmnt2 = con.createStatement();
					ResultSet rs2 = stmnt2.executeQuery("SELECT SCOPE_IDENTITY()");
					while(rs2.next()) {
						profileid = rs2.getInt(1);
					}
					System.out.println(profileid);
					
					con.close();
				}
				catch (Exception e){
					System.out.println(e);
				}
				
				RequestDispatcher req = request.getRequestDispatcher("spectacleProfileView.jsp?profileid=" + profileid);
				req.forward(request, response);
			}
	}
