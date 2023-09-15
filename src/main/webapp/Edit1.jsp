<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement "%>
<%@page import="java.sql.Connection"%>

<%
String id = request.getParameter("userId");
String driverName = "com.mysql.cj.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost/ecommerce";
String userId = "root";
String password = "root";

try {
Class.forName(driverName);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}

Connection con = null;
PreparedStatement ps = null;
ResultSet res = null;
%>
<h2 align="center"><font><strong>Edit Product</strong></font></h2>

<%
try{ 
	Class.forName(driverName);
	con=DriverManager.getConnection(connectionUrl,userId,password);
    ps=con.prepareStatement("select * from products where ID=?");
    String sid=request.getParameter("ID");
	int idd=Integer.parseInt(sid);
    ps.setInt(1, idd);
    res=ps.executeQuery();

while(res.next()){
%>  <form action="Edit2" method="Post">
	<pre>
	<input type='hidden' name='id' value="<%=res.getString(1) %>">
	<input type="text" name="product_name" value = "<%=res.getString(2) %>" required><br>
	<input type="text" name="category_name" value = "<%=res.getString(3) %>" required><br>
	<input type="text" name="price" value = "<%=res.getString(4) %>" required><br>
	<input type="text" name="tag" value = "<%=res.getString(5) %>" required><br>
	<input type="file" name="file"  required><br>
	
	<input type="submit" value="Edit Product">
	
	</pre>
	</form>
			

<% 
}

} catch (Exception e) {
e.printStackTrace();
}
%>

</body>
</html>