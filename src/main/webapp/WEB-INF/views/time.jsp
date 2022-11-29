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
<title>Shop Homepage - Start Bootstrap Template</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Bootstrap icons-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/menu.css" rel="stylesheet" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.12.4.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<meta
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"
	name="viewport">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<link href="css/time.css" rel="stylesheet" />
<link href="css/menu.css" rel="stylesheet" />

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

	<section class="py-6 style="position:fixed;float:left; width: 15%; height: 702px; margin-top:68px;background-color:#F2F2F2;">
		<div class="container px-4 px-lg-5 mt-5"></div>
	</section>

	<section class="py-6"
		style="float: left; width: 15%; height: 702px; background-color: #F2F2F2;">
		<div class="container px-4 px-lg-5 mt-5">
			<div class="col mb-6">
				<div class="card h-100">
					<a class="btn1 btn-outline-dark mt-auto" href="/menu">메인 메뉴</a>
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
			<div class="col mb-6">
				<div class="card h-100">
					<a class="btn1 btn-outline-dark mt-auto" href="/receipt">주문 내역</a>
				</div>
			</div>
			<div class="col mb-7">
				<div class="card h-100">
					<a class="btn1 btn-outline-dark mt-auto" href="#">조리 시간</a>
				</div>
			</div>
			<div class="col mb-6">
				<div class="card h-100">
					<a class="btn1 btn-outline-dark mt-auto" href="#">직원 호출</a>
				</div>
			</div>
		</div>
	</section>

	<!-- 조리시간 -->
	<section>
		<h3>조리 시간</h3>
		<p>Running progress bar from 0% to 100% in 10 seconds</p>
		<div class="progress">
			<div id="dynamic"
				class="progress-bar progress-bar-success progress-bar-striped active"
				role="progressbar" aria-valuenow="0" aria-valuemin="0"
				aria-valuemax="100" style="width: 0%">
				<span id="current-progress"></span>
			</div>
		</div>
	</section>

	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="js/ordering.js"></script>
	<script>
	$(function() {
		  var current_progress = 0;
		  var interval = setInterval(function() {
		      current_progress += 10;
		      $("#dynamic")
		      .css("width", current_progress + "%")
		      .attr("aria-valuenow", current_progress)
		      .text(current_progress + "% Complete");
		      if (current_progress >= 100)
		          clearInterval(interval);
		  }, 1000);
		});
	</script>
</body>

</html>