package controller.profile;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import connection.OracleConnection;

/**
 * Servlet implementation class UpdateSpecProfile
 */
public class UpdateSpecProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateSpecProfile() {
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
		int profileid = Integer.parseInt(request.getParameter("profileid"));
		double powerLeft = Double.parseDouble(request.getParameter("eyePowerLeft"));
	    double powerRight = Double.parseDouble(request.getParameter("eyePowerRight"));
	    String prescription = request.getParameter("prescription");
	    String astigmatism = request.getParameter("astigmatism");
	    
	    try {
	    	Connection con = OracleConnection.getConnection();
	    	
	    	String sql = "UPDATE spectacleprofile SET specprofileleft=?, specprofileright=?, specprofileprescription=?, specprofileastigmatism=? WHERE specprofileid=" + profileid;
			PreparedStatement ps = con.prepareStatement(sql);
			
			ps.setDouble(1, powerLeft);
			ps.setDouble(2, powerRight);
			ps.setString(3, prescription);
			ps.setString(4, astigmatism);
			
			ps.executeUpdate();
			con.close();
	    }
	    catch (Exception e){
			System.out.println(e);
		}
	    RequestDispatcher req = request.getRequestDispatcher("saveChanges.jsp?profileid=" + profileid);
		req.forward(request, response);
	}

}
