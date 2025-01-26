package customer.controller;

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
 * Servlet implementation class CustomerSearch
 */
public class CustomerSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CustomerSearch() {
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
		String ic = request.getParameter("ic");
		int id = 0;
		int profileid=0;
		int orderid=0;
		String name = null;
		String phone = null;
		String email = null;
		String address = null;

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
			ResultSet rs2 = stmnt2.executeQuery("SELECT * FROM profile p1 JOIN (SELECT custid, MAX(profileid) profid FROM profile WHERE custid=" + id + " GROUP BY custid) p2 ON p1.custid=p2.custid AND p1.profileid=p2.profid");
			if(rs2.next()){
				profileid = rs2.getInt(1);
			}
			
			Statement stmnt3 = con.createStatement();
			ResultSet rs3 = stmnt3.executeQuery("SELECT * FROM orderdetails o1 JOIN (SELECT custid, MAX(orderid) orid FROM orderdetails WHERE custid=" + id + " GROUP BY custid) o2 ON o1.custid=o2.custid AND o1.orderid=o2.orid");
			if(rs3.next()){
				orderid = rs3.getInt(1);
			}
		    
		    request.setAttribute("id", id);
		    request.setAttribute("profileid", profileid);
		    request.setAttribute("orderid", orderid);
		    request.setAttribute("name", name);
		    request.setAttribute("phone", phone);
		    request.setAttribute("email", email);
		    request.setAttribute("ic", ic);
		    request.setAttribute("address", address);

		    con.close();
		} 
		
		catch (Exception e) {
		    System.out.println("Error: " + e.getMessage());
		}

		RequestDispatcher req = request.getRequestDispatcher("CustomerSearch.jsp");
		req.forward(request, response);
	}

}
