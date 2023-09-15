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
   .del{
    cursor:context-menu;
   }
@import url('https://fonts.googleapis.com/css2?family=Allerta+Stencil&family=Rock+Salt&display=swap');
    nav a{
      color: white !important;
      transition: 0.2s linear;
    }
    nav a:hover{
      color: violet !important;
      text-decoration: underline;
    }
    .icon{
      color: white !important;
      transition: 0.2s linear;
    }
    .icon:hover{
      color: violet !important;
      text-decoration: underline;
    }

    @media only screen and (max-width: 600px) {
      .navbar-collapse{
        padding: 10px 0px 10px 0px;
      }
     .navbar-collapse  .navbar-nav .nav-item{
      padding: 10px 0px 10px 0px;
      text-align: center;
     }
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
%>
<div class="container-fluid position-fixed top-0 z-2">
  <div class="row">
        <nav class="navbar navbar-expand-lg  bg-black">
          <div class="container">
            <h6 class=" navbar-brand ms-3 d-lg-none d-sm-block mb-0" style="color: violet;">LAVENDERS</h6>
            <div class="d-flex align-items-center d-lg-none d-sm-block">
              <div class="cart_link position-relative me-2">
                <i class="bi bi-cart2 position-relative icon d-lg-none d-block" data-bs-toggle="offcanvas" data-bs-target="#offcanvasWithBothOptions" aria-controls="offcanvasWithBothOptions">  
                </i>
              </div>
              
              <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <i class="bi bi-list" style="color: violet;font-size: 35px;"></i>
              </button>
            </div>
            <div class="collapse navbar-collapse " id="navbarNav">
              <ul class="navbar-nav text-light w-100 d-flex justify-content-between">
                <li class="nav-item ">
                  <a class="nav-link active" aria-current="page" href="/Ecommerce_Project/">Home</a>
                </li>
                <li class="nav-item ">
                  <a class="nav-link" href="/Ecommerce_Project/Shopping_Session.jsp?category=All">Shop</a>
                </li>
                <li>
                  <h6 class="navbar-brand ms-3 d-lg-block d-none mb-0" style="color: violet;">LAVENDERS</h6>
                </li>
                <li class="nav-item ">
                  <a class="nav-link" href="/Ecommerce_Project/dashboard.jsp">Admin</a>
                </li>
                <li class="nav-item position-relative cart_lg_link pt-2 d-lg-block d-none">
                 
                    <i class="bi bi-cart2 position-relative icon d-lg-block d-none" data-bs-toggle="offcanvas" data-bs-target="#offcanvasWithBothOptions" aria-controls="offcanvasWithBothOptions">  
                    </i>
                
                  
                </li>

            
              </ul>
            </div>
          </div>
        </nav>
      </div>
    
    </div>
  

   


    <div class="offcanvas offcanvas-end" data-bs-scroll="true" tabindex="-1" id="offcanvasWithBothOptions" aria-labelledby="offcanvasWithBothOptionsLabel">
      <div class="offcanvas-header bg-secondary p-4 mb-4">
        <h5 class="offcanvas-title fw-bold text-light fs-4" id="offcanvasWithBothOptionsLabel">Cart</h5>
        <button type="button" class="btn-close text-light" data-bs-dismiss="offcanvas" aria-label="Close"></button>
      </div>
      <div class="del_box">
       
       </div>
      <div class="offcanvas-body d-flex flex-column justify-content-between">
        
        <div class="cart_body">
            <!-- data space -->
        </div>

        <footer class="d-flex justify-content-between align-items-center cart_footer" >
          
       
           
        </footer>
        
     
        

      </div>
      
    </div>
<div class="container-fluid">
     <div class="row vh-100">
     
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
%> 
	<div class="col-lg-6 col-sm-12 bg-light d-flex justify-content-center align-items-center each_product py-5 position-relative"> 
            <i class="bi bi-arrow-left position-absolute" style="    font-size: 31px;
            left: 20px;
            top: 70px;" onclick="back()"></i>
            <img src="./Image/<%=res.getString(6) %>" product_id="<%=res.getString(1) %>" class="product_detail_img mt-5 product-image" alt="" style="height: 250px;">
        </div>
        <div class="col-lg-6 col-sm-12 bg-black text-light d-flex justify-content-center align-items-center pb-5">
            <div class="mt-5">
                <h1 class="fw-bold display-4 mb-5 product-title text-uppercase title"><%=res.getString(2) %> </h1>
                <table style="width: 70%; ">
                <tr class="p-5 ms-5 " style="height:60px">
                    <th class="text-start">Price : </th>
                    <td class="text-center product-price" style="color: violet;"><%=res.getString(4) %></td>
                </tr>
                <tr class="p-5 ms-3" style="height:60px">
                    <th class="text-start">Quantity:</th>
                    <td class="text-center product-quantity">
                        <div class="d-flex justify-content-around ms-3" style="border: 1px solid white;height: 30px;text-align: center;">
                            <i class="bi bi-plus" onclick="plus_item()"></i>
                            <span class="item_quantity_text">1</span>
                            <i class="bi bi-dash" onclick="minus_item()"></i>
                          </div>  
                    </td>
                </tr>
                  <tr class="p-5 ms-5" style="height:60px">
                    <th class="text-start">Size:</th>
                    <td class="text-center product-quantity">
                        <div class="d-flex justify-content-around ms-3" style="height: 30px;text-align: center;">
                            
                            <select class="text-light bg-transparent size" style="width:100px">
                            <option  class="text-dark bg-transparent ">M</option>
                             <option  class="text-dark bg-transparent">SM</option>
                              <option  class="text-dark bg-transparent">L</option>
                               <option  class="text-dark bg-transparent">XL</option>
                            </select>
                            
                            
                          </div>  
                    </td>
                </tr>
                  <tr class="p-5 ms-5" style="height:60px">
                    <th class="text-start">Brand:</th>
                    <td class="text-center product-quantity">
                        <div class="d-flex justify-content-around ms-3" style="height: 30px;text-align: center;">
                            
                            <span class="brand"><%=res.getString(5) %></span>
                            
                          </div>  
                    </td>
                </tr>
                 <tr class="p-5 ms-5" style="height:60px">
                    <th class="text-start" >Category:</th>
                    <td class="text-center product-quantity">
                        <div class="d-flex justify-content-around ms-3" style="height: 30px;text-align: center;">
                            
                            <span class="category"><%=res.getString(3) %></span>
                            
                          </div>  
                    </td>
                </tr>
                 
            </table>
            <!-- <button class="btn btn-outline-light mt-5 w-100 " onclick="AddToCart()">Add To Cart</button> -->
			<p class="mt-3"> <i class="bi bi-check-square text-success me-3" ></i>Money Back Return Policy</p>
            <button class="btn btn-outline-light mt-2 w-100 add_to_cart"  type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasWithBothOptions" aria-controls="offcanvasWithBothOptions" onclick="add_cart()" >Add To Cart</button>

            <div class="offcanvas offcanvas-end" data-bs-scroll="true" tabindex="-1" id="offcanvasWithBothOptions" aria-labelledby="offcanvasWithBothOptionsLabel">
              <div class="offcanvas-header bg-secondary p-4 mb-4">
                <h5 class="offcanvas-title fw-bold text-light fs-4" id="offcanvasWithBothOptionsLabel">Cart</h5>
                <button type="button" class="btn-close text-light" data-bs-dismiss="offcanvas" aria-label="Close"></button>
              </div>
              <div class="del_box">
               
               </div>
              <div class="offcanvas-body d-flex flex-column justify-content-between">
                
                <div class="cart_body">
                    <!-- data space -->
                </div>

                <footer class="d-flex justify-content-between align-items-center cart_footer" >
                  
               
                   
                </footer>
                
             
                

              </div>
              
            </div>

            </div>
        </div>		

<% 
}

} catch (Exception e) {
e.printStackTrace();
}
%>
     </div>
</div>


</body>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
 <script>
 let cart_link = document.querySelector(".cart_link")     
 let cart_lg_link = document.querySelector(".cart_lg_link")     
function cart_icon(){
  console.log("This is cart")
    let data = JSON.parse(localStorage.getItem("Cart_Item")) ;
    console.log(data.length)
    cart_link.innerHTML += 
`<span class="position-absolute start-100 translate-middle badge rounded-pill bg-danger  " style="top: -1px !important;z-index: 1;" >
\${data.length}
</span>`
cart_lg_link.innerHTML += 
`<span class="position-absolute start-100 translate-middle badge rounded-pill bg-danger  " style="top: 5px !important;z-index: 1;" >
\${data.length}
</span>`
}
cart_icon();


    </script>
<script src="cart_1.js"></script>
<script>

let item_quantity_text = document.querySelector(".item_quantity_text");
function plus_item(){
  item_quantity_text.innerHTML=Number(item_quantity_text.innerHTML)+1;
    
}
function minus_item(){
    if(item_quantity_text.innerHTML == "1"){
    console.log("equal zero")
    return;
}
item_quantity_text.innerHTML=Number(item_quantity_text.innerHTML)-1;
}

</script>

<script src="product_info.js"></script>


</html>