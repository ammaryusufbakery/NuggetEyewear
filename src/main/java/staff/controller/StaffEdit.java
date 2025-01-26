package staff.controller;

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
 * Servlet implementation class StaffEdit
 */
public class StaffEdit extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StaffEdit() {
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
		String phone = request.getParameter("phone");
		HttpSession session = request.getSession(false);
		Integer idInt = (Integer) session.getAttribute("id");
		int id = idInt;
		
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
		
		RequestDispatcher req = request.getRequestDispatcher("ProfileStaffUpdated.jsp");
		req.forward(request, response);
	}

}
