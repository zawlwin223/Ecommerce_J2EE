<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form action="Create" method="post">
	<pre>
	<input type="text" name="product_name" placeholder="Enter Product Name" required><br>
	<input type="text" name="category_name"  placeholder="Enter Category Name" required><br>
	<input type="text" name="price" placeholder="Enter Price" required><br>
	<input type="text" name="tag" placeholder="Enter tag" required><br>
	<input type="file" name="file" placeholder="Enter Price" required><br>
	
	<input type="submit" value="Create Product">
	
	</pre>
	</form>
</body>
</html>