<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<title>Start-Screen</title>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/gsap/2.0.2/TweenMax.min.js"></script>
<link href="css/style.css" rel="stylesheet" />
<!-- Bootstrap Icons-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />
<!-- Google fonts-->
<link
	href="https://fonts.googleapis.com/css?family=Merriweather+Sans:400,700"
	rel="stylesheet" />
<link
	href="https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic"
	rel="stylesheet" type="text/css" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/index.css" rel="stylesheet" />



</head>
<body id="page-top">
	</div>
	<!-- Navigation-->
	<!-- 로고헤더-->
	<nav class="navbar navbar-expand-lg navbar-light fixed-top py-3"
		id="mainNav">
		<div class="container px-4 px-lg-5">
			<a href="/" class="navbar-brand"><img src="assets/index/logo.png"
				height="70" width="200"></a>
		</div>
	</nav>
	<!-- 간판-->
	<header class="masthead">
		<div class="container px-4 px-lg-5 h-100">
			<div
				class="row gx-4 gx-lg-5 h-100 align-items-center justify-content-center text-center">
				<div class="col-lg-8 align-self-end">
					<h1 class="text-white font-weight-bold">키코네 맥주</h1>
					<hr class="divider" />
				</div>
				<div class="col-lg-8 align-self-baseline">
					<p class="text-white-75 mb-5">
						<!-- 마이크 아이콘 -->
						<i style="font-size: 40px;" class="bi bi-mic"></i>
					<ul class="music">
						<!-- 음성막대 효과 -->
						<c:forEach var="i" begin="1" end="17">
							<li id="bar${i}"></li>
						</c:forEach>
					</ul>
					</p>

					<!-- 안내문 -->
					<p style="color: white">
						1. "하이키코"를 부릅니다. <br>2. "메인 메뉴 보여줘" 라고 카테고리를 말합니다.<br>
						3. "생맥주 2잔이랑 바지락 술국 주문해줘" 라고 주문사항을 말합니다.<br> <br> <br>
					</p>
					<!-- 터치주문 버튼 -->
					<a class="btn btn-primary btn-xl" href="menu">터치로 주문하기</a>

				</div>
			</div>
		</div>
	</header>
	<div class="container">
		<svg version="1.1" xmlns="http://www.w3.org/2000/svg"
			xmlns:xlink="http://www.w3.org/1999/xlink"
			xmlns:a="http://ns.adobe.com/AdobeSVGViewerExtensions/3.0/" x="0px"
			y="0px" width="600px" height="600px" viewBox="0 0 600 600"
			enable-background="new 0 0 600 600" xml:space="preserve">
<defs>
<mask id="beerLiquidMask">
  <path fill="#FFFFFF"
				d="M255.9,424c21.1,0,42.2,0,63.3,0c6,0,10.1-8.1,11.6-12.8
    c-2.8-27.1-5.6-54.1-8.4-81.2c-0.7-6.6-5.9-12-11.4-12c-15.6,0-31.2,0-46.8,0c-5.6,0-10.7,5.4-11.4,12c-2.8,27.2-5.6,54.3-8.4,81.5
    C245.8,416.2,250,424,255.9,424z" />
</mask>   
</defs>
  <mask id="beerStreamMask">
<rect fill="#FFFFFF" x="260" y="184" width="60" height="240" />
  </mask>
<g class="faucet">
	<path fill="#FFFFFF"
				d="M300.7,184.3v-45.8c0-8.9-7.3-16.2-16.2-16.2s-16.2,7.3-16.2,16.2v45.8H300.7z" />
	<path fill="#E1E0E0"
				d="M287,122.5c-0.8-0.1-1.6-0.2-2.5-0.2c-8.9,0-16.2,7.3-16.2,16.2v45.8h5v-45.8
		C273.3,130.5,279.3,123.8,287,122.5z" />
