

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

/**
 * Servlet implementation class Create
 */
public class Create extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Create() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		PrintWriter pw = response.getWriter();
		// TODO Auto-generated method stub
		String product_name = request.getParameter("product_name");
		String category_name = request.getParameter("category_name");
		String price = request.getParameter("price");
		String file = request.getParameter("file");
		String tag = request.getParameter("tag");

		
		Connection con ; PreparedStatement ps,ps_cate ; int status = 0 ;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost/ecommerce","root","root");
		
			ps = con.prepareStatement("insert into products(Name,Category,Price,tag,file)values(?,?,?,?,?)");
			ps_cate = con.prepareStatement("insert into category(Category,tag)values(?,?)");
		
			
			ps.setString(1,product_name);
			ps.setString(2,category_name);
			ps.setString(3,price);
			ps.setString(4,tag);
			ps.setString(5,file);
			ps_cate.setString(1, category_name);
			ps_cate.setString(2, tag);
			ps.executeUpdate();
			ps_cate.executeUpdate();
			con.close();
			response.sendRedirect("product_view.jsp");
			pw.println("Success");
		
			
		}catch(Exception e) {
			pw.print("Error");
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
