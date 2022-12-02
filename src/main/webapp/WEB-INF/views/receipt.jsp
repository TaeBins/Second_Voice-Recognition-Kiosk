<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
response.setHeader("Access-Control-Allow-Origin", "*");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Keys-Core</title>
<!-- Favicon-->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Bootstrap icons-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/menu.css" rel="stylesheet" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.12.4.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<meta
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"
	name="viewport">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<link href="css/receipt.css" rel="stylesheet" />
<style>
/*  overflow scroll 가려주는 스타일 */
.wrap::-webkit-scrollbar {
	display: none;
}
</style>

</head>
<body style="background-color: #F2F2F2;">
	<!-- Navigation-->
	<nav style="width: 100%; position: fixed; z-index: 1000; right: 0"
		class="navbar navbar-expand-sm bg-dark navbar-dark">
		<div class="container-fluid">
			<a class="navbar-brand" href="/">키코네 맥주</a>
		</div>
	</nav>
	<!-- Header-->
	<!-- Section-->
	<section class="py-5"
		style="position: fixed; float: right; width: 17%; height: 773px;">
		<div class="container px-4 px-lg-5 mt-5">
			<ul id="orderList" style="list-style: none">
			</ul>
		</div>
	</section>
	<section class="py-5" style="float: left; width: 15%; height: 702px;">
		<div class="container px-4 px-lg-5 mt-5">

			<div class="col mb-6">
				<div class="card h-100">
					<a class="btn1 btn-outline-dark mt-auto" href="/1">메인 메뉴</a>
				</div>
			</div>
			<div class="col mb-6">
				<div class="card h-100">
					<a class="btn1 btn-outline-dark mt-auto" href="/2">사이드 메뉴</a>
				</div>
			</div>
			<div class="col mb-6">
				<div class="card h-100">
					<a class="btn1 btn-outline-dark mt-auto" href="/3">주류</a>
				</div>
			</div>
			<div class="col mb-6">
				<div class="card h-100">
					<a class="btn1 btn-outline-dark mt-auto" href="/4">음료</a>
				</div>
			</div>
			<div class="col mb-6">
				<div class="card h-100">
					<a class="btn1 btn-outline-dark mt-auto" href="/receipt">주문 내역</a>
				</div>
			</div>
			<div class="col mb-7">
				<div class="card h-100">
					<button type="button" class="btn1 btn-outline-dark mt-auto"
						data-bs-toggle="modal" data-bs-target="#myModal">더치페이</button>
				</div>
			</div>
			<div class="col mb-6">
				<div class="card h-100">
					<a class="btn1 btn-outline-dark mt-auto" href="#"
						onclick="callme();">직원 호출</a>
				</div>
			</div>
		</div>
	</section>
	<!-- receipt -->
	<section class="py-6"
		style="position: fixed; float: right; left: 17%; width: 66%; height: 773px;">
		<div style="height: 80%; overflow: scroll; overflow-y: auto"
			class="wrap">
			<h1>영수증</h1>
			<header>
				<dl class="info">
					<div>
						<dt>키코네 맥주</dt>
						<dd>광주광역시 서구 경열로 20</dd>
					</div>
					<div>
						<dt>전화번호</dt>
						<dd>062-123-4567</dd>
					</div>
					<div>
						<dt>Date</dt>
						<dd>${receiptList[0].receipt_date}</dd>
					</div>
			</header>
			<main>
				<table style="width: 580px;">
					<colgroup>
						<col>
						<col>
						<col>
						<col>
					</colgroup>
					<tr>
						<th>메뉴</th>
						<th>가격</th>
						<th>갯수</th>
						<th>합계</th>
					</tr>
					<c:forEach var="rl" items="${receiptList}">
						<tr>
							<td>${rl.menu_name}</td>
							<td><span class="price">${rl.menu_price}</span></td>
							<td>${rl.order_cnt}</td>
							<td><span class="price">${rl.order_cnt*rl.menu_price}</span></td>
							<c:set var="sum" value="${sum+(rl.menu_price*rl.order_cnt)}" />

						</tr>
					</c:forEach>
				</table>
			</main>
			<footer>
				<dl class="info">
					<div class="discount">
						<dt>할인금액</dt>
						<dd>
							<span class="price">0</span>
						</dd>
					</div>
					<div class="total">
						<dt>
							<h2>총액</h2>
						</dt>
						<dd>
							<h2>
								<span class="price">${sum}</span>
							</h2>
						</dd>
					</div>
				</dl>
				<p class="greeting">키코네 맥주를 방문해주셔서 감사합니다.</p>
			</footer>
		</div>
	</section>


	<!-- Bootstrap core JS-->
	
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
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
	<script
		src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
	<div style="visibility: hidden;" id="formContainer"></div>
	<div class="modal fade" id="myModal">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">더치페이 계산기</h4>
					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					나눠 낼 인원 : <span class="material-symbols-outlined"
						onclick='count("minus")'> indeterminate_check_box </span> <span
						id='result'>1</span> <span class="material-symbols-outlined"
						onclick='count("plus")'> add_box </span>
				</div>

				<!-- Modal footer -->
				<div class="modal-footer"></div>
				<div class="modal-footer-1"></div>

			</div>
		</div>
	</div>
	<script>
	 const resultElement = document.getElementById('result');

function count(type)  {
  // 결과를 표시할 element
  
  // 현재 화면에 표시된 값
  let number = resultElement.innerText;
  // 더하기/빼기
  if(type === 'plus') {
    number = parseInt(number) + 1;
  }else if(type === 'minus')  {
	  if(number > 1){
    number = parseInt(number) - 1;
  	}
  }
  
  // 결과 출력
  resultElement.innerText = number;
  document.querySelector("div.modal-footer").innerHTML = `총 주문 금액 : `+${totalPrice}
  document.querySelector("div.modal-footer-1").innerHTML = `분할 금액 :` + Math.round(parseInt(${totalPrice}) / parseInt(number))

}
	</script>
</body>
</html>