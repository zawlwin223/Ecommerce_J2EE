

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;


public class Edit2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter pw=response.getWriter();
		
		Connection con; PreparedStatement ps; int status=0;
		try {
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost/ecommerce","root","root");
			ps=con.prepareStatement("update products set Name=?, Category=?, Price=?, tag=? ,file=? where id=?");
			String sid=request.getParameter("id");
			int id=Integer.parseInt(sid);
		
			String product_name=request.getParameter("product_name");
			String category_name=request.getParameter("category_name");
			String price=request.getParameter("price");
			String tag=request.getParameter("tag");
			String fl = request.getParameter("file");
		    System.out.println(fl);
		
			ps.setString(1,product_name);
			ps.setString(2,category_name);
			ps.setString(3,price);
			ps.setString(4,tag);
			ps.setString(5, fl);
			ps.setInt(6, id);
			System.out.print(product_name);
			System.out.print(category_name);
			System.out.print(price);
			System.out.print(tag);
	
			System.out.print(id);
			
		status=ps.executeUpdate();	
		
		
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		if(status>0) {
			response.sendRedirect("product_view.jsp");
		}
		else {
			pw.println("<font color=red> Unable to update the record!</font>");
		}
	}

}