</g>
<g class="handle">
	<g>
		<path fill="#BCBCBC"
				d="M287.3,128.4c-1.3-12.4,8.7-24.9,5.9-37.3c-0.6-2.2-4.3-4.1-7.5-4.1c-0.5,0-1.1,0-1.6,0
			c-3.2,0-6.9,1.9-7.5,4.1c-2.8,12.3,7.1,24.7,5.9,37c-2,0.7-3.5,2.5-3.5,4.6c0,2.7,2.5,4.9,5.7,4.9c3.1,0,5.7-2.2,5.7-4.9
			C290.3,130.9,289.1,129.3,287.3,128.4z" />
	</g>
	<g>
		<path fill="#C5C5C5"
				d="M287.3,128.4c-1.3-12.4,8.7-24.9,5.9-37.3c-0.6-2.2-4.3-4.1-7.5-4.1c-0.3,0-0.7,0-1,0
			c3.2,0,6.9,1.9,7.5,4.1c2.8,12.4-7.2,24.9-5.9,37.3c1.8,0.8,3,2.5,3,4.3c0,2.6-2.3,4.7-5.2,4.9c0.2,0,0.3,0,0.5,0
			c3.1,0,5.7-2.2,5.7-4.9C290.3,130.9,289.1,129.3,287.3,128.4z" />
	</g>
</g>

<g mask="url(#beerStreamMask)">
		<path class="beerStream" fill="#F1B021"
				d="M285.9,599c-4.4,0-8-3.6-8-8c0-9.5,0.3-14.4,0.6-19c0.3-4.6,0.6-9,0.6-18c0-8.5-0.8-12.6-1.7-16.9
			c-0.9-4.7-2-10-2-20.1c0-9.6,0.4-14.5,0.9-19.2c0.4-4.6,0.8-8.9,0.8-17.8c0-9.8,0.7-14.8,1.4-19.6c0.6-4.5,1.2-8.7,1.2-17.4
			c0-8-1.2-11.7-2.6-16.1c-1.6-4.9-3.3-10.4-3.3-20.9c0-9.8,0.7-14.8,1.4-19.7c0.7-4.5,1.3-8.7,1.3-17.3c0-8.7-0.6-12.9-1.3-17.3
			c-0.7-4.8-1.5-9.8-1.5-19.7c0-10.3,1.5-15.8,2.8-20.6c1.2-4.4,2.2-8.2,2.2-16.4c0-9.3,0-14,0.1-18.6c0-4.5,0.1-9.2,0.1-18.4
			c0-9.4,0.2-14.2,0.4-18.8c0.2-4.7,0.3-9.1,0.3-18.2c0-8.2-1-12-2.2-16.5c-1.3-4.8-2.7-10.3-2.7-20.5c0-4.4,3.6-8,8-8s8,3.6,8,8
			c0,8.2,1,12,2.2,16.5c1.3,4.8,2.7,10.3,2.7,20.5c0,9.4-0.2,14.2-0.4,18.8c-0.2,4.7-0.3,9.1-0.3,18.2c0,9.3,0,14-0.1,18.6
			c0,4.5-0.1,9.2-0.1,18.4c0,10.3-1.5,15.8-2.8,20.6c-1.2,4.4-2.2,8.2-2.2,16.4c0,8.7,0.6,12.9,1.3,17.3c0.7,4.8,1.5,9.8,1.5,19.7
			c0,9.8-0.7,14.8-1.4,19.7c-0.7,4.5-1.3,8.7-1.3,17.3c0,8,1.2,11.7,2.6,16.1c1.6,4.9,3.3,10.4,3.3,20.9c0,9.8-0.7,14.8-1.4,19.6
			c-0.6,4.5-1.2,8.7-1.2,17.4c0,9.6-0.4,14.5-0.9,19.2c-0.4,4.6-0.8,8.9-0.8,17.8c0,8.5,0.8,12.6,1.7,16.9c0.9,4.7,2,10,2,20.1
			c0,9.5-0.3,14.4-0.6,19c-0.3,4.6-0.6,9-0.6,18C293.9,595.4,290.3,599,285.9,599z" />
  </g>
  <svg class="fullGlass" x="0" y="0">  
