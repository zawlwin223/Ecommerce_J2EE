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
 body{
 background:black;
 display:flex;
 justify-content:center;
 align-items:center;
 }
 input{
 color:white !important;
 }
 ::placeholder { 
  color: white!important;
  
}

.add:hover{
color:black !important;
}
</style>
<body class="vh-100">


<form action="login" method="Post" style="width:500px;">
<h1 class="text-center mb-5" style="color:violet">ADMIN LOGIN</h1>
                        <div class="row">
                            <div class="col-12 mt-2">
                    
                                <input type="text" class="form-control bg-transparent text-light"  id="firstName" placeholder="Enter Admin Name" value="" required name="admin_name" autocomplete=off>
                              </div>
                  
                              <div class="col-12 mt-4">
                              
                                <input type="password" class="form-control bg-transparent text-light" id="lastName" placeholder="Enter Password" value="" required name="password" autocomplete=off>
                              </div>
                            
                           
                  
                        
                  
                              <div class="col-12 mt-4">
                              
                                <input type="submit" class="form-control add text-light btn btn-outline-light" id="lastName" placeholder="" value="LOGIN" required name="lastname">
                              </div>
                            </div>
                      
                         <h6 class="text-danger mt-2">Your Information is incorrect.Please Login again.</h6>
                    </form>
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


</html>