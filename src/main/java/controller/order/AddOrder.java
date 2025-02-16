package controller.order;

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

/**
 * Servlet implementation class AddOrder
 */
public class AddOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddOrder() {
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
		
		String ic = request.getParameter("ic");
		int frameid = Integer.parseInt(request.getParameter("frameid"));
		int lensid = Integer.parseInt(request.getParameter("lensid"));
		String ship = request.getParameter("ship");
		String outlets = request.getParameter("outlets");
		String customerAddress = request.getParameter("customerAddress");
		
		String shipAddress = null;
		int custid=0;
		int orderid=0;
		
		if(ship.equals("Yes"))
			shipAddress = outlets;
		else
			shipAddress = customerAddress;
		
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
		
		RequestDispatcher req = request.getRequestDispatcher("OrderDetailsView.jsp?custid=" + custid + "&orderid=" + orderid);
		req.forward(request, response);
	}

}
