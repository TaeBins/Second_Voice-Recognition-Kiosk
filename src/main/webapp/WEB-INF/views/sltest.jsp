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

<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<style>
        .slide {
            /* layout */
            display: flex;
            flex-wrap: nowrap;
            /* 컨테이너의 내용물이 컨테이너 크기(width, height)를 넘어설 때 보이지 않도록 하기 위해 hidden을 준다. */
            overflow: hidden;

            /* position */
            /* slide_button의 position absolute가 컨테이너 안쪽에서 top, left, right offset이 적용될 수 있도록 relative를 준다. (기본값이 static인데, static인 경우 그 상위 컨테이너로 나가면서 현재 코드에선 html을 기준으로 offset을 적용시키기 때문) */
            position: relative;

            /* size */
            width: 100%;

            /* slide drag를 위해 DOM요소가 드래그로 선택되는것을 방지 */
            user-select: none;
        }

        .slide_item {
            /* layout */
            display: flex;
            align-items: center;
            justify-content: center;

            /* position - 버튼 클릭시 left offset값을 적용시키기 위해 */
            position: relative;
            left: 0px;

            /* size */
            width: 100%;
            height: 300px;
            /* flex item의 flex-shrink는 기본값이 1이므로 컨테이너 크기에 맞게 줄어드는데, 슬라이드를 구현할 것이므로 줄어들지 않도록 0을 준다. */
            flex-shrink: 0;

            /* transition */
            transition: left 0.15s;
        }

        .slide_button {
            /* layout */
            display: flex;
            justify-content: center;
            align-items: center;

            /* position */
            position: absolute;
            /* 버튼이 중앙에 위치하게 하기위해 계산 */
            top: calc(50% - 16px);

            /* size */
            width: 32px;
            height: 32px;

            /* style */
            border-radius: 100%;
            background-color: #cccc;
            cursor: pointer;
        }

        .slide_prev_button {
            left: 10px;
        }

        .slide_next_button {
            right: 10px;
        }

        /* 각 슬라이드가 변경되는 것을 시각적으로 확인하기 쉽도록 각 슬라이드별 색상 적용 */
        .slide_item:nth-child(1) {
            background-color: darkgoldenrod;
        }

        .slide_item:nth-child(2) {
            background-color: aqua;
        }

        .slide_item:nth-child(3) {
            background-color: blueviolet;
        }

        .slide_item:nth-child(4) {
            background-color: burlywood;
        }

        .slide_item:nth-child(5) {
            background-color: cornflowerblue;
        }

        /* 페이지네이션 스타일 */
        ul,
        li {
            list-style-type: none;
            padding: 0;
            margin: 0;
        }

        .slide_pagination {
            /* layout */
            display: flex;
            gap: 5px;

            /* position */
            position: absolute;
            bottom: 0;
            /* left:50%, translateX(-50%)를 하면 가로 가운데로 위치시킬 수 있다. */
            left: 50%;
            transform: translateX(-50%);
        }

        .slide_pagination>li {
            /* 현재 슬라이드가 아닌 것은 투명도 부여 */
            color: #7fb5ff88;
            cursor: pointer;
            font-size: 25px;
        }

        .slide_pagination>li.active {
            /* 현재 슬라이드 색상은 투명도 없이 */
            color: #7fb5ff;
        }
    </style>
</head>

