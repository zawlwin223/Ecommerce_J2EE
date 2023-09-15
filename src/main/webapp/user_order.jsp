<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<!-- Option 1: Include in HTML -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
</head>
<style>
a{
    text-decoration: none;
    color: white;
    transition: 0.5s;
}
a:hover{
    color: violet;
}
::placeholder { 
  color: white!important;
  
}

#file-input {
        display: none;
      }

      #file-input-label {
        color: white;
        border: 1px solid white;
        border-radius: 4%;
      }
      
       .breadcrumb-item::before {
    color: white !important;
 }    
 
 td {
  height: 80px;
  width: 160px;
  text-align: center;
  vertical-align: middle;
} 
</style>
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
Class.forName(driverName);
con=DriverManager.getConnection(connectionUrl,userId,password);
ps=con.prepareStatement("select * from userOrder where Order_Id=?");
String sid=request.getParameter("ID");
String name=request.getParameter("Name");
ps.setString(1, sid);
res=ps.executeQuery();
%>


 
 
 <div class="container-fluid">
        <div class="row vh-100 ">
            <div class="col-2 d-flex justify-content-center bg-black py-5" style="background-color: #212529;">
                <h1 class="text-uppercase display-5 mt-4 position-fixed" style="text-orientation: upright;writing-mode: vertical-lr;color: violet;">LAVENDERS</h1>
            </div>
            <div class="col-10 bg-black px-5" >
                
             
                <div class="row" style="margin-top: 70px;">    
                      <nav aria-label="breadcrumb" class="d-flex justify-content-between" >
                        <ol class="breadcrumb">
                          <li class="breadcrumb-item"><a href="dashboard.jsp">Dashboard</a></li>
                          <li class="breadcrumb-item"><a href="product_view.jsp">Products</a></li>
                          <li class="breadcrumb-item"><a href="user_view.jsp">Buyers</a></li>
                          <li class="breadcrumb-item"><a href="index.jsp">Home</a></li>
                        </ol>
                        <h5 class="me-5 text-light" style="color: violet !important;">ADMIN</h5>
                      </nav>
                   
                </div>
               <div class="row">
                <div class="col-12 text-start">
                                         

     	 <h5 class="text-light mt-5">Orders Of <span style="color:violet"> <%= name %></span></h5>
     	
       
                
               
                 
                  <div class="w-100" style="margin-top: 30px;">
                    <table class="table table-striped table-hover table-dark text-center">
                        <thead>
                          <tr>
                            <th scope="col">Date</th>
                            <th scope="col">Product</th>
                            <th scope="col">Size</th>
                            <th scope="col">Quantity</th>
                            <th scope="col">Price</th>
                          </tr>
                        </thead>
                        <tbody>
                         
                         <%
try{ 
	

while(res.next()){
%> 
		 <tr>
                            <td scope="row">11.12.2023</td>
                            <td><img src="<%=res.getString(7) %>" alt="" style="width: 50px;"><span class="ms-3"><%=res.getString(3) %></span></td>
                           <td><%=res.getString(10) %></td>
                            <td><%=res.getInt(4) %></td>
                            <td class="price">$<%=res.getInt(5) %></td>
                          </tr>	

<%
}

} catch (Exception e) {
e.printStackTrace();
}
%>
<tr>

<td colspan="4">Total Price</td>
<td class="total"></td>

</tr>

                        </tbody>
                      </table>
                </div>
                </div>
               
               </div>
                  
                    
         
            
               
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<script>
let price = document.querySelectorAll(".price");
let total = document.querySelector(".total");
let total_value = 0 ;
price.forEach((val)=>{
  let price_value = Number(val.innerHTML.substring(1))
  total_value+=price_value
  total.innerHTML = `$\${total_value}`
  console.log(total_value)
})

</script>

</body>
</html>