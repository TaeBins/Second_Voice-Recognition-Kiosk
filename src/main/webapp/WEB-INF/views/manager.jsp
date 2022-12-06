<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Keys-Core</title>
<!-- Favicon-->
<link href="css/menu.css" rel="stylesheet" />
<link href="css/receipt.css" rel="stylesheet" />
<link rel="stylesheet" href="@sweetalert2/theme-wordpress-admin/wordpress-admin.css">
<script src="sweetalert2/dist/sweetalert2.min.js"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="js/manager.js"></script>
<style>
/*  overflow scroll 가려주는 스타일 */
.wrap::-webkit-scrollbar {
	display: none;
}
</style>
</head>
<body style="background-color: #F2F2F2;">
	<!-- Navigation-->
	<nav style="width: 100%; position: fixed; z-index: 1000; right: 0" class="navbar navbar-expand-sm bg-dark navbar-dark">
		<div class="container-fluid">
			<a class="navbar-brand" href="/manager">관리자 페이지</a>
		</div>
	</nav>
	<section class="py-5" style="float: left; width: 15%; height: 702px;">
		<div class="container px-4 px-lg-5 mt-5">
			<div class="col mb-6">
				<form action="/stockreset" method="post">
					<div class="card h-100">
						<input type="submit" class="btn1 btn-outline-dark mt-auto" value="재고 리셋" onclick="stock_reset()">
					</div>
				</form>
			</div>
			<div class="col mb-6">
				<div class="card h-100">
					<a class="btn1 btn-outline-dark mt-auto" href="/manager">최종 결제</a>
				</div>
			</div>
		</div>
	</section>
	<!-- 해당 영수증 -->
	<section class="py-6">
		<div style="height: 80%; overflow: scroll; overflow-y: auto" class="wrap">
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
					<div>
						<dt>영수증 번호</dt>
						<dd>${receiptList[0].receipt_num}</dd>
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
							<span class="price">${rl.dc_amount}</span>
						</dd>
					</div>
					<div class="total">
						<dt>
							<h2>총액</h2>
						</dt>
						<dd>
							<h2>
								<span class="price" id="sumhere">${sum}</span>
							</h2>
						</dd>
					</div>
				</dl>
			</footer>
			<br> <br>
			<form method="get" id="rform" onsubmit="return false;">
				<div class="col mb-6">
					<div class="card h-100">
						<a class="btn1 btn-outline-dark mt-auto" href="#" onclick="payment();">결제 완료</a>
					</div>
				</div>
			</form>
		</div>
	</section>
</body>
</html>