<g mask="url(#beerLiquidMask)">
	<path class="beerLiquid" fill="#F1B021"
					d="M357.1,498.3c-6.4,6.3-10.2-3.7-19.1-3.7c-9,0-9,5.4-17.9,5.4c-9,0-9-1.8-17.9-1.8c-9,0-9-2.6-17.9-2.6
		c-9,0-9,2.4-17.9,2.4c-9,0-9-2.4-17.9-2.4c-9,0-9,3.7-17.9,3.7c-9,0-9.5,2.2-15.9-4.1c-6.3-6.2-1.5-6.7-1.5-15.6
		c0-8.9-3.3-8.9-3.3-17.7c0-8.9,3.4-8.9,3.4-17.7c0-8.9-0.7-8.9-0.7-17.7c0-8.8,2.1-8.8,2.1-17.7c0-8.9-4.5-8.9-4.5-17.7
		c0-8.9,5.1-8.9,5.1-17.7c0-8.9-1.3-8.9-1.3-17.7s-8.2-12-1.8-18.2c6.4-6.3,9.5-0.3,18.5-0.3c9,0,9,3.9,17.9,3.9c9,0,9-4,17.9-4
		c9,0,9,3.2,17.9,3.2c9,0,9-0.1,17.9-0.1c9,0,9,0.2,17.9,0.2c9,0,9-3.5,17.9-3.5s10.5-4.1,16.8,2.2c6.3,6.2,0.4,7.7,0.4,16.6
		c0,8.9-1.4,8.9-1.4,17.7c0,8.9,5.2,8.9,5.2,17.7c0,8.9-6,8.9-6,17.7c0,8.8,4.4,8.8,4.4,17.7c0,8.9-3.4,8.9-3.4,17.7
		c0,8.9,1,8.9,1,17.7c0,8.9-4.1,9.8-2,18.4C355.5,489.9,363.4,492.1,357.1,498.3z" />
</g>
   
<g class="glass">
	<g opacity="0.2">
		<path fill="#FFFFFF"
					d="M319.1,433c-21.1,0-42.2,0-63.3,0c-7.6,0-13.3-5.4-12.6-12c3.1-30.3,6.3-60.7,9.4-91
			c0.7-6.6,5.9-12,11.4-12c15.6,0,31.2,0,46.8,0c5.6,0,10.7,5.4,11.4,12c3.1,30.3,6.3,60.7,9.4,91C332.4,427.6,326.8,433,319.1,433z
			" />
	</g>
	<path fill="#FFFFFF" opacity="0.8"
					d="M330.7,411.2c-1.4,4.6-5.6,12.8-11.6,12.8c-21.1,0-42.2,0-63.3,0c-6,0-10.3-8.2-11.7-12.8
		c-0.1,1.2-0.8,8.5-0.9,9.8c-0.7,6.6,4.9,12.1,12.6,12.1c21.1,0,42.2,0,63.3,0c7.6,0,13.3-5.5,12.6-12.1
		C331.6,419.7,330.8,412.4,330.7,411.2z" />
	<polygon opacity="0.32" fill="#FFFFFF"
					points="320.1,431 304.9,431 295.5,317.7 310.7,317.7 	" />
	<polygon opacity="0.32" fill="#FFFFFF"
					points="268.4,431 253.9,431 264.3,318 278.8,318 	" />
	<path fill="#FFFFFF"
					d="M323.4,345.2c0,0,22.4,3.2,19.4,27.9s-13.1,26.5-13.1,26.5l0.5,7.8c0,0,17.7-7,18.1-32.2
		c0.3-20.5-2.9-26.7-10.5-32.5c-5.2-3.9-10.4-4-14.8-5.1C323,345.7,323.4,345.2,323.4,345.2z" />
</g>
  <g class="froth">
<circle cx="260" cy="330" r="0" fill="#ffffff" opacity="0" />
<circle cx="276" cy="345" r="3" fill="#ffffff" opacity="0" />  
<circle cx="290" cy="320" r="5" fill="#ffffff" opacity="0" />  
<circle cx="310" cy="328" r="0" fill="#ffffff" opacity="0" /> 
  </g>
  <g class="beerBubbles" stroke="#ffffff" fill="none"
					mask="url(#beerLiquidMask)">
<circle cx="285" cy="420" r="2" opacity="0" />
<circle cx="296" cy="405" r="2" opacity="0" />  
<circle cx="285" cy="405" r="2" opacity="0" />  
<circle cx="300" cy="419" r="2" opacity="0" /> 
  </g>  
  </svg>
</svg>

	</div>
	<div id="formContainer" style="display: none">
		<form id="formTag" "action="/menu" method="post">
	</div>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- SimpleLightbox plugin JS-->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/SimpleLightbox/2.1.0/simpleLightbox.min.js"></script>
	<script type="module" src="/js/listen.js"></script>
	<script src="js/script.js"></script>
</body>
</html>
