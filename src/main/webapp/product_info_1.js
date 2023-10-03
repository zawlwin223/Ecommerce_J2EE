
let add_to_cart = document.querySelector(".add_to_cart");

let body = document.querySelector(".cart_body")
// let cart_link = document.querySelector(".cart_link")
// var data_from_LS = JSON.parse(localStorage.getItem("Cart_Item"));
var items = {};
let product_img = document.querySelector(".product-image");
let product_title = document.querySelector(".product-title").innerHTML;
let product_price = document.querySelector(".product-price").innerHTML;
let product_quantity = document.querySelector(".item_quantity_text");
let product_brand = document.querySelector(".brand").innerHTML;
let product_category = document.querySelector(".category").innerHTML;



data_from_LS.forEach((val)=>{
    
    if(val.id==product_img.getAttribute("product_id")){
        add_to_cart.innerHTML="Already In Cart"
        add_to_cart.setAttribute('disabled', '');
       
    }
   
})
function add_cart(){
	
    console.log("This is  add cart clik")
    cart_body.classList.remove("invisible")
    // del.classList.add("d-block") 
 
    setItem();
    
    cart_icon();
    to_cart_body(data_from_LS);
    total_price()
    add_to_cart.innerHTML="Already In Cart"
    add_to_cart.setAttribute('disabled', '');
    if(data_from_LS.length==0){
   
        del_box.innerHTML=`<p class=" ms-3 del">Your Cart Is Empty</p>`
        let check_out = document.querySelector(".check_out")
    check_out.setAttribute("disabled","")
       
     }else if(data_from_LS.length!=0){
        del_box.innerHTML=` <p class="text-danger text-end me-3 del" onclick="del_all()">Delete All</p>`
        let check_out = document.querySelector(".check_out")
    check_out.removeAttribute("disabled")
     }   
}



function setItem(){
	let product_size = document.querySelector(".size").value;


    let total_result = Number(product_price.slice(6))*Number(product_quantity.innerHTML)
    items.id = product_img.getAttribute("product_id")
    items.Img = product_img.getAttribute("src");
    items.title = product_title;
    items.price = product_price;
    items.category = product_category;
    items.brand = product_brand;
    items.quantity = product_quantity.innerHTML;
    items.total_price =total_result;
    items.size = product_size;

console.log(total_result)
    if(data_from_LS == null){
       data_from_LS= []
        
    }

        data_from_LS.push(items);
        save_to_ls(data_from_LS)
            
}