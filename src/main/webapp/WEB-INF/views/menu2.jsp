<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% response.setHeader("Access-Control-Allow-Origin","*"); %>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Shop Homepage - Start Bootstrap Template</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Bootstrap icons-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/menu.css" rel="stylesheet" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.12.4.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<meta content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport" >
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
</head>

<body>
   <!-- Navigation-->


   <!-- Header-->

   <!-- Section-->
   <div style="width: 100%;">
      <section class="py-5" style="float: right; width: 17%; height: 773px; background-color: white;">
         
         
         
         <div class="container px-4 px-lg-5 mt-5">

            <ul id="orderList" style="list-style:none">
            
            
            </ul>
         
         </div>
      </section>
      <section class="py-5" style="float: left; width: 17%; height: 773px; background-color: #F2F2F2;">
         <div class="container px-4 px-lg-5 mt-5">

            <div class="col mb-6">
               <div class="card h-100">
                  <a class="btn1 btn-outline-dark mt-auto" href="#">메인 메뉴</a>
               </div>
            </div>
            <div class="col mb-6">
               <div class="card h-100">
                  <a class="btn1 btn-outline-dark mt-auto" href="#">사이드 메뉴</a>
               </div>
            </div>
            <div class="col mb-6">
               <div class="card h-100">
                  <a class="btn1 btn-outline-dark mt-auto" href="#">주류</a>
               </div>
            </div>
            <div class="col mb-6">
               <div class="card h-100">
                  <a class="btn1 btn-outline-dark mt-auto" href="#">음료</a>
               </div>
            </div>
            <div class="col mb-7">
               <div class="card h-100">
                  <a class="btn1 btn-outline-dark mt-auto" href="#">주문 내역</a>
               </div>
            </div>
            <div class="col mb-6">
               <div class="card h-100">
                  <a class="btn1 btn-outline-dark mt-auto" href="#">직원 호출</a>
               </div>
            </div>
         </div>
      </section>
      <section class="py-5" style="float: right; width: 66%; height: 773px; background-color: #F2F2F2;">
         <h2 style="text-align : center">주문 현황</h2>
      </section>
   </div>
   </div>
   <div id="formContainer" style="display: none">
      <input name="id" value="1" /> <input name="menu" /> <input name="count" />
   </div>
   <!-- Footer-->
   </div>
   
   
   </div>
   </section>
   </div>
   </div>
   <!-- Footer-->

   <!-- Bootstrap core JS-->
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
   <!-- Core theme JS-->
   <script src="js/ordering.js"></script>
   <script type="text/javascript">
   document.querySelectorAll('.cartbutton').forEach(button => button.addEventListener('click', e => {
       if(!button.classList.contains('loading')) {

           button.classList.add('loading');

           setTimeout(() => button.classList.remove('loading'), 3700);

       }
       e.preventDefault();
   }));

   </script>


<script>
const testButton = document.getElementById("testButton");
testButton.addEventListener("click", ()=>console.log("test"))


</script>

</body>

</html>