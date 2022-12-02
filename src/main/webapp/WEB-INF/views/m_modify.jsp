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
				<div class="card h-100">
					<a class="btn1 btn-outline-dark mt-auto" href="/m_modify">재고 수정</a>
				</div>
			</div>
			<div class="col mb-6">
				<div class="card h-100">
					<a class="btn1 btn-outline-dark mt-auto" href="/m_previous">이전 영수증</a>
				</div>
			</div>
			<div class="col mb-6">
				<div class="card h-100">
					<a class="btn1 btn-outline-dark mt-auto" href="/m_payment">최종 결제</a>
				</div>
			</div>
			<div class="col mb-6">
				<div class="card h-100">
					<a class="btn1 btn-outline-dark mt-auto" href="/m_sumsales">누적 판매량</a>
				</div>
			</div>
		</div>
	</section>
	<section style="padding-top: 10%; padding-left: 10%;">
	<div>
	<table>
	<h2>메뉴 재고</h2>
	<thead>
	<tr>
	<td>이름</td>
	<td>가격</td>
	<td>남은수량</td>
	</tr>
	</thead>
	</table>
	</div>
	</section>
</body>
</html>