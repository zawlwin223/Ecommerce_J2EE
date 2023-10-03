

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 * Servlet implementation class login
 */
public class login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		response.setContentType("text/html");
		PrintWriter pw=response.getWriter();
		String admin_name=request.getParameter("admin_name");
		String password=request.getParameter("password");
		
		Connection con; PreparedStatement ps; ResultSet res;
		try {
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost/ecommerce","root","root");
		    ps=con.prepareStatement("select * from admin");
		   
		    res=ps.executeQuery();
		    while(res.next()) {
			String nam=res.getString(1);
			String pas=res.getString(2);
			System.out.print(nam);
			System.out.print(pas);
			System.out.print(admin_name);
			System.out.print(password);
			  if (admin_name.equals(nam) &&password.equals(pas)) {
		            // Authentication successful
		            response.sendRedirect("/Ecommerce_Project/dashboard.jsp"); // Redirect to a welcome page
		        } else {
		            // Authentication failed
		            response.sendRedirect("/Ecommerce_Project/login_error.jsp"); // Redirect back to the login page
		        }
			

		}
		  }catch(Exception e) {
			e.printStackTrace();
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
