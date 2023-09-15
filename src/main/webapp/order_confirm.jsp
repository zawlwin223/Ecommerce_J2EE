<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
</head>
<style>
    tr{
        height: 40px;
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
PreparedStatement ps_order = null;
ResultSet res = null;
ResultSet res_order = null;
Class.forName(driverName);
con=DriverManager.getConnection(connectionUrl,userId,password);
ps=con.prepareStatement("select * from user where Order_Id=?");
ps_order = con.prepareStatement("select * from userorder where Order_Id=?");
String order_id=request.getParameter("id");

ps.setString(1, order_id);
ps_order.setString(1,order_id);
res=ps.executeQuery();
res_order = ps_order.executeQuery();

%>
	
	<div class="container">
    <div class="row pb-5" >
        <div class="container">
            <div class="row py-5 justify-content-center order-box" >
                <div class="col-12 mt-5 text-center">
                    <h2 class="fw-bold text-uppercase mt-5">ORDER CONFIRMED</h2>
                <P>You'll receive a confirmination email soon</P>
                <p>Order Id : <%= order_id%></p>
                </div>
                 <div class="col-lg-8 col-12 border px-3 pb-3 mt-4" >
        <%
try{ 

while(res_order.next()){
%>



                       <div class="d-flex justify-content-between mt-3  w-100 align-items-center py-5  border-bottom " style="height: 80px;">
                <div class="w-25">
                    <img src="<%=res_order.getString(7) %>" alt="" style="height: 70px;">
                </div>
                <div class="w-50">
                    <h5 ><%=res_order.getString(3)%></h5>
                    <p>
                        Qty:<%=res_order.getInt(4)%><br>
                        Size:<%=res_order.getString(10)%>
                    </p>
                    
                    
                </div>
               
                
                <div>
                    <span class="order_price">$<%=res_order.getInt(5)%></span>
                  
                </div>
            </div>
            
       
                   
<% 
}

} catch (Exception e) {
e.printStackTrace();
}
%>       
                     <div class="d-flex justify-content-end mt-4">
                        <table class="table w-50 ">
                            <tr>
                              <td class="">Subtotal</td>
                              <td class="subtotal text-end"></td>
                            </tr>
                            <tr>
                              <td>Shipping</td>
                              <td class="shipping text-end">$10</td>
                            </tr>
                            <tr>
                              <td>Tax</td>
                              <td class="text-end">$0</td>
                            </tr>
                            <tr >
                                <td>Total</td>
                                <td class="text-end total">$0</td>
                              </tr>
                          </table>
                     </div>
                </div>


        <%
try{ 

while(res.next()){
%>

<div class="col-lg-8 col-12 border mt-5 p-3 d-flex justify-content-between">
                    <div>
                        <h5 >Shipping Address</h5>
                        <small class="mb-0"><%= res.getString(2)%></small><br>
                        <small><%= res.getString(5)%>,</small><small> <%= res.getString(7)%>,</small><small> <%= res.getString(8)%></small><br>
                        <small><%= res.getString(6)%></small>
                    </div>
                    <div>
                        <h5 >Billing Address</h5>
                        <small class="mb-0"><%= res.getString(2)%></small><br>
                        <small><%= res.getString(5)%>,</small><small> <%= res.getString(7)%>,</small><small> <%= res.getString(8)%></small><br>
                        <small><%= res.getString(6)%></small>
                    </div>
                    <div>
                        <h5>Payment</h5>
                        <small>Offline</small>
                    </div>
                </div>

                <div class="col-lg-8 col-12 text-secondary text-center mt-3">
                    <a href="/Ecommerce_Project/Shopping_Session.jsp?category=All" class="text-secondary" onclick="window.location.reload()">Continue Browsing</a>
                </div>
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




                



</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>

<script>

let price = document.querySelectorAll(".order_price")
let subtotal = document.querySelector(".subtotal")
let total = document.querySelector(".total")
let p = 0;

price.forEach((val)=>{
    p+= Number(val.innerHTML.slice(1))
    console.log()
})
total.innerHTML =`$\${ p+10}`
subtotal.innerHTML=`$\${p}`
console.log(p)

</script>
</html>