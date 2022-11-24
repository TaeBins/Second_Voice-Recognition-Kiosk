<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
response.setHeader("Access-Control-Allow-Origin", "*");
%>
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
<meta content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
</head>

<body>
	<!-- Navigation-->


	<!-- Header-->

	<!-- Section-->
	<div style="width: 100%;">
		<section class="py-5" style="float: right; width: 17%; height: 773px; background-color: white;">



			<div class="container px-4 px-lg-5 mt-5">

				<ul id="orderList" style="list-style: none">


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

			<div class="slide slide_wrap">
				<div class="slide_item">
					<div class="container px-4 px-lg-5 mt-5">
						<div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">


							<c:forEach var="vo" items="${menuList}" begin="0" end="5">
								<div class="col mb-5" style="padding-left: 15px; padding-right: 15px;">
									<div class="card h-100">
										<!-- Sale badge-->
										<div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Sale</div>
										<!-- Product image-->
										<img class="card-img-top" src="assets/menu/${vo.menu_img1}" alt="..." />
										<!-- Product details-->
										<div class="card-body p-4">
											<div class="text-center">
												<!-- Product name-->
												${vo.menu_name}
												<h5 class="fw-bolder"></h5>
												<!-- Product price-->
												${vo.menu_price}원
											</div>
										</div>
										<!-- Product actions-->
										<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
											<div class="text-center">
												<button name="${vo.menu_name}" class="cartbutton">
													<span>Add to cart</span>
													<div class="cart">
														<svg viewBox="0 0 36 26">
            <polyline points="1 2.5 6 2.5 10 18.5 25.5 18.5 28.5 7.5 7.5 7.5"></polyline>
            <polyline points="15 13.5 17 15.5 22 10.5"></polyline>
        </svg>
													</div>
											</div>
										</div>
									</div>
								</div>
							</c:forEach>




						</div>
						<ul style="color: white">
						</ul>
					</div>
				</div>
				<div class="slide_item">
					<div class="container px-4 px-lg-5 mt-5">
						<div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">


							<c:forEach var="vo" items="${vo.menuList}" begin="6" end="11">
								<div class="col mb-5" style="padding-left: 15px; padding-right: 15px;">
									<div class="card h-100">
										<!-- Sale badge-->
										<div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Sale</div>
										<!-- Product image-->
										<img class="card-img-top" src="assets/menu/${vo.menu_img1}" alt="..." />
										<!-- Product details-->
										<div class="card-body p-4">
											<div class="text-center">
												<!-- Product name-->
												${vo.menu_name}
												<h5 class="fw-bolder"></h5>
												<!-- Product price-->
												${vo.menu_price}원
											</div>
										</div>
										<!-- Product actions-->
										<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
											<div class="text-center">
												<button name="${vo.menu_name}" class="cartbutton">
													<span>Add to cart</span>
													<div class="cart">
														<svg viewBox="0 0 36 26">
            <polyline points="1 2.5 6 2.5 10 18.5 25.5 18.5 28.5 7.5 7.5 7.5"></polyline>
            <polyline points="15 13.5 17 15.5 22 10.5"></polyline>
        </svg>
													</div>
											</div>
										</div>
									</div>
								</div>
							</c:forEach>




						</div>
						<ul style="color: white">
						</ul>
					</div>
				</div>
				<div class="slide_item">3</div>
				<div class="slide_item">4</div>
				<div class="slide_item">5</div>
				<div class="slide_prev_button slide_button">◀</div>
				<div class="slide_next_button slide_button">▶</div>

			</div>
			<ul class="slide_pagination"></ul>
			<script src="js/slide.js"></script>


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