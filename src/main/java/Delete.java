import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;

public class Delete extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		//PrintWriter pw=response.getWriter();
		System.out.print("This shit works");
		Connection con; PreparedStatement ps;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost/ecommerce","root","root");
			ps=con.prepareStatement("delete from products where ID=?");	
			String eid=request.getParameter("ID");
			int id=Integer.parseInt(eid);
			System.out.print(id);
			ps.setInt(1,id);			
			ps.executeUpdate();				
			
		con.close();
		
		}catch(Exception e) {
			e.printStackTrace();
		}
				
	     response.sendRedirect("product_view.jsp"); 	
		
	}

}
