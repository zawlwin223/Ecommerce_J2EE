

import jakarta.servlet.ServletException;
import org.json.*; 
   
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.Enumeration;
@WebServlet("/Ecommerce_Project/Order")
/**
 * Servlet implementation class Order
 */
public class Order extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Order() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		PrintWriter pw = response.getWriter();

		// TODO Auto-generated method stub
	
		   StringBuilder sb = new StringBuilder();
		   
		    BufferedReader reader = request.getReader();
		    try {
		        String line;
		        while ((line = reader.readLine()) != null) {
		            sb.append(line).append('\n');
		        }
		    } finally {
		        reader.close();
		    }
		  
		    
		    String jsonString = sb.toString();
		    JSONObject jsonObject = new JSONObject(jsonString);
		    
		    JSONArray product = jsonObject.getJSONArray("product");
		    String first_name = jsonObject.getString("firstName");
		    String last_name = jsonObject.getString("lastName");
		    String address = jsonObject.getString("address");
		    String city = jsonObject.getString("city");
		    String phone = jsonObject.getString("phone");
		    String email = jsonObject.getString("email");
		    String zip = jsonObject.getString("zip");
		    String country = jsonObject.getString("country");
		    String order_id = jsonObject.getString("order_id");
		   System.out.print(order_id);
		    
		    System.out.print("It works");
		    int total = jsonObject.getInt("total");
		    
			Connection con ; PreparedStatement ps,ps_order ; int status = 0 ;
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				con = DriverManager.getConnection("jdbc:mysql://localhost/ecommerce","root","root");
			
				ps = con.prepareStatement("insert into user(Order_Id,Name,Email,Address,City,Phone,Zip,Country)values(?,?,?,?,?,?,?,?)");
				ps_order =  con.prepareStatement("insert into userOrder(Order_Id,userName,orderProduct,quantity,price,totalPrice,Image,category,brand,size)values(?,?,?,?,?,?,?,?,?,?)");
				
				ps.setString(1,order_id);
				ps.setString(2,first_name+" "+last_name);
				ps.setString(3,email);
				ps.setString(4,address);
				ps.setString(5,city);
				ps.setString(6,phone);
				ps.setString(7,zip);
				ps.setString(8,country);
			
				
				ps.executeUpdate();
				
			    for (int i = 0; i < product.length(); i++) {  
		              
		            // store each object in JSONObject  
		            JSONObject explrObject = product.getJSONObject(i);  
		            System.out.print(explrObject.getString("size"));
		            // get field value from JSONObject using get() method  
		            ps_order.setString(1,order_id);
					ps_order.setString(2,first_name+" "+last_name);
					ps_order.setString(3,explrObject.getString("title"));
					ps_order.setInt(4,explrObject.getInt("qty"));
					ps_order.setInt(5,explrObject.getInt("price"));
					ps_order.setInt(6,total);
					ps_order.setString(7,explrObject.getString("img"));
					ps_order.setString(8,explrObject.getString("category"));
					ps_order.setString(9,explrObject.getString("brand"));
					ps_order.setString(10,explrObject.getString("size"));
					  System.out.print("Hello World");
					 ps_order.executeUpdate();
						 
		        }  
			    con.close();  
			    System.out.print(order_id);
			    response.sendRedirect( "order_confirm.jsp?id="+order_id);
			   

				
			
				
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
