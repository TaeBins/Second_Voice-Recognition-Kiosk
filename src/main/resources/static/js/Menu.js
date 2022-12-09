
let jsonMenuList = [];
let jsonOrderList = [];
 const makeOrderList = () => {
   $.ajax({  
      url: "/getJsonOrderList",
      type:'post',
      dataType: 'json',
      success: (orderList) => {
	jsonOrderList = orderList},
      error:(e)=>alert(e)
}); 

}
makeOrderList();

const makeMenuList = (menu_type) => {
   $.ajax({  
      url: "/getMenuList",
      type:'post',
     contentType : "application/json; charset=utf-8",
      data:JSON.stringify({menu_type}),
     dataType: 'json',
      success: (menuList) => jsonMenuList=menuList,
      error:(e)=>alert(e)
});  
}
makeMenuList(1);

const MenuListHTML = (start, end) => {
   let menuListText = ""
   for(let i = start; i<=end; i++){
      menuListText += `  <div class="col mb-5" style="padding-left: 15px; padding-right: 15px;">
                           <div>
                              <!-- Sale badge-->
                              <!-- Product image-->
                              <img class="card-img-top" src="assets/menu/${jsonMenuList[i].menu_img}" alt="..." style="    filter: drop-shadow(5px 5px 5px #000);"/>
                              <!-- Product details-->
                              <div class="card-body p-4">
                                 <div class="text-center">
                                    <!-- Product name-->
                                    ${jsonMenuList[i].menu_name}
                                    <h5 class="fw-bolder"></h5>
                                    <!-- Product price-->
                                    ${jsonMenuList[i].menu_price}원
                                 </div>
                              </div>
                              <!-- Product actions-->
                              <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                 <div class="text-center">
                                    <button value="${jsonMenuList[i].menu_stock_cnt}" name="${jsonMenuList[i].menu_name.replace(' ', '')}" class="cartbutton">
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
                        </div>`            
   }
   return menuListText;
}

const OrderListHTML = () =>{
   let orderListText = ""
   for(let i=0; i<jsonOrderList.length; i++){
      orderListText += ` 
      <div class="list1" style="height: 80px; filter: drop-shadow(5px 5px 5px #000);">
                        <div class="wrapper ${jsonOrderList[i].menu_name}">
                 
                           <span class="orderCount position1" style="color: #302402 ">${jsonOrderList[i].menu_name}</span>
                           <br>
                           <span style="color: #302402" class="material-symbols-outlined downCount position3"> do_not_disturb_on&nbsp; </span>
                           <span  style="color: #302402" class="position2 count"> ${jsonOrderList[i].order_cnt} </span>
                           <span style="color: #302402" class="material-symbols-outlined upCount position4"> &nbsp;add_circle </span>

   </div>                   <div value="${jsonOrderList[i].menu_name}" class="trashContainer"style="position:static;width:23%; float: right; height: 100%; background-color: white;">
                        
                        <span class="material-symbols-outlined trash" value="${jsonOrderList[i].menu_name}">
delete
</span>

</div>

                     </div>`
   }
   return orderListText;
}


 const makeMainHTML = () => {document.body.innerHTML = `<body style="background-color: #F2F2F2;">
   
   <!-- Navigation-->
   <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
      <div class="container-fluid">
         <a class="navbar-brand" href="/">키코네 맥주</a>
      </div>
   </nav>
   <!-- Header-->
   <!-- Section-->
   <div class="bgbg" style="display: inline-block;">
      <section class="py-6" style="float: right; width: 22%; height: 702px;">
         <div class="container px-4 px-lg-5 mt-5">
            <div class="container1" >
               <h1 style="color: #dee2e6;">ORDER</h1>
               <div>
                  <div class="wrapper"></div>
               </div>
               <div id="listContainer" style="height:400px;overflow: scroll;margin-bottom:10px;">
                  ${OrderListHTML()}
               </div>
              <div style="text-align: center;">
                  <form action="/ordercomplete" method="post">
                     <button class="bubbly-button" id="ordertrue" type="button" onclick="orderT()">주문하기</button>
                  </form>
               </div>


            </div>

            <span id="downArrow" style="visibility: hidden; color: white; position: absolute; left: 88.5%; top: 660px" class="material-symbols-outlined"> </span>
         </div>
      </section>
      <section class="py-6" style="float: left; width: 14.8%; height: 702px;">
         <div class="container px-4 px-lg-5 mt-5">

            <div class="col mb-6">
               <div class="card h-100">
                  <a class="btn1 btn-outline-dark mt-auto" href="/1">메인 메뉴</a>
               </div>
            </div>
            <div class="col mb-6">
               <div class="card h-100">
                  <a id="side" class="btn1 btn-outline-dark mt-auto"href="/4" >사이드 메뉴</a>
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
                  <a class="btn1 btn-outline-dark mt-auto" href="/time">더치페이</a>
               </div>
            </div>


            <div class="col mb-6">
               <div class="card h-100">
                  <a class="btn1 btn-outline-dark mt-auto" href="#" onclick="callme();">직원 호출</a>
               </div>
            </div>
         </div>
      </section>
      <section class="py-6" style="float: right; width: 63.2%; height: 702px;">
         <div class="slide slide_wrap">
            <div class="slide_item">
               <div class="container px-4 px-lg-5 mt-5">
                  <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                     ${MenuListHTML(0,5)}
                  </div>
                  <ul style="color: white">
                  </ul>
               </div>
            </div>
            <div class="slide_item">
               <div class="container px-4 px-lg-5 mt-5">
                  <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                  ${MenuListHTML(6,11)}
                  </div>
                  <ul style="color: white">
                  </ul>
               </div>
            </div>
            <div class="slide_item">
               <div class="container px-4 px-lg-5 mt-5">
                  <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                     ${MenuListHTML(12,13)}
                  </div>
                  <ul style="color: white">
                  </ul>
               </div>
            </div>
            <div class="slide_prev_button slide_button">◀</div>
            <div class="slide_next_button slide_button">▶</div>
         </div>
         <ul class="slide_pagination"></ul>
      </section>
   </div>
   <div id="formContainer" style="display: none">
      <input name="id" value="1" /> <input name="menu" /> <input name="count" />
   </div>

   `};


// 슬라이크 전체 크기(width 구하기)
const MakeSlide = () => {
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
}












// menu 화면
// speech api 불러오기

//TTS API 불러오기 
const Ordering = () => {
const audios = new Audio();
audios.addEventListener("ended", ()=>console.log("오디오 종료"))
AWS.config.region = 'ap-northeast-1';
AWS.config.credentials = new AWS.CognitoIdentityCredentials({
   IdentityPoolId: 'ap-northeast-1:09e0dd25-5506-41c1-9ecd-c427f1320d9f',
});

function speakText(Text) {
   // Create the JSON parameters for getSynthesizeSpeechUrl
   var speechParams = {
      OutputFormat: "mp3",
      SampleRate: "16000",
      Text,
      TextType: "text",
      VoiceId: "Seoyeon",

   };

   // Create the Polly service object and presigner object
   var polly = new AWS.Polly({ apiVersion: '2016-06-10' });
   var signer = new AWS.Polly.Presigner(speechParams, polly)

   // Create presigned URL of synthesized speech file
   signer.getSynthesizeSpeechUrl(speechParams, function(error, url) {
      if (error) {
         document.getElementById('result').innerHTML = error;
      } else {
         audios.src = url;
         audios.play();
      }
   });
}

//TTS API불러오기 끝


let timeCheck = 0;


window.SpeechRecognition = window.SpeechRecognition || window.webkitSpeechRecognition;
//speech api 초기 설정
const h_speech = new SpeechRecognition();
h_speech.interimResults = false;
h_speech.continuous = true;
h_speech.lang = "ko-KR";

//speech api 시작
h_speech.start();

//speech transcript 초기화 함수
const restart = async () => {
   await h_speech.abort();
   await setTimeout(() => h_speech.start(), 200);
}
//request 보낼 form태그 생성
const formTag = document.createElement("form");
//html에서 인식할 수 있도록 formContainer 안에 넣어주기


//하이키코를 불렀을 경우 starting을 true로 바꿔서 인삿말 출력
//ordering을 true로 바꿔서 주문모드로 진입
let starting = false;
let ordering = false;

const orderId = document.getElementById("id");
const orderMenu = document.getElementById("menu");
const orderCount = document.getElementById("count");


//formTag 생성 및 이동할 url 설정
const goMainMenu = () => {
   
   formTag.action = "/1";
   formTag.method = "get"
   document.getElementById("formContainer").appendChild(formTag);

   formTag.submit();

   restart();

}

const goSideMenu = () => {

   formTag.action = "/2";
   formTag.method = "get"
   document.getElementById("formContainer").appendChild(formTag);

   formTag.submit();

   restart();

}


const goDrinkMenu = () => {

   formTag.action = "/3";
   formTag.method = "get"
   document.getElementById("formContainer").appendChild(formTag);

   formTag.submit();

   restart();

}


const goBeverageMenu = () => {

   formTag.action = "/4";
   formTag.method = "get"
   document.getElementById("formContainer").appendChild(formTag);

   formTag.submit();

   restart();

}


const goIndex = () => {

   formTag.action = "/1";
   formTag.submit();
   restart();
}

//메뉴 이동 함수 끝
const order = () => {
   formTag.action = "/1";
   formTag.method = "post";
   formTag.submit();
   restart();
}

const goReceipt = () => {
   formTag.action = "/receipt";
   formTag.method = "get";
   document.getElementById("formContainer").appendChild(formTag);

   formTag.submit();
   restart();
}

//주문한 메뉴 리스트 만들기
let orderedMenus = []


// 음식 주문 갯수 받아내는 리스트
const amount = {
   1: ["한 잔", "한잔", "하나", "한개", "한 개", "한계", '1인분', '안아', '일인분'],
   2: ["두 잔", "두잔", "둘", "두개", "두 개", '2인분', '이인분', "2개"],
   3: ["세 잔", "세잔", "셋", "세개", "세 개", "세계", "3인분", "삼인분", "3개"],
   4: ["네 잔", "네잔", "넷", "네개", "네 개", "4인분", "사인분"],
   5: ["다섯 잔", "다섯잔", "다섯", "다섯개", "다섯 개", "5인분", "오인분"],
   6: ["여섯 잔", "여섯잔", "여섯", "여섯개", "여섯 개", "6인분", "육인분"],
   7: ["일곱 잔", "일곱잔", "일곱", "일곱개", "일곱 개", "7인분", "칠인분"]
}




//메뉴와 갯수를 매칭 시켜줄 오브젝트 만들기
//메뉴와 갯수를 매칭 시켜줄 오브젝트 만들기
const menus = {
   "통닭": ["통닭"],
   "감자튀김": ["감자튀김"],
   "왕새우튀김볼": ["왕새우튀김몰", "왕새우튀김벌", "새우퇴김볼", "새우튀김벌"],
   "롱치즈돈까스": ["치즈돈가스", "치즈돈까스"],
   "오뎅탕": ["오뎅탕"],
   "짬뽕탕": ["짬뽕탕"],
   "짜빠구리": ["짜파구리", "딱따구리"],
   "모듬소세지": ["모듬소세지", "모듬소시지", "모둠소시지", "모둠소세지"],
   "치즈라볶이": ["치즈라볶이"],
   "오징어버터구이": ["오징어버터구이"],
   "순두부찌개": ["순두부찌개", "천두부찌개"],
   "수제소세지": ["수제소세지", "수제소시지"],
   "순대술국": ["순대술국", "순대철분", "순댓국", "썬더술국", "손잡고", "순대전골", "춘자신곡", "순대실국"],
   "떡갈비": ["떡갈비", "닭갈비"],
   "화덕피자": ["화덕피자", "마석피자"],
   "바지락술국": ["바지락"],
   "비빔국수": ["비빔국수", "해물국수", "비밀복수", "이민국수"],
   "쥐포": ["지붕", "G4", "김포", "지프", "지퍼", "지코", "쥐포", "지솔", "집구", "짐볼", "제발", "지파"],
   "한치구이": ["한치구이", "삼치구이", "한지훈", "1시보이", "1792", "179있", "1시구이", "1지구2", "반칙우유", "1시소리", "잔치92", "1시브이"],
   "콘치즈": ["콘치즈", "펀치", "황치즈"],
   "먹태": ["목재", "먹태"],
   "새끼먹태": ["새끼먹태", "새끼호텔", "새끼먹자"],
   "오징어입구이": ["오징어입구에"],
   "튀김 쥐포": ["튀김쥐포"],
   "라면땅": ["라면땅"],
   "파인샤베트": ["샤베트", "파인샤베트"],
   "버터문어구이": ["버터문어구이",],
   "불꽃오징어": ["두건오징어", "건오징어", "불꽃오징어"],
   "참이슬": ["참이슬"],
   "처음처럼": ["처음처럼"],
   "잎새주": ["잎새주", "소주"],
   "하이트": ["하이트", "라이트"],
   "카스": ["카스"],
   "청하": ["청라", "전화", "청담동", "청하"],
   "생맥주": ["생맥주"],
   "코카콜라": ["코카콜라"],
   "코카콜라제로": ["코카콜라제로"],
   "펩시": ["택시", "혹시", "10시"],
   "사이다": ["사이다"],
   "토닉워터": ["토닉워터", "허니버터"],
   "레몬에이드": ["레몬에이드", "레모네이드"],
   "모히또": ["모히또"]
}


let amount_list = [];


//음식 이름 받아내는 리스트, menu_list에 들어갈 각각의 리스트 만들기


//무슨 메뉴를 주문했는지 체크하는 함수
/*const checkMenu = (h_text) => {
   menu_list.forEach((menu) => {
    if (h_text.indexOf(menu) !== -1) {
      checkAmount(menu, h_text)
    }

   })
}*/
let temp_list = []

// 어떤 메뉴를 몇 개 주문했는지 체크하는 함수  
const checkAmountIndex = (text, amount, index, obj) => {
   if (text.indexOf(amount, index) !== -1) {

      temp_list.push([amount, text.indexOf(amount, index)]);
      return checkAmountIndex(text, amount, text.indexOf(amount, index) + 1)
   } else {
      return;
   }
}

const checkIndex = (h_text, obj) => {
   for (let i = 0; i < Object.keys(obj).length; i++)
      obj[Object.keys(obj)[i]].forEach((obj_value) => {

         checkAmountIndex(h_text, obj_value, 0, obj)
         if (obj === menus) {
            orderedMenus = temp_list;

         } else {
            amount_list = temp_list;
         }
      })
   temp_list = []
}

const voiceOrder = async () => {
   const sortedMenus = orderedMenus.sort((a, b) => a[1] - b[1])
   const sortedAmount = amount_list.sort((a, b) => a[1] - b[1])

   for (let i = 0; i < sortedMenus.length; i++) {
      let orderedMenuName = Object.entries(menus).filter((kv) => kv[1].indexOf(sortedMenus[i][0]) !== -1)[0][0];

      document.querySelector(`button[name=${orderedMenuName}]`).click()
      let orderedMenuCount = document.querySelector(`div.${orderedMenuName} span.count`)
      orderedMenuCount.textContent = Object.entries(amount).filter((kv) => kv[1].indexOf(sortedAmount[i][0]) !== -1)[0][0]

      restart();
      if (parseInt(orderedMenuCount) !== 1) {
         setTimeout(() => {
            $.ajax({
               type: 'POST',
               url: '/order',
               contentType: 'application/json; charset=utf-8',
               data: JSON.stringify({
                  "menu_name": orderedMenuName,
                  "order_cnt": orderedMenuCount.textContent
               }),
               success: () => console.log('data 삽입 완료'),
               error: () => {
                  alert("에러")
               }
            })
         }, 1500)
      }
   }
}

//speech api로 받은 transcript 로직처리
h_speech.onresult = function(e) {

   //transcript 값들 join으로 하나의 문장으로 바꿔주기
   let h_text = (Array.from(e.results).map(result => result[0].transcript).join("")).split(" ").join("");
   checkIndex(h_text, amount)
   checkIndex(h_text, menus)
   //main_menu request 함수



   //하이 키코 라는 단어가 존재하지 않아 하이코 or 하이킥으로 인식함으로 하이코 및 하이킥으로 인식 처리
   if (h_text.indexOf("영수증") !== -1 || h_text.indexOf("주문 내역") !== -1) {
      goReceipt();
   }


   if (h_text.indexOf("추가") !== -1) {
      voiceOrder();
   }
   if (h_text.indexOf("주문") !== -1) {
      document.querySelector("button.bubbly-button").click()

   }

   //슬라이드 페이지 음성인식으로 이동하기
   if (h_text.indexOf("이전") !== -1) {
      document.querySelector("div.slide_prev_button").click()
      speakText("이전 화면으로 이동하였습니다.");

      restart();
   }
   if (h_text.indexOf("다음") !== -1) {
      document.querySelector("div.slide_next_button").click()
      speakText("다음 화면으로 이동하였습니다.");
      restart();
   }
   //슬라이드 페이지 이동 끝

   //메뉴 탭 이동 하기
   if(h_text.indexOf("메인") !== -1){
         makeMenuList(1);
   setTimeout(()=>{
   makeMainHTML();
   MakeSlide();
   Ordering()}, 100);
   }
   
   if(h_text.indexOf("사이드") !== -1){
      makeMenuList(2);
   setTimeout(()=>{
   makeMainHTML();
   MakeSlide();
   Ordering()}, 100);
   }
   
   if(h_text.indexOf("주류") !== -1 || h_text.indexOf("술") !== -1){
         makeMenuList(3);
   setTimeout(()=>{
   makeMainHTML();
   MakeSlide();
   Ordering()}, 100);
   }
   if(h_text.indexOf("음료") !== -1){
      makeMenuList(4);
   setTimeout(()=>{
   makeMainHTML();
   MakeSlide();
   Ordering()}, 100);
   }
   
   //메뉴탭 이동하기 끝




   console.log(h_text);




};

// 버튼 누르면 orderCount 값 바꾸고, DB에 저장하는 함수
const addButtonEvent = (name) => {
   //각 메뉴의 -, + 버튼 가지고 오기
   const downButton = document.querySelector(`div.${name.replace(' ', '')} span.downCount`)
   const upButton = document.querySelector(`div.${(name)} span.upCount`)
   const currentOrderCount = document.querySelector(`div.${name.replace(" ", "")} span.count`)

   //Down 버튼 누를 경우
   downButton.addEventListener("click", (event) => {
      //현재 입력되어 있는 개수 값 가지고오기

      //개수 값에 -1 적용

      currentOrderCount.textContent = Math.max(0, currentOrderCount.textContent - 1);

      // 숫자가 0이 될경우 삭제 버튼 클릭
      if (currentOrderCount.innerText <= 0) {
         //document.querySelector(`div.${name.replace(" ", "")}`).parentNode.children[1]   .click();         //Ajax로 DB Delete문 요청
         document.querySelector(`span[value="${name}"]`).click();
         return;
      }

      // 바뀐 개수 값 DB에 넣기
      $.ajax({
         type: 'POST',
         url: '/order',
         contentType: 'application/json; charset=utf-8',
         data: JSON.stringify({
            "menu_name": name,
            "order_cnt": currentOrderCount.innerText
         }),
         success: () => console.log('data 삽입 완료'),
         error: () => {
            alert("에러")
         }
      });
   })
   //Up 버튼 누를 경우


   upButton.addEventListener("click", (event) => {
      const stock = parseInt(document.querySelector(`button[name="${name}"]`).value)
      //개수 값에 +1 적용
      currentOrderCount.textContent = ` ${Math.min(stock, parseInt(currentOrderCount.textContent) + 1)} `;

      // 바뀐 개수 값 DB에 넣기
      $.ajax({
         type: 'POST',
         url: '/order',
         contentType: 'application/json; charset=utf-8',
         data: JSON.stringify({
            "menu_name": name,
            "order_cnt": currentOrderCount.innerText
         }),
         success: () => console.log('data 삽입 완료'),
         error: () => {
            alert("에러")
         }
      });

   })


}


const cartButton = document.querySelectorAll(".cartbutton")
//오른쪽 영역을 담는 변수 생성
const listContainer = document.getElementById("listContainer");


let check = false; // 현재 listContainer에 메뉴가 있는지 체크하는 변수
let orderCounts; // 각 메뉴들의 개수를 담을 변수
//버튼에 클릭 이벤트 생성
cartButton.forEach((cartButton) => {
   cartButton.addEventListener("click", () => {
      const upButton = document.querySelector(`div.${cartButton.name} span.upCount`)
      //만약 현재 주문해놓은 메뉴가 listContainer에 존재한다면
      for (j = 0; j < listContainer.children.length; j++) {
         const newOrderName = document.querySelector(`#listContainer > div:nth-child(${j + 1}) > div > span:nth-child(1)`)
         if (newOrderName.textContent.indexOf(cartButton.name) !== -1) {
            check = true;
            const newOrderCnt = document.querySelector(`#listContainer > div:nth-child(${j + 1}) > div > span:nth-child(3)`)
            upButton.click()

         }

      }




      //현재 주문한 메뉴가 orderList에 없다면?
      if (!check) {
         //메뉴 추가
         const tempList = document.createElement("li");
         orderCounts = 1;
         appendList(cartButton.name, orderCounts);
         addButtonEvent(cartButton.name);
         addDeleteButtonEvent(cartButton.name);
         const maxScroll = document.querySelector('#listContainer').scrollHeight
         document.querySelector('#listContainer').scrollTo(0, maxScroll);
         //5개 이상 주문시 스크롤 자동으로 아래로 내리기


         $.ajax({
            type: 'POST',
            url: '/order',
            contentType: 'application/json; charset=utf-8',
            data: JSON.stringify({
               "menu_name": cartButton.name,
               "order_cnt": orderCounts
            }),
            success: () => console.log('data 삽입 완료'),
            error: () => alert("에러")
         });



      }
      check = false;



      //   children.forEach((child)=>{if(tempList.innerText != child.textContent){
      //      orderList.appendChild(tempList);
      //   }})   




   })
});






/* onclick 으로 부른 callme 함수 실행 */
function callme() {
   /* 첫 alert 창 */
   Swal.fire({
      title: '직원을 호출 하시겠어요?',
      imageUrl: 'assets/immg.jpg',
      imageWidth: 400,
      imageHeight: 200,
      imageAlt: '으음',
      showDenyButton: true,
      confirmButtonText: '네 호출할게요!',
      denyButtonText: `잘못눌렀어요!`,
   }).then((result) => {
      /* 호출버튼 */
      if (result.isConfirmed) {
         Swal.fire({
            position: 'mid',
            icon: 'success',
            title: '직원을 호출했습니다!',
            showConfirmButton: false,
            timer: 1500
         })
         /* 취소버튼 */
      } else if (result.isDenied) {
         Swal.fire({
            position: 'mid',
            icon: 'info',
            title: '아하! ',
            text: '다음부턴 신중히 눌러주시길 :)',
            showConfirmButton: false,
            timer: 1500
         })
      }
   })
}
/* call me 함수 끝 */





//div 컨테이너에 데이터 넣기

const appendList = (name, orderCounts) => {
   const list = document.createElement("div");
   list.className = "list1";
   list.style = "height:80px; filter: drop-shadow(5px 5px 5px #000);"
   list.innerHTML = `
   <div class="wrapper ${name.replace(" ", "")}">
     <span class="orderCount position1" style="color:#302402">${name}</span>
     <br>
     <span style="color:#302402" class="material-symbols-outlined downCount position3">  do_not_disturb_on&nbsp; </span> 
     <span style="color:#302402"class="position2 count"> ${orderCounts} </span>
     <span style="color:#302402" class="material-symbols-outlined upCount position4"> &nbsp;add_circle </span>
      </div>
      <div value="${name}" class="trashContainer"style="position:static;width:23%; float: right; height: 100%; background-color: white;">
                        
      <span class="material-symbols-outlined trash" value="${name}">
delete
</span>
</div>
    </div>`

   listContainer.appendChild(list);
}

//삭제 버튼 이벤트 리스너 추가해주는 함수
const addDeleteButtonEvent = () => {
   const deleteButtons = document.querySelectorAll("span.trash")
   deleteButtons.forEach((deleteButton) => {
      deleteButton.addEventListener("click", (event) => {
         console.log(event.target.parentNode.parentNode);
         listContainer.removeChild(event.target.parentNode.parentNode);
         console.log(event.target.getAttribute('value'))
         $.ajax({
            type: 'DELETE',
            url: '/deleteorder',
            contentType: 'application/json; charset=utf-8',
            data: JSON.stringify({
               "menu_name": event.target.getAttribute('value'),
            }),
            success: () => console.log('data 삭제 완료'),
            error: () => {
               alert("에러")
            }
         });
      })


   })
}

for (i = 0; i < document.querySelectorAll("div.list1 > div:first-child").length; i++) {
   addButtonEvent(document.querySelectorAll("div.list1 > div:first-child")[i].classList[1])
   addDeleteButtonEvent(document.querySelectorAll("div.list1 > div")[i].classList[1]);
}


function orderT() {
   var ordertrue = document.getElementById('ordertrue');
   var ordertlist = document.querySelectorAll("div.list1 > div").length;
   if (ordertlist > 0) {
      // 주문목록이 있을 때 주문을 하게되면 완료 창
      ordertrue.setAttribute('type', 'submit');
      Swal.fire({
         position: 'mid',
         title: '메뉴 주문중입니다',
         imageUrl: 'assets/cooker.jpg',
         imageWidth: 400,
         imageHeight: 300,
         showConfirmButton: false,
         timer: 2000
      })
   } else {
      // 주문목록이 없을 때 버튼이 작동하지 않게하고 만약 누르면 경고창
      ordertrue.setAttribute('type', 'button');
      Swal.fire({
         toast: true,
         position: 'mid',
         title: '메뉴를 선택해주세요!',
         imageUrl: 'assets/plz.png',
         imageWidth: 400,
         imageHeight: 300,
         showConfirmButton: false,
         timer: 2000
      })
   }
}











document.querySelectorAll('.cartbutton').forEach(button => button.addEventListener('click', e => {
       if(!button.classList.contains('loading')) {
           button.classList.add('loading');
           setTimeout(() => button.classList.remove('loading'), 3700);
       }
       e.preventDefault();
   }))

   

   const cartButtons = document.querySelectorAll("button.cartbutton");
   cartButtons.forEach((cartButton)=> {
      if(cartButton.value == 0){
      cartButton.disabled = true}
      })
setTimeout(()=>{
    var bubblyButtons = document.getElementsByClassName("bubbly-button");

    for (var i = 0; i < bubblyButtons.length; i++) {
      bubblyButtons[i].addEventListener('click', animateButton, false);
    }
}, 300)
var animateButton = function(e) {

      e.preventDefault;
      //reset animation
      e.target.classList.remove('animate');
      
      e.target.classList.add('animate');
      setTimeout(function(){
        e.target.classList.remove('animate');
      },700);
    };

   }


setTimeout(()=>{
makeMainHTML();
MakeSlide();
Ordering();

}, 100);



