<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
 <meta charset="UTF-8">
<title>Insert title here</title>
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<!-- Option 1: Include in HTML -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
  <link rel="stylesheet" href="vendor/feather-icons-web/feather.css">
</head>
<style>
@import url('https://fonts.googleapis.com/css2?family=Roboto:wght@100;300;400;500;700;900&display=swap');
i{
color:violet !important;
}
*{
    font-family: 'Roboto', sans-serif;
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}
:root{
    --primary:#007bff;
    --primary-soft:#e2dbdb;
    --primary-second-soft:#f3f3f3;
}
.side-bar{
overflow: scroll;
}
.content{
background-color: var(--primary-soft);
overflow: scroll;
box-shadow: 0 .125rem .25rem rgba(0,0,0,.075) inset;
}
.header{
    position: sticky;
    top: 0.2rem;
    z-index: 1000;
}
.feather-menu{
    cursor: pointer;
}
.user{
    width: 30px;
    height: 30px;
    
}
.status-card{
  transition: 0.5s;
}

.status-card:active{
 transform: rotate(0deg);
}
.ov-img{
    margin-left: -25px;
}
.carousel-card{
    margin-top: -100px;
}
.item-card-img{
    height: 200px;
}

@media screen and (max-width:780px){
    .side-bar.col-12.col-lg-3.col-xl-2.vh-100{
        position: fixed;
    width: 300px;
    z-index: 1001;
    background-color: var(--primary-second-soft);
    margin-left: -100%;
    }
    .product-card{
        margin-top: 100px;
    }
}
.dropdown-toggle::after {
    display:none;
}
.dropdown-toggle::after {
    display:none;
}
.dropdown-toggle:empty::after{
    display: none;
}
.expand-item-list{
    position: fixed !important;
    top: 0;
    left: 0;
    width: 100%;
    height: 100vh;
    z-index: 2005;
    overflow: scroll;
}
.side-bar-menu{
    text-decoration: none;
    list-style: none;
    
}
.menu{
    margin-left: -33px;
}
.menu-head{
 text-transform: uppercase;
 font-weight: bold;
 color: #b4afaf;
}
.menu-item{
    text-decoration: none;
 color: rgb(46, 46, 45);
}
.menu-li{  
 padding:5px 5px;
    transition: 0.4s;
    
}
.menu-space{
 padding: 10px 0px;
}
.menu-li.active{
    border-radius: 0.25rem;
    padding: 5px;
}
.menu-li:not(.active):hover{
    background-color: var(--primary-second-soft);
    border-radius: 0.25rem;
    padding: 5px 0px;
    text-decoration: none;
    color: rgb(46, 46, 45);
    transform: translateX(-3px);
}
.menu-item:hover{
    text-decoration: none;
    color: rgb(46, 46, 45);
}
a{
    text-decoration: none;
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
input{
color:white !important;
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

.breadcrumb-item::before {
    color: white !important;
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
connection = DriverManager.getConnection(connectionUrl, userId, password);
statement=connection.createStatement();
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
                         <li class="breadcrumb-item"><a class="active" href="dashboard.jsp">Dashboard</a></li>
                          <li class="breadcrumb-item "><a  href="product_view.jsp">Products</a></li>
                          <li class="breadcrumb-item"><a href="user_view.jsp">Buyers</a></li>
                          <li class="breadcrumb-item"><a href="index.jsp">Home</a></li>
                        </ol>
                        <h5 class="me-5 text-light" style="color: violet !important;">ADMIN</h5>
                      </nav>
                   
                </div>
             
            <div>
               <div class="row mb-3 ">
                 <!-- status-card start -->
                            <div class="col-12 col-md-6 col-lg-6 col-xl-3">
                                <div class="card status-card bg-dark text-light">
                                    <div class="card-body ">
                                        <div class="row  justify-content-center align-items-center">
                                            <div class="col-4">
                                                
                                                    <i class="feather-shopping-bag h1  mb-0"></i>
                    
                                            </div>
                                            <div class="col-8">
                                            
                                                                            <%
try{ 

String sql =" select count(*) count_product from userorder;";
ResultSet resultSet = null;
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>


 <span class="d-block font-weight-bolder h4 counter"><%=resultSet.getString(1) %></span>
     
 


<% 
}

} catch (Exception e) {
e.printStackTrace();
}
%>
                                                
                                                <span>Today Order</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-12 col-md-6 col-lg-6 col-xl-3">
                                <div class="card status-card bg-dark text-light">
                                    <div class="card-body ">
                                        <div class="row  justify-content-center align-items-center">
                                            <div class="col-4">
                                                
                                                    <i class="feather-users h1 mb-0"></i>
                    
                                            </div>
                                            <div class="col-8">
                                                                            <%
try{ 

String sql =" select count(*) count_product from user;";
ResultSet resultSet = null;
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>


 
      <span class="d-block font-weight-bolder h4 counter"><%=resultSet.getString(1) %></span>
 


<% 
}

} catch (Exception e) {
e.printStackTrace();
}
%>
                                                
                                                <span>Total Buyers</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-12 col-md-6 col-lg-6 col-xl-3">
                                <div class="card status-card bg-dark text-light">
                                    <div class="card-body ">
                                        <div class="row  justify-content-center align-items-center">
                                            <div class="col-4">
                                                
                                                    <i class="feather-box h1 mb-0"></i>
                    
                                            </div>
                                            <div class="col-8">
                                                                                                                        <%
try{ 

String sql =" select count(*) count_product from products;";
ResultSet resultSet = null;
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>


     <span class="d-block font-weight-bolder h4 counter" ><%=resultSet.getString(1) %></span>
    
 


<% 
}

} catch (Exception e) {
e.printStackTrace();
}
%>
                                            
                                                <span>Total Products</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-12 col-md-6 col-lg-6 col-xl-3">
                                <div class="card status-card bg-dark text-light">
                                    <div class="card-body ">
                                        <div class="row  justify-content-center align-items-center">
                                            <div class="col-4">
                                                
                                                    <i class="feather-map-pin h1 mb-0"></i>
                    
                                            </div>
                                            <div class="col-8">
                                                <span class="d-block font-weight-bolder h4 counter">14</span>
                                                <span>Support Location</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div> 
                        <!-- status-card end -->
                <div class="row ">
                    <!-- over and viewer start -->
                    <div class="col-12 col-xl-7">  
                        <div class="card shadow overflow-hidden bg-dark text-light mt-3">
                            <div class="">
                                <div class="d-flex justify-content-between align-items-center my-3">
                                   <h5 class="ml-4 ms-3 text-light" >Order & Viewer</h5>
                                    <div class="mr-4">
                                        <img src="img/user/avatar2.jpg" class="rounded-circle ov-img" alt="">
                                        <img src="img/user/avatar3.jpg" class="rounded-circle ov-img" alt="">
                                        <img src="img/user/avatar4.jpg" class="rounded-circle ov-img" alt="">
                                        <img src="img/user/avatar5.jpg"  class="rounded-circle ov-img"alt="">
                                        <img src="img/user/avatar6.jpg" class="rounded-circle ov-img" alt="">
                                    </div>
                                </div>
                                <canvas id="ov" height="100"></canvas>
                            </div>
                        </div>
                    </div>
                    <!-- over and viewer end -->
                    <!-- product-card start -->
                    <div class="col-12 col-xl-5  product-card position-relative">
                  
                        <div class="card shadow bg-dark position-absolute bottom-0" style="width:400px">
                            <div class="card-body" >
                                <div id="carouselExampleIndicators" class="carousel carousel-card slide" data-ride="carousel" >
                                    
                                    <div class="carousel-inner">
                                      <div class="carousel-item active">
                                        <div class="d-flex justify-content-between align-items-end item-card">
                                            <div class=" mb-4 w-50">
                                                <h4 class="mb-2">Gucci Hoodie</h4>
                                                <span class="text-light font-weight-bolder">Kyats 150000</span>
                                                <div class="progress mt-2 d-none">
                                                    <div class="progress-bar progress-bar-striped progress-bar-animated" role="progressbar" style="width: 50%" aria-valuenow="10" aria-valuemin="0" aria-valuemax="100"></div>
                                                  </div>
                                            </div>
                                            <img src="./Image/20.png" alt="" class="item-card-img">
                                        </div>
                                      </div>
                                      <div class="carousel-item">
                                        <div class="d-flex justify-content-between align-items-end item-card">
                                            <div class="w-50 mb-4">
                                                <h4 class="mb-2">LV Purse</h4>
                                                <span class="text-light font-weight-bolder">Kyats 52000</span>
                                                <div class="progress mt-2 d-none">
                                                    <div class="progress-bar progress-bar-striped progress-bar-animated" role="progressbar" style="width: 70%" aria-valuenow="10" aria-valuemin="0" aria-valuemax="100"></div>
                                                  </div>
                                            </div>
                                            <img src="./Image/35.png" alt="" class="item-card-img">
                                        </div>
                                      </div>
                                      <div class="carousel-item">
                                        <div class="d-flex justify-content-between align-items-end item-card">
                                            <div class="w-50 mb-4">
                                                <h4 class="mb-2">Nike Shirt</h4>
                                                <span class="text-light font-weight-bolder">Kyats 30000</span>
                                                <div class="progress mt-2 d-none">
                                                    <div class="progress-bar progress-bar-striped progress-bar-animated" role="progressbar" style="width: 40%" aria-valuenow="10" aria-valuemin="0" aria-valuemax="100"></div>
                                                  </div>
                                            </div>
                                              <img src="./Image/30.png" alt="" class="item-card-img">
                                        </div>
                                      </div>
                                      <div class="carousel-item">
                                        <div class="d-flex justify-content-between align-items-end item-card">
                                            <div class="w-50 mb-4">
                                                <h4 class="mb-2">Nike Pant</h4>
                                                <span class="text-light font-weight-bolder">Kyats 10000</span>
                                                <div class="progress mt-2 d-none">
                                                    <div class="progress-bar progress-bar-striped progress-bar-animated" role="progressbar" style="width: 80%" aria-valuenow="10" aria-valuemin="0" aria-valuemax="100"></div>
                                                  </div>
                                            </div>
                                            <img src="./Image/40.png" alt="" class="item-card-img">
                                        </div>
                                      </div>
                                    </div>
                                    
                                  </div>
                               
                            </div>
                        </div>
                    </div>
                    <!-- product-card end -->
                    <!-- order and place start -->
                    <div class="col-12 col-xl-5  mt-5 ">
                        <div class="card shadow bg-dark text-light">
                            <div class="card-body">
                                <h5 class="text-light">Order & Place</h5>
                                <canvas id="secondChart" width="100px" height="70"></canvas>
                            </div>
                        </div>
                        
                    </div>
                    <!-- order and place end -->
                    <!-- Subscriber list table start -->
                    <div class="col-12 col-xl-7">
                       <table class="table table-striped table-hover table-dark text-center mt-3">
                       <h3 class="text-light mt-3">Order Product</h3>
                        <thead>
                          <tr>
                      
                            <th scope="col" class="text-light">Product</th>
                            <th scope="col" class="text-light">Category</th>
                            <th scope="col" class="text-light">Price</th>
                            <th scope="col" class="text-light">Brand</th>
                            
                          </tr>
                        </thead>
                        <tbody>



 
                                <%
