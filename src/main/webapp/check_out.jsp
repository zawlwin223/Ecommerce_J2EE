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
  .c2
  {
    background-color:#f5f5f5;

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


     <div class=" border-bottom">
       
        <div class="container">
          <div class="row py-5">
            
              <h3 class="col-lg-5 col-12 text-uppercase fs-3 text-secondary ms-lg-5 ms-3">Secure Check Out</h3>
              <a href="/Ecommerce_Project/Shopping_Session.jsp?category=All" class="col-lg-5 col-12 text-secondary text-lg-end mt-3 mt-lg-0 ms-lg-0 ms-3">Continue Browsing</a>
          
           
          </div>
        </div>
       
      </div>
      
  
      <div class="container">

        <div class="row">
          <div class="col-md-6 col-12">
            <!-- 1st card start -->
          <div class=" p-4 mt-3 pb-4  p-3 mb-5 c1">
         <h4 class="mb-5 mt-3 fs-3 text-start text-uppercase">Shipping Details</h4>
          <form class="form" >
              <div class="row">
                <div class="mb-3">
                  <label for="email">Email For Order Confirmation</label>
                  <input type="email" class="form-control" id="email" placeholder="" required name="email">
                </div>
                  <div class="col-md-6 mb-3">
                    <label for="firstName">First name</label>
                    <input type="text" class="form-control" id="firstName" placeholder="" value="" required name="firstname">
                  </div>
      
                  <div class="col-md-6 mb-3">
                    <label for="lastName">Last name</label>
                    <input type="text" class="form-control" id="lastName" placeholder="" value="" required name="lastname">
                  </div>
              </div>
      
      
                
      
                <div class="mb-3">
                  <label for="address">Address</label>
                  <input type="text" class="form-control" id="address" placeholder="" required name="address">
                </div>
                <div class="mb-3">
                  <label for="City">City</label>
                  <input type="text" class="form-control" id="City" placeholder="" required name="city">
                </div>
                <div class="mb-3">
                  <label for="phone">Phone</label>
                  <input type="number" class="form-control" id="phone" placeholder="" required name="phone">
                </div>
      
                 <div class="d-flex align-items-center">
                  <div class="col-md-6 mb-3">
                    <label for="country">Country</label>
                    <select class="custom-select d-block w-75 form-control" id="country" required name="country">
                      <option value="">Choose...</option>
                      <option>Myanmar</option>
                      
                    </select>
                  </div>
                   
                    <div class="col-md-6 mb-3">
                      <label for="zip">Zip/Postal Code</label>
                      <input type="text" class="form-control" id="zip" placeholder="" required name="zipcode">
                    </div>
               
                 </div>
               
               
               
                <div class="d-grid gap-2 mt-4">
                  <input type="submit"  value="Place Order" class="p-2 rounded bg-black text-light" >
                  <!-- <button class="btn btn-dark continue-1">Place Order</button> -->
                </div>
          </form>
          
          </div>
          
          <!-- 1str card end -->
          </div>
      
          <div class="col-md-5 col-12 bg-">
      
            <!-- 2nd card start -->
          <div class="card  p-4 mt-3 pb-4 c2  p-3 mb-5 ">
            
          <h4 class="mb-5 mt-3 display-5 text-center">Result of Costumer</h4>
          <form action="#" class="#">
              
          </form>
          <div class="row">
          <b class="col">Order Summary</b>
          <!-- <a href="#" style="color: black;" class="col pe-1 text-end">Edit Cart</a> -->
          </div>
      <br>
          <div>
            <table class="table">
            
        
            </table>
          </div>
      
          <br>
          <!-- <div>
            <b><a href="" style="color: black;">Enter promo code</a></b>
          </div> -->
          
      
          <div>
            <table class="table">
              <tr>
                <td >Subtotal</td>
                <td class="subtotal text-end"></td>
              </tr>
              <tr>
                <td>Shipping</td>
                <td class="shipping text-end">Kyats 3000</td>
              </tr>
              <tr>
                <td>Tax</td>
                <td class="text-end">$0</td>
              </tr>
            </table>
          </div>
      
          
      
          <div>
            <table class="w-100">
              <tr>
                <td ><h3>Total</h3></td>
                <td class="final text-end h3"></td>
              </tr>
            </table>
          </div>
      
      
      
      
      
          </div>
          <!-- 2nd card end -->
          </div>
      
      
        </div>
        </div>
        <div class="loading d-flex justify-content-center align-items-center top-0" style="width: 100%;height: 100%;background-color: black;position: fixed;z-index: 5;">
  <span class="loader"></span>
</div>
</body>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<script>
let loading = document.querySelector(".loading")
window.addEventListener('load', () => {
 // loading.classList.remove("d-none")
   loading.classList.add("d-none")
});
</script>
<script src="check1.js"></script>

</html>