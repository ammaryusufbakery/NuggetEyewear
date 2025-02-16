package controller.customer;

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
import java.sql.ResultSet;
import java.sql.Statement;

import connection.OracleConnection;

/**
 * Servlet implementation class CustomerAdd
 */
public class CustomerAdd extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CustomerAdd() {
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
		int id=0;
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String ic = request.getParameter("ic");
		String address = request.getParameter("add");
		String password = request.getParameter("password");
		
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
		
		HttpSession session = request.getSession();
		session.setAttribute("id", id);
		session.setAttribute("name", name);
		session.setAttribute("role", "customer");
		RequestDispatcher req = request.getRequestDispatcher("SignupSuccess.jsp");
		req.forward(request, response);
	}

}
