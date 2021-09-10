import java.io.*;
//import java.util.*;
import java.sql.*;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import javax.servlet.*;

@WebServlet(urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private ServletConfig config;

    public void init (ServletConfig config) 
    throws ServletException{
        this.config = config;
    }

public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException {
        PrintWriter out = response.getWriter();
        String connectionURL = "jdbc:mysql://localhost/doctorlib";
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet rs = null;
        String userid = request.getParameter("email");
        String password = request.getParameter("password");
        response.setContentType("text/html");
        
        /*out.println(userid);
        out.println(password);
        out.println("OK");*/

        try {
            // Load the database driver
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(connectionURL, "root", "130708");
            //Add the data into the database
            String sql = "SELECT * FROM patientdatabase WHERE email = ? AND password = ?";
            
            

            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, userid);
            preparedStatement.setString(2, password);

            Statement s = connection.createStatement();
            rs =preparedStatement.executeQuery();
            
            		
            PreparedStatement pstmt = connection.prepareStatement("UPDATE doctorlib.logeduser SET email = ? WHERE ID = 1 ");
			pstmt.clearParameters();       // Clears any previous parameters
			  
			pstmt.setString(1, userid);
			pstmt.executeUpdate();
            
            /*PreparedStatement pstmt = connection.prepareStatement("INSERT OVERWRITE doctorlib.logeduser(email) VALUES (?)");
			  pstmt.clearParameters();       // Clears any previous parameters
			  
			  pstmt.setString(1, userid);
			  pstmt.executeUpdate();

	 System.out.println("\nConnection Successful..... creating statement....");*/
           

            if(rs.next()) {
                // redirect or print but not both...
                response.sendRedirect("components/booking.jsp");
                // response.sendRedirect("index_true.jsp");
            } else {
                out.println("You are not valid");
            }
        } catch(Exception e) {
            System.out.println("Exception is: " + e);
        } finally {
            // TODO: check for nullity
            try {
				rs.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
            try {
				preparedStatement.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
            try {
				connection.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
        }
	}
}
