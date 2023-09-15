<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<!-- Option 1: Include in HTML -->
<!-- Option 1: Include in HTML -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
</head>
<style>
.respond{
transition:0.3s;
cursor:pointer;
}
.respond:hover{
color:violet !important;
}
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
  td {
  height:100px;
  text-align: center;
  vertical-align: middle;
} 
</style>
<body>
 
  
 <%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
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
Statement statement = null;
ResultSet resultSet = null;
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
                        <li class="breadcrumb-item"><a  href="dashboard.jsp">Dashboard</a></li>
                          <li class="breadcrumb-item"><a href="product_view.jsp">Products</a></li>
                          <li class="breadcrumb-item"><a class="active" href="user_view.jsp">Buyers</a></li>
                          <li class="breadcrumb-item"><a href="index.jsp">Home</a></li>
                        </ol>
                        <h5 class="me-5 text-light" style="color: violet !important;">ADMIN</h5>
                      </nav>
                   
                </div>
               <div class="row">
                <div class="col-12 text-start">
                  <h5 class="text-light mt-5">Buyers</h5>
                
                  <div class="w-100" style="margin-top: 30px;">
                    <table class="table table-striped table-hover table-dark text-center">
                        <thead>
                          <tr>
                            <th scope="col">Name</th>
                            <th scope="col">Email</th>
                            <th scope="col">Address</th>
                            <th scope="col">City</th>
                            <th scope="col">Phone</th>
                            <th scope="col">Zip</th>
                            <th scope="col">Country</th>
                            <th scope="col">Order Id</th>
                            <th scope="col">Order</th>
                            <th scope="col">Respond The User</th>
                          </tr>
                        </thead>
                        <tbody>
                         
 <%
try{ 
connection = DriverManager.getConnection(connectionUrl, userId, password);
statement=connection.createStatement();
String sql ="SELECT * FROM user";

resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>

<% String sth = resultSet.getString(2) ;%>
 
         <tr>
                            <td class ="name" scope="row"></i><%=resultSet.getString(2) %></td>
						    <td class="email"><%=resultSet.getString(3) %> </td>                         
                            <td><%=resultSet.getString(4) %> </td>
                            <td><%=resultSet.getString(5) %> </td>
                            <td><%=resultSet.getString(6) %> </td>
                            <td><%=resultSet.getString(7) %> </td>
                            <td><%=resultSet.getString(8) %> </td>
                            <td ><%=resultSet.getString(1) %> </td>
                            
                            <%String name =sth.replaceAll(" ", "%20");
 %>
                           
                            <td><a class="btn btn-outline-light"  href=user_order.jsp?ID=<%=resultSet.getString(1) %>&Name=<%=name%>>Show Order</a></td>
                           <td class="respond " data-bs-toggle="offcanvas" data-bs-target="#offcanvasRight" aria-controls="offcanvasRight">Respond </td>
                          </tr>
 


<% 
}

} catch (Exception e) {
e.printStackTrace();
}
%>


                        </tbody>
                      </table>
                </div>
                </div>
               
               </div>
              <div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasRight" aria-labelledby="offcanvasRightLabel">
  <div class="offcanvas-header bg-dark text-ligt">
    <h5 id="offcanvasRightLabel" class="text-light">Send Email</h5>
    <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
  </div>
  <div class="offcanvas-body bg-dark">
 <div class="d-flex mb-3">
  <span class="text-light">Buyer Name -</span>
  <h5 class="to_user text-light ms-3" style="color:violet !important"></h5>
 </div>
   <form action="Email" method="Post">
                        <div class="row">
                            <div class="col-12 mt-2">
                    
                                <input type="text" class="form-control bg-transparent text-light email_form"   value="hello" required name="email" autocomplete=off>
                              </div>
                  
                              <div class="col-12 mt-4">
                              <textarea class="bg-transparent text-light p-3" placeholder="Type Message Here" name="message" rows="6" cols="45">

</textarea>
                              
                               
                              </div>
                              <div class="col-12 mt-4">
                              
                              
                              <div class="col-12 mt-4">
                              
                                <input type="submit" class="form-control add text-light btn btn-outline-light" id="lastName" placeholder="" value="Send Confirmation Email" required name="lastname">
                              </div>
                            </div>
                      
                        
                    </form>
  </div>
</div>  
         
            
               
            </div>
        </div>
    </div>

    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<script>
let table = document.querySelector(".table")
let email_form = document.querySelector(".email_form")
let send_message = document.querySelector(".add")
let to_user = document.querySelector(".to_user")
console.log(table)
table.addEventListener("click",(e)=>{
	if(event.target.classList.contains("respond")){
	  let row = event.target.parentElement;
	  let email =  row.querySelector(".email").innerText;
	  let name =  row.querySelector(".name").innerText;
	  console.log(email_form)
	  email_form.placeholder= email;
	  email_form.value = email;
	  to_user.innerHTML = name;
		
	}
	
})
send_message.addEventListener("click",(e)=>{
	console.log("Add")
})


</script>
</body>
</html>