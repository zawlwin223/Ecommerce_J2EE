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
input{
color:white !important;
width:500px !important;
}
td {
  height: 80px;
  width: 160px;
  text-align: center;
  vertical-align: middle;
}
.active{
color:violet !important;
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
.add:hover{
color:black !important;
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

Connection connection = null;

PreparedStatement ps = null;
ResultSet resultSet = null;
%>



 
 <div class="container-fluid">
        <div class="row vh-100 ">
                        <div class="col-2 d-flex justify-content-center bg-black py-5" style="background-color: #212529;">
                <h1 class="text-uppercase display-5 mt-4 lavender position-fixed" style="text-orientation: upright;writing-mode: vertical-lr;color: violet;">LAVENDERS</h1>
            </div>
            <div class="col-10 bg-black px-5" >
                
             
                <div class="row" style="margin-top: 70px;">    
                      <nav aria-label="breadcrumb" class="d-flex justify-content-between text-light" >
                        <ol class="breadcrumb text-light">
                         <li class="breadcrumb-item"><a  href="dashboard.jsp">Dashboard</a></li>
                          <li class="breadcrumb-item "><a href="product_view.jsp">Products</a></li>
                          <li class="breadcrumb-item"><a href="user_view.jsp">Buyers</a></li>
                          <li class="breadcrumb-item"><a href="index.jsp">Home</a></li>
                        </ol>
                        <h5 class="me-5 text-light" style="color: violet !important;">ADMIN</h5>
                      </nav>
                   
                </div>
               <div class="row mt-5">
                
                <div class="col-12 text-start d-flex align-items-center">
                 
                

                          
                <div class="mt-4 w-100 d-flex " style="margin-top:90px !important">
                  
                
                
                         <%
try{ 
connection = DriverManager.getConnection(connectionUrl, userId, password);


ps=connection.prepareStatement("select * from products where ID=?");
String sid=request.getParameter("ID");
int idd=Integer.parseInt(sid);
ps.setInt(1, idd);
resultSet=ps.executeQuery();

while(resultSet.next()){
%>
      
<div style="width:50%;heigt:100%;" class="d-flex justify-content-center align-items-center">
 <img src="./Image/<%=resultSet.getString(6) %>" alt="" style="width: 400px;">
</div>

   <form action="edit1?ID=<%=resultSet.getString(1) %>" method="Post">
                   
                            <div class=" mt-2">
                    
                                <input type="text" class="form-control bg-transparent "  id="firstName" placeholder="Enter Product Name" value="<%=resultSet.getString(2) %>" required name="product_name" autocomplete=off>
                              </div>
                  
                              <div class=" mt-4">
                              
                                <input type="text" class="form-control bg-transparent" id="lastName" placeholder="Enter Product Price" value="<%=resultSet.getString(4) %>" required name="price" autocomplete=off>
                              </div>
                              <div class=" mt-4">
                              
                                <input type="text" class="form-control bg-transparent" id="lastName" placeholder="Enter Product Category" value="<%=resultSet.getString(3) %>" required  name="category_name" autocomplete=off>
                              </div>
                              <div class=" mt-4">
                    
                                <input type="text" class="form-control bg-transparent" id="firstName" placeholder="Enter Product Brand" value="<%=resultSet.getString(5) %>" required name="tag" autocomplete=off>
                              </div>
                  
                        
                              <div class=" mt-4">
                              
                                <input style="width:500px !important" type="file" id="file-input" name="file" value="<%=resultSet.getString(6) %>" autocomplete=off/>

                                <label style="width:500px !important" id="file-input-label" class="ps-2 py-2 w-100" for="file-input"  
                                  >Choose Image</label
                                >
                              </div>
                              <div class="mt-4">
                              
                                <input type="submit" class="form-control add text-light btn btn-outline-light" id="lastName" placeholder="" value="EDIT" required name="lastname">
                              </div>
                          
                      
                        
                    </form>
 


<% 
}

} catch (Exception e) {
e.printStackTrace();
}
%>
                         
                  

                </div>
               </div>                 
         
            
               
            </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
</body>
</html>