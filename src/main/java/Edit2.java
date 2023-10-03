import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

public class edit2 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter pw=response.getWriter();
		
		pw.println("<h1>Update Employee</h1>");		
		Connection con; PreparedStatement ps; ResultSet res;
		try {
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost/ecommerce","root","root");
		    ps=con.prepareStatement("select * from products where ID=?");
		    String sid=request.getParameter("ID");
			int id=Integer.parseInt(sid);
		    ps.setInt(1, id);
		    res=ps.executeQuery();
		    while(res.next()) {
			String nam=res.getString(2);
			String pas=res.getString(3);
			String ema=res.getString(4);
			String cit=res.getString(5);
			pw.println("<form action='Edit2' method='post'>");
			pw.print("<table>");
			pw.print("<tr><td></td><td><input type='hidden' name='id' value='"+id+"'></td></tr>");
			pw.print("<tr><td>Name: </td><td><input type='text' name='n1' value='"+nam+"'></td></tr>");
			pw.print("<tr><td>Password: </td><td><input type='password' name='p1' value='"+pas+"'></td></tr>");
			pw.print("<tr><td>Email: </td><td><input type='email' name='e1' value='"+ema+"'></td></tr>");
			pw.print("<tr><td>City: </td><td>");
			pw.print("<select name='c1' value='"+cit+"'>");
			pw.print("<option>Sittway</option>");
			pw.print("<option>Kyaukphyu</option>");
			pw.print("<option>Taungkok</option>");
			pw.print("<option>Myebon</option></select></td></tr>");
			pw.print("<tr><td></td><td><input type='submit' value='Edit &amp; Save'></td>");
			pw.print("</table>");
			pw.print("</form>");
		}
		  }catch(Exception e) {
			e.printStackTrace();
		}
	}

}