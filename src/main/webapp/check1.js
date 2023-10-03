let data = JSON.parse(localStorage.getItem("Cart_Item"))
let table = document.querySelector(".table")
let subtotal = document.querySelector(".subtotal")
let shipping = document.querySelector(".shipping")
let final = document.querySelector(".final");
let form = document.querySelector(".form")
let total = 0;
let tr = ""

let email = document.querySelector("#email")
let firstName = document.querySelector("#firstName")
let lastName= document.querySelector("#lastName")
let address = document.querySelector("#address")
let city = document.querySelector("#City")
let phone = document.querySelector("#phone")
let zip = document.querySelector("#zip")
let country = document.querySelector("#country")

let user_data = {};
let product=[];

console.log("Hello World it works")

form.addEventListener("submit",(e)=>{
   e.preventDefault();
       id =Math.random().toString(16).slice(2);
       let date = new Date();
       let current_date = `${date.getDate()}.${date.getMonth()}.${date.getFullYear()}`
       console.log(current_date)
       console.log("Update Work")
      
      user_data.date = current_date
 	 user_data.order_id = id
     user_data.email = email.value
     user_data.firstName = firstName.value
     user_data.lastName = lastName.value
     user_data.address = address.value
     user_data.city = city.value
     user_data.phone = phone.value
     user_data.zip = zip.value
     user_data.total = total+10;
     user_data.country = country.value
 fetch("/Ecommerce_Project/Order",{
        method:"POST",
       
        body:JSON.stringify(user_data)
     }).then((res)=>{
		 location.href = res.url
		
	 }).then(()=>{
        localStorage.removeItem("Cart_Item")
     })
   
})

data.forEach((val)=>{
    product.push({id:val.id,qty:val.quantity,price:val.total_price,img:val.Img,title:val.title,category:val.category,brand:val.brand,size:val.size})
    total+=Number(val.total_price)
    console.log(val.total_price)
tr+=`
<tr>
<td class="align-middle"><img src="${val.Img}" alt="" style="width: 50%;"> </td>
<td class="w-50 align-middle">${val.title} <br> QTY : ${val.quantity}<br> Size : ${val.size}</td>

<td  class="align-middle">Kyats ${val.total_price}</td>
</tr>
`
})
table.innerHTML= tr;
subtotal.innerHTML=`Kyats ${total}`;
final.innerHTML = `Kyats ${total+Number(shipping.innerHTML.slice(6))}`;

user_data.product = product

