<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
</head>
<style>

.card{
border-radius:20px !important;
}
    .card-body{
        position: absolute;
        bottom: -40px !important;
       transition: 0.2s ;
       visibility: hidden;
       overflow: hidden;
       background-color: white;
      

    }
 
    .drop_down{
      width: 300px !important;
      height: 50px !important;
      background: transparent !important;
      color: black;
      border-bottom: 1px solid black;
      border-top: 1px solid black;
      border-left: 1px solid black !important;
      border-right: 1px solid black !important;
      border-radius: 1px solid black !important;
      /* margin-left: 55px !important; */
      transition: 0.3s;
      font-weight: bolder;
    }
    .drop_down:hover{
      color: black !important;
     
    }
    @media only screen and (max-width: 600px) {
      .drop_down{
        width: 300px !important;
      }
.sort{
  height: 300px;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: space-evenly;
    
 
}
}
.dropdown-menu li{
  height: 50px;
}

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
.icon2{
right:10px;
}

.detail:hover{
color:violet !important;
}
</style>
<body>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
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

Statement statement = null;

ResultSet resultSet = null;
ResultSet resultSet_cate = null;

connection = DriverManager.getConnection(connectionUrl, userId, password);
statement=connection.createStatement();


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
<div class="container">
<div class="row mt-5 text-end">
<div class="col-8 mt-4  d-flex justify-content-end align-items-center">
 <div class="w-75 position-relative d-flex justify-content-center align-items-center">
 
 <input type="text" class="form-control bg-transparent w-100 search"  placeholder="Search By Product Name" autocomplete=off>
 <span class="position-absolute icon2"><i class="bi bi-search"></i></span>
 </div>
 
 
</div>
<div class="col-4 dropdown mt-4 d-flex justify-content-start align-items-center">
  <button class="btn btn-secondary dropdown-toggle w-50" type="button" data-bs-toggle="dropdown" aria-expanded="false">
   Categories
  </button>
  <ul class="dropdown-menu">
   <li><a class="dropdown-item" href="/Ecommerce_Project/Shopping_Session.jsp?category=All">All</a></li>
  <%
try{ 
	
	
	String sql_cate ="SELECT DISTINCT Category from category;";
	resultSet_cate = statement.executeQuery(sql_cate);


while(resultSet_cate.next()){
%>


 				
         <li><a class="dropdown-item" href="/Ecommerce_Project/Shopping_Session.jsp?category=<%=resultSet_cate.getString(1) %>"><%=resultSet_cate.getString(1) %></a></li>
    
 


<% 
}

} catch (Exception e) {
e.printStackTrace();
}
%>
   
  </ul>
</div>
</div>

</div>

 <div class="row vh-100  d-flex flex-wrap mt-2 shop_row justify-content-center">
<%
try{ 

	
	String sql ="SELECT * FROM products";
	resultSet = statement.executeQuery(sql);
	String category=request.getParameter("category");
	String all = "All";
	System.out.print(category);
	 if (category.equals("All")) {
while(resultSet.next()){
	
%>


				
     
           <div class="card shadow me-3 col-sm-12 d-flex justify-content-center align-items-center mt-3 border-0 rounded-0 position-relative" style="height: 200px;border-radius:50px;width:360px" id="<%=resultSet.getInt(1) %> ">
             <div class="d-flex justify-content-evenly align-items-center w-100">
             <div style="display:flex;flex-direction:column">
             <h5 class="fw-bold text-uppercase product_name text-center mt-4"><%=resultSet.getString(2) %></h5>
            <a style = "width:150px"href="/Ecommerce_Project/product_detail.jsp?ID=<%=resultSet.getString(1) %>" class="text-center btn btn-outline-dark mt-4">Show Detail</a>
             </div>
             
            
             <img src="./Image/<%=resultSet.getString(6) %>" style="width:110px" class="card-img-top" alt="..." style="width: 150px !important;" >
             </div>
              
           </div>



<% 
}
		    
		    
		    
		        } else {
		        
		         Connection con = null;
PreparedStatement ps = null;
ResultSet res = null;
Class.forName(driverName);
con=DriverManager.getConnection(connectionUrl,userId,password);
ps=con.prepareStatement("select * from products where Category=?");
String cate=request.getParameter("category");
ps.setString(1, cate);
res=ps.executeQuery();

while(res.next()){
%> 
		
                        <div class="card shadow me-3 col-sm-12 d-flex justify-content-center align-items-center mt-3 border-0 rounded-0 position-relative" style="height: 200px;border-radius:50px;width:360px" id="<%=res.getInt(1) %> ">
             <div class="d-flex justify-content-evenly align-items-center w-100">
              <div class= "box">
             <h5 class="fw-bold text-uppercase mt-4"><%=res.getString(2) %></h5>
            <a href="/Ecommerce_Project/product_detail.jsp?ID=<%=res.getString(1) %>" class="text-center btn btn-outline-dark mt-4">Show Detail</a>
             </div>
             <img src="./Image/<%=res.getString(6) %>" class="card-img-top" alt="..." style="width: 150px !important;" >
             </div>
             <div class="card-body w-100 text-center">
               <p class="card-text quick_view fw-bold text-center">Quick View</p>
             </div>
           </div>
                       
                            

<%
}

%>
		         
		    <%
		        }
		    %>

<% 
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

<script >
let search = document.querySelector(".search");
let product_name = document.querySelectorAll(".product_name");
let card = document.querySelectorAll(".card");

search.addEventListener("input",()=>{
	card.forEach((val)=>{
		let product_name = val.children[0].children[0].children[0].textContent ||  val.children[0].children[0].children[0].innerText;
		
		if( product_name.toUpperCase().indexOf(search.value.toUpperCase()) > -1){
			val.classList.remove("d-none")
			val.classList.add("d-flex")
		}else{
			val.classList.remove("d-flex")
			val.classList.add("d-none")
		}
	})
})

</script>

</html>