try{ 

String sql =" SELECT Image,category,brand,price,orderProduct FROM userorder GROUP BY Image";
ResultSet resultSet = null;
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>


 
         <tr>
                          
                            <td><div class="d-flex justify-content-center align-items-center"><img src="<%=resultSet.getString(1) %>" alt="" style="width: 50px;"><span class="ms-2"><%=resultSet.getString(5) %> </span></div></td>
                            <td><%=resultSet.getString(2) %> </td>
                            <td>Kyats <%=resultSet.getString(4) %> </td>
                            <td><%=resultSet.getString(3) %> </td>
                            
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
                    <!-- Subscriber list table end -->
                       </div>
            </div>
               
            </div>
        </div>
    </div>
       <script src="vendor/jquery.min.js"></script>
    <script src="https://unpkg.com/@popperjs/core@2"></script>
    <script src="vendor/way_point/jquery.waypoints.js"></script>
    <script src="vendor/counter_up/counter_up.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.js"></script>
    <script src="vendor/chart_js/Chart.min.js"></script>
    <script src="js/app.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
	<script>
    
	let dateArr=['jul 21','jul 20','jul 19','jul 18','jul 17','jul 16','jul 15','jul 14','jul 13','jul 12','jul 11']
	let orderCountarr=[12,13,3,6,10,7,4,24,9,6,19,8]
	let viewerCountarr=[15,20,25,13,16,22,18,32,22,28,31]
	const ctx = document.getElementById('ov').getContext('2d');
	const myChart = new Chart(ctx, {
	    type: 'line',
	    data: {
	        labels: dateArr,
	       
	        datasets: [{
	            label: 'Order Count',
	            data: orderCountarr,
	            
	            backgroundColor: [
	                '#007bff30',
	                
	            ],
	            borderColor: [
	                '#007bff'
	                
	            ],
	            borderWidth: 1,
	            tension:0,
	        },
	        {
	            label: 'Viewer Count',
	            data:viewerCountarr,
	            backgroundColor: [
	                
	                '#28a74530'
	            ],
	            borderColor: [
	                
	                '#28a745'
	            ],
	            borderWidth: 1,
	            tension:0,
	        }]
	    },
	    options: {
	        legend: {
	            display: true,
	            fontColor: "white",
	            labels: {
	              usePointStyle: true,
	              fontColor:"violet",
	              
	            }
	          },
	        scales: {
	            yAxes: [{
	                gridLines: {
	                   display: false,
	                },
	                ticks:{
	                    display:false
	                }
	            }],
	            xAxes: [{
	                gridLines: {
	                   display: false,
	                }
	            }],
	        }
	    }
	});
	$('.carousel').carousel({
	    interval: 2000
	  })
	  let orderFromPlace=[5,15,4,9,7]
	  let places=["Sittwe","Ponargyan","Mrouk-Oo","Kyauk Taw","Min Pyar"]
	  const secondCtx = document.getElementById('secondChart').getContext('2d');
	  const secondChart = new Chart(secondCtx, {
	      type: 'doughnut',
	      data: {
	          labels: places,
	          datasets: [{
	              label: '# of Votes',
	              data: orderFromPlace,
	              backgroundColor: [
	                  'rgba(255, 99, 132, 0.2)',
	                  'rgba(54, 162, 235, 0.2)',
	                  'rgba(255, 206, 86, 0.2)',
	                  'rgba(75, 192, 192, 0.2)',
	                  'rgba(153, 102, 255, 0.2)',
	                  
	              ],
	              borderColor: [
	                  'rgba(255, 99, 132, 1)',
	                  'rgba(54, 162, 235, 1)',
	                  'rgba(255, 206, 86, 1)',
	                  'rgba(75, 192, 192, 1)',
	                  'rgba(153, 102, 255, 1)',
	                  
	              ],
	              borderWidth: 1
	          }]
	      },
	      options: {
	        legend: {
	            display: true,
	            fontColor: "white",
	            position: 'bottom',
	            labels: {
	              usePointStyle: true,
	              fontColor:"violet",
	              
	              
	            }
	          },
	          scales: {
	              y: {
	                  beginAtZero: true
	              }
	          }
	      }
	  });
	        $('.counter').counterUp({
	    delay: 10,
	    time: 1000
	});
	</script>
</body>
</html>