<body>
	<!-- Navigation-->


	<!-- Header-->

	<!-- Section-->
	<div style="width: 100%;">
		<section class="py-5" style="float: right; width: 25%; height: 700px; background-color: white;">
			<div class="container px-4 px-lg-5 mt-5">

				<ul id="orderList" style="list-style:none">
				
				
				</ul>
			
			</div>
		</section>
		<section class="py-5" style="float: left; width: 25%; height: 700px; background-color: #212529;">
			<div class="container px-4 px-lg-5 mt-5">

				<div class="col mb-6">
					<div class="card h-100">
						<a class="btn1 btn-outline-dark mt-auto" href="#">View options</a>
					</div>
				</div>
				<div class="col mb-6">
					<div class="card h-100">
						<a class="btn1 btn-outline-dark mt-auto" href="#">View options</a>
					</div>
				</div>
				<div class="col mb-6">
					<div class="card h-100">
						<a class="btn1 btn-outline-dark mt-auto" href="#">View options</a>
					</div>
				</div>
				<div class="col mb-6">
					<div class="card h-100">
						<a class="btn1 btn-outline-dark mt-auto" href="#">View options</a>
					</div>
				</div>
				<div class="col mb-7">
					<div class="card h-100">
						<a class="btn1 btn-outline-dark mt-auto" href="#">View options</a>
					</div>
				</div>
				<div class="col mb-6">
					<div class="card h-100">
						<a class="btn1 btn-outline-dark mt-auto" href="#">View options</a>
					</div>
				</div>
			</div>
		</section>
		<section class="py-5" style="float: right; width: 50%; height: 700px; background-color: #212529;">
			 <div class="slide slide_wrap">
        <div  style="display:none"class="slide_item">
			<div class="container px-4 px-lg-5 mt-5">
				<div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">


					<c:forEach var="vo" items="${sllist}" begin="0" end="5" step="1" >
						<div class="col mb-5" style="padding-left: 15px; padding-right: 15px;">
							<div class="card h-100">
								<!-- Sale badge-->
								<div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Sale</div>
								<!-- Product image-->
								<img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
								<!-- Product details-->
								<div class="card-body p-4">
									<div class="text-center">
										<!-- Product name-->
										<h5 class="fw-bolder">${vo.name}</h5>
										<!-- Product price-->
										${vo.price}원
									</div>
								</div>
								<!-- Product actions-->
								<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
									<div class="text-center">
										<button name="${vo.name}" class="cartbutton">
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
			
			</div>
				</div>
		
				 <div style="backgroudn-colro:white" class="slide_item">6</div>
        <div class="slide_item">7</div>
        <div class="slide_item">8</div>
        <div class="slide_prev_button slide_button">◀</div>
        <div class="slide_next_button slide_button">▶</div>
        <div class="slide_item">4</div>
        <ul class="slide_pagination"></ul>
				
					</div>
		</section>
	
	</div>
	<div id="formContainer" style="display: none">
		<input name="id" value="1" /> <input name="menu" /> <input name="count" />
	</div>
	<!-- Footer-->
	</div>
	<div id="formContainer">
		<form id="formTag" "action="/menu" method="">
			<input id="id" name="id" type="text" value="1" /> <input id="menu" name="menu" type="text" value="test" /> <input id="count" name="count" type="number" value="1" /> <input type="submit" value="전송" />
		</form>
	</div>
	<div class="order_list">
		<form action="/order_list">
			<input type="submit" value="주문목록" />
		</form>
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

<button id ="testButton">test</button>

<script>
const testButton = document.getElementById("testButton");
testButton.addEventListener("click", ()=>console.log("test"))
</script>

<script>


// 슬라이크 전체 크기(width 구하기)
const slide = document.querySelector(".slide");
let slideWidth = slide.clientWidth;

// 버튼 엘리먼트 선택하기
const prevBtn = document.querySelector(".slide_prev_button");
const nextBtn = document.querySelector(".slide_next_button");

// 슬라이드 전체를 선택해 값을 변경해주기 위해 슬라이드 전체 선택하기
const slideItems = document.querySelectorAll(".slide_item");
// 현재 슬라이드 위치가 슬라이드 개수를 넘기지 않게 하기 위한 변수
const maxSlide = slideItems.length;

// 버튼 클릭할 때 마다 현재 슬라이드가 어디인지 알려주기 위한 변수
let currSlide = 1;

// 페이지네이션 생성
const pagination = document.querySelector(".slide_pagination");

for (let i = 0; i < maxSlide; i++) {
    if (i === 0) pagination.innerHTML += `<li class="active">•</li>`;
    else pagination.innerHTML += `<li>•</li>`;
}

const paginationItems = document.querySelectorAll(".slide_pagination > li");

function nextMove() {
    currSlide++;
    // 마지막 슬라이드 이상으로 넘어가지 않게 하기 위해서
    if (currSlide <= maxSlide) {
        // 슬라이드를 이동시키기 위한 offset 계산
        const offset = slideWidth * (currSlide - 1);
        // 각 슬라이드 아이템의 left에 offset 적용
        slideItems.forEach((i) => {
            i.setAttribute("style", `left: ${-offset}px`);
        });
        // 슬라이드 이동 시 현재 활성화된 pagination 변경
        paginationItems.forEach((i) => i.classList.remove("active"));
        paginationItems[currSlide - 1].classList.add("active");
    } else {
        currSlide--;
    }
/*     
    $.ajax({
        url: "/sltestAjax", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
        data: {"i": currSlide },  // HTTP 요청과 함께 서버로 보낼 데이터
        method: "GET",   // HTTP 요청 메소드(GET, POST 등)
        dataType: "json", // 서버에서 보내줄 데이터의 타입
        success : (response) => {console.log(response)
       
        },
        error : (error) => alert(error)
        
    }) */
 
}
function prevMove() {
    currSlide--;
    // 1번째 슬라이드 이하로 넘어가지 않게 하기 위해서
    if (currSlide > 0) {
        // 슬라이드를 이동시키기 위한 offset 계산
        const offset = slideWidth * (currSlide - 1);
        // 각 슬라이드 아이템의 left에 offset 적용
        slideItems.forEach((i) => {
            i.setAttribute("style", `left: ${-offset}px`);
        });
        // 슬라이드 이동 시 현재 활성화된 pagination 변경
        paginationItems.forEach((i) => i.classList.remove("active"));
        paginationItems[currSlide - 1].classList.add("active");
    } else {
        currSlide++;
    }
}

// 버튼 엘리먼트에 클릭 이벤트 추가하기
nextBtn.addEventListener("click", () => {
    // 이후 버튼 누를 경우 현재 슬라이드를 변경
    nextMove();
});
// 버튼 엘리먼트에 클릭 이벤트 추가하기
prevBtn.addEventListener("click", () => {
    // 이전 버튼 누를 경우 현재 슬라이드를 변경
    prevMove();
});

// 브라우저 화면이 조정될 때 마다 slideWidth를 변경하기 위해
window.addEventListener("resize", () => {
    slideWidth = slide.clientWidth;
});

// 각 페이지네이션 클릭 시 해당 슬라이드로 이동하기
for (let i = 0; i < maxSlide; i++) {
    // 각 페이지네이션마다 클릭 이벤트 추가하기
    paginationItems[i].addEventListener("click", () => {
        // 클릭한 페이지네이션에 따라 현재 슬라이드 변경해주기(currSlide는 시작 위치가 1이기 때문에 + 1)
        currSlide = i + 1;
        // 슬라이드를 이동시키기 위한 offset 계산
        const offset = slideWidth * (currSlide - 1);
        // 각 슬라이드 아이템의 left에 offset 적용
        slideItems.forEach((i) => {
            i.setAttribute("style", `left: ${-offset}px`);
        });
        // 슬라이드 이동 시 현재 활성화된 pagination 변경
        paginationItems.forEach((i) => i.classList.remove("active"));
        paginationItems[currSlide - 1].classList.add("active");
    });
}

// 드래그(스와이프) 이벤트를 위한 변수 초기화
let startPoint = 0;
let endPoint = 0;

// PC 클릭 이벤트 (드래그)
slide.addEventListener("mousedown", (e) => {
    console.log("mousedown", e.pageX);
    startPoint = e.pageX; // 마우스 드래그 시작 위치 저장
});

slide.addEventListener("mouseup", (e) => {
    console.log("mouseup", e.pageX);
    endPoint = e.pageX; // 마우스 드래그 끝 위치 저장
    if (startPoint < endPoint) {
        // 마우스가 오른쪽으로 드래그 된 경우
        console.log("prev move");
        prevMove();
    } else if (startPoint > endPoint) {
        // 마우스가 왼쪽으로 드래그 된 경우
        console.log("next move");
        nextMove();
    }
});

// 모바일 터치 이벤트 (스와이프)
slide.addEventListener("touchstart", (e) => {
    console.log("touchstart", e.touches[0].pageX);
    startPoint = e.touches[0].pageX; // 터치가 시작되는 위치 저장
});
slide.addEventListener("touchend", (e) => {
    console.log("touchend", e.changedTouches[0].pageX);
    endPoint = e.changedTouches[0].pageX; // 터치가 끝나는 위치 저장
    if (startPoint < endPoint) {
        // 오른쪽으로 스와이프 된 경우
        console.log("prev move");
        prevMove();
    } else if (startPoint > endPoint) {
        // 왼쪽으로 스와이프 된 경우
        console.log("next move");
        nextMove();
    }
});
</script>
</script>

</body>

</html>