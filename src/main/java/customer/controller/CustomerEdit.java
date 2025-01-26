package customer.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import connection.OracleConnection;

/**
 * Servlet implementation class CustomerEdit
 */
public class CustomerEdit extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CustomerEdit() {
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
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		HttpSession session = request.getSession(false);
		Integer idInt = (Integer) session.getAttribute("id");
		int id = idInt;
		
		try {
			Connection con = OracleConnection.getConnection();
			
			PreparedStatement ps = con.prepareStatement("UPDATE customer SET custemail=?, custphone=?, custaddress=? WHERE custid=?");
			ps.setString(1, email);
			ps.setString(2, phone);
			ps.setString(3, address);
			ps.setInt(4, id);
			ps.executeUpdate();
			
			con.close();
		}
		catch (Exception e){
			System.out.println(e);
		}
		
		RequestDispatcher req = request.getRequestDispatcher("ProfileCustomerUpdated.jsp");
		req.forward(request, response);
	}
}

