import java.io.*;
//import java.util.*;
import java.sql.*;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import javax.servlet.*;

@WebServlet(urlPatterns = {"/DeleteServlet"})
public class DeleteServlet extends HttpServlet {

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
        
        Integer delete  = Integer.valueOf(request.getParameter("delete"));
        response.setContentType("text/html");
        
       System.out.println(delete);

        try {
            // Load the database driver
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(connectionURL, "root", "130708");
            //Add the data into the database
            String sql = "DELETE FROM doctorlib.rdv WHERE ID = ? ";
            
            

            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, delete);
            

            Statement s = connection.createStatement();
            int i = preparedStatement.executeUpdate();
            System.out.println(i);
          
            /*PreparedStatement pstmt = connection.prepareStatement("INSERT OVERWRITE doctorlib.logeduser(email) VALUES (?)");
			  pstmt.clearParameters();       // Clears any previous parameters
			  
			  pstmt.setString(1, userid);
			  pstmt.executeUpdate();

	 System.out.println("\nConnection Successful..... creating statement....");*/
           

            if(i!=0) {
                // redirect or print but not both...
                response.sendRedirect("components/doctorRdv.jsp");
                // response.sendRedirect("index_true.jsp");
            } else if(i==0) {
                out.println("Faire une fenetre pop up ?");
            }
        } catch(Exception e) {
            System.out.println("Exception is: " + e);
        } finally {
            // TODO: check for nullity
            
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
