package order.controller;

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
 * Servlet implementation class UpdateOrder
 */
public class UpdateOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateOrder() {
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
		int orderid = Integer.parseInt(request.getParameter("orderid"));
		int custid = Integer.parseInt(request.getParameter("custid"));
		String address = request.getParameter("shipAddress");
		
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
		
		RequestDispatcher req = request.getRequestDispatcher("OrderDetailsView.jsp?custid=" + custid + "&orderid=" + orderid);
		req.forward(request, response);
	}

}
