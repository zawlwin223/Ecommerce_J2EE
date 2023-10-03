<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
  <link
    rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"
  />
</head>
<style>
    .card-body{
        position: absolute;
        bottom: -40px !important;
       transition: 0.2s ;
       visibility: hidden;
       overflow: hidden;
       background-color: white;

    }
    .card-img-top{
        width: 200px !important;


    }
    .card:hover .card-body{
        bottom: -15px !important;
        visibility: visible;
        bottom: 0px;
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


    .shopper{
      top: 38vh;
      left: 228px;
      display: inline-block !important;
      color: white;
      mix-blend-mode: difference;
      z-index: 1;
    }
    .home_body_1{
      background-image:url(./Image/download\ \(2\).jpg);
      background-repeat: no-repeat;
      background-size: cover;
      background-position: center;
    }
    .home_body_2{
      background-image: url(./Image/outfit.jpg);
      background-repeat: no-repeat;
      background-size: cover;
      background-position: center;
    }
    .home_body_3{
      background-image:url(./Image/download\ \(1\).jpg);
      background-repeat: no-repeat;
      background-size: cover;
      background-position: center;
    }
    .home_body_4{
      background-image: url(./Image/How\ To\ Wear\ A\ Varsity\ Jacket\ 20\ Outfit\ Ideas\ &\ Styling\ Tips.png);
      background-repeat: no-repeat;
      background-size: cover;
      background-position: center;
    }
 
@media only screen and (max-width: 600px) {
  .home {
   height: 1000px !important;
  }
}
.loader {
        transform: rotateZ(45deg);
        perspective: 1000px;
        border-radius: 50%;
        width: 48px;
        height: 48px;
        color: #fff;
      }
        .loader:before,
        .loader:after {
          content: '';
          display: block;
          position: absolute;
          top: 0;
          left: 0;
          width: inherit;
          height: inherit;
          border-radius: 50%;
          transform: rotateX(70deg);
          animation: 1s spin linear infinite;
        }
        .loader:after {
          color: violet;
          transform: rotateY(70deg);
          animation-delay: .4s;
        }

      @keyframes rotate {
        0% {
          transform: translate(-50%, -50%) rotateZ(0deg);
        }
        100% {
          transform: translate(-50%, -50%) rotateZ(360deg);
        }
      }

      @keyframes rotateccw {
        0% {
          transform: translate(-50%, -50%) rotate(0deg);
        }
        100% {
          transform: translate(-50%, -50%) rotate(-360deg);
        }
      }

      @keyframes spin {
        0%,
        100% {
          box-shadow: .2em 0px 0 0px currentcolor;
        }
        12% {
          box-shadow: .2em .2em 0 0 currentcolor;
        }
        25% {
          box-shadow: 0 .2em 0 0px currentcolor;
        }
        37% {
          box-shadow: -.2em .2em 0 0 currentcolor;
        }
        50% {
          box-shadow: -.2em 0 0 0 currentcolor;
        }
        62% {
          box-shadow: -.2em -.2em 0 0 currentcolor;
        }
        75% {
          box-shadow: 0px -.2em 0 0 currentcolor;
        }
        87% {
          box-shadow: .2em -.2em 0 0 currentcolor;
        }
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

<div class="container-fluid position-fixed top-0 z-2">
  <div class="row">
        <nav class="navbar navbar-expand-lg  bg-black">
          <div class="container">
            <h6 class=" navbar-brand ms-3 d-lg-none d-sm-block mb-0 animate__animated animate__flash" style="color: violet;">LAVENDERS</h6>
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
                  <a class="nav-link animate__animated animate__fadeIn active" aria-current="page" href="/Ecommerce_Project/">Home</a>
                </li>
                <li class="nav-item ">
                  <a class="nav-link animate__animated animate__fadeIn" href="/Ecommerce_Project/Shopping_Session.jsp?category=All">Shop</a>
                </li>
                <li>
                  <h6 class="navbar-brand ms-3 d-lg-block d-none mb-0  animate__animated animate__bounce" style="color: violet;">LAVENDERS</h6>
                </li>
                <li class="nav-item ">
                  <a class="nav-link animate__animated animate__fadeIn" href="/Ecommerce_Project/admin_login.jsp">Admin</a>
                </li>
                <li class="nav-item position-relative cart_lg_link pt-2 d-lg-block d-none">
                 
                    <i class="bi bi-cart2 position-relative icon d-lg-block d-none animate__animated animate__fadeIn" data-bs-toggle="offcanvas" data-bs-target="#offcanvasWithBothOptions" aria-controls="offcanvasWithBothOptions">  
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
  <div class="row vh-100 home">
    <div class="col-6 col-lg-4 bg-black  d-flex justify-content-center align-items-center" style="text-orientation: upright;">
      <!-- <img src="/images/ForHome/lavender.png" alt="" style="height:100px;"> -->
      <h1 class="text-uppercase display-5 mt-5 animate__animated animate__flash" style="text-orientation: upright;writing-mode: vertical-lr;color: violet;">LAVENDERS</h1>
  </div>
  <div class="col-6 col-lg-2 bg-light position-relative home_body_1">
   
  
  </div>
  <div class="col-4 col-lg-2 bg-light position-relative home_body_2">
   
   
  </div>
  <div class="col-4 col-lg-2 bg-light position-relative home_body_3">
   
   
  </div>


  <div class="col-4 col-lg-2 bg-light position-relative home_body_4">
   
    <div class="position-absolute bottom-0 end-0 d-flex flex-column me-3 mb-2">
      <a href="" class="text-end "><i class="bi bi-instagram text-dark " style="height: 100px;font-size: 25px;"></i></a>
      <a href="" class="text-end "><i class="bi bi-facebook text-dark" style="height: 100px;font-size: 25px;"></i></a>
      <a href="" class="text-end "><i class="bi bi-twitter text-dark " style="height: 100px;font-size: 25px;"></i></a>
    </div>
  </div>
</div>
</div>
<div class="loading d-flex justify-content-center align-items-center top-0" style="width: 100%;height: 100%;background-color: black;position: fixed;z-index: 5;">
  <span class="loader"></span>
</div>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
 <script src="https://unpkg.com/scrollreveal@4.0.0/dist/scrollreveal.min.js"></script>
 <script>
 
 let loading = document.querySelector(".loading")
 window.addEventListener('load', () => {
  // loading.classList.remove("d-none")
    loading.classList.add("d-none")
});
 let cart_link = document.querySelector(".cart_link")     
 let cart_lg_link = document.querySelector(".cart_lg_link")     
function cart_icon(){
  console.log("This is cart")
    let data = JSON.parse(localStorage.getItem("Cart_Item")) ;
    console.log(data.length)
    cart_link.innerHTML += 
`<span class="position-absolute start-100 translate-middle badge rounded-pill bg-danger animate__animated animate__fadeIn " style="top: -1px !important;z-index: 1;" >
\${data.length}
</span>`
cart_lg_link.innerHTML += 
`<span class="position-absolute start-100 translate-middle badge rounded-pill bg-danger animate__animated animate__fadeIn " style="top: 5px !important;z-index: 1;" >
\${data.length}
</span>`
}
cart_icon();


    </script>
<script src="cart.js"></script>



</html>