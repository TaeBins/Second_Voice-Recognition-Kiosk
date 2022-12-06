// menu 화면
// speech api 불러오기
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

const goIndex = () => {

	formTag.action = "/1";
	formTag.submit();
	restart();
}
const order = (id, menu, count) => {
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
	2: ["두 잔", "두잔", "둘", "두개", "두 개", '2인분', '이인분',"2개" ],
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
	"바지락술국": ["바지락술국", "바지락쑥국", "바지랑수국", "바지락"],
	"비빔국수": ["비빔국수", "해물국수", "비밀복수", "이민국수"],
	"쥐포": ["지붕", "G4", "김포", "지프", "지퍼", "지코", "쥐포", "지솔", "집구", "짐볼", "제발", "지파"],
	"한치구이": ["한치구이", "한지훈", "1시보이", "1792", "179있", "1시구이", "1지구2", "반칙우유", "1시소리", "잔치92", "1시브이"],
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

const voiceOrder = () => {
	const sortedMenus = orderedMenus.sort((a, b)=> a[1] - b[1])
	const sortedAmount = amount_list.sort((a, b)=> a[1] - b[1])
	console.log(sortedMenus)
	console.log(amount_list)
	for(let i=0; i<sortedMenus.length;i++){
	let orderedMenuName = Object.entries(menus).filter((kv)=> kv[1].indexOf(sortedMenus[i][0]) !== -1)[0][0];
	document.querySelector(`button[name=${Object.entries(menus).filter((kv)=> kv[1].indexOf(sortedMenus[i][0]) !== -1)[0][0]}]`).click()
	document.querySelector(`div.${orderedMenuName} span.count`).textContent = Object.entries(amount).filter((kv)=> kv[1].indexOf(sortedAmount[i][0]) !== -1)[0][0]

	restart();
	}
}

//speech api로 받은 transcript 로직처리
h_speech.onresult = function(e) {

	//transcript 값들 join으로 하나의 문장으로 바꿔주기
	let h_text = (Array.from(e.results).map(result => result[0].transcript).join("")).split(" ").join("");
	checkIndex(h_text, amount)
	checkIndex(h_text, menus)
	//main_menu request 함수
	if (h_text.indexOf("화덕피자") !== -1) {
		document.querySelector(`button[name=화덕피자]`).click()
		restart();

	}


	const menuItems = Object.keys(menus);
	//메뉴 읽어들이는 함수
	//   checkMenu(h_text);

	//갯수 파악하는 함수
	const checkMenuIndex = (h_text) => {
		for (const k in menus) {
			menus[k].forEach((e) => {
				const index = h_text.indexOf(e)
				if (index !== -1)
					orderedMenus.push(k, index)
			})

		}
	}






	//   one.forEach((e) => {
	//      if (h_text.indexOf(e) !== -1) {
	//         console.log(h_text.indexOf(e))
	//      }
	//
	//   })


	//하이 키코 라는 단어가 존재하지 않아 하이코 or 하이킥으로 인식함으로 하이코 및 하이킥으로 인식 처리
	if (h_text.indexOf("영수증") !== -1 || h_text.indexOf("주문 내역") !== -1) {
		goReceipt();
	}

	if (h_text.indexOf("주문 완료") !== -1 || h_text.indexOf("주문완료") !== -1) {
		order();

	}
	console.log(h_text);
	//   if (h_text.indexOf("메인 메뉴") !== -1 || h_text.indexOf("메인메뉴") !== -1 || h_text.indexOf("메뉴 보여줘")) {
	//      goMainMenu();
	//   }
	//

	//
	//   if (h_text.indexOf("주문 종료") !== -1 || h_text.indexOf("주문종료") !== -1) {
	//      ordering = false;
	//      starting = false;
	//      goIndex();
	//      restart();
	//   }

	if (starting && !ordering) {

		starting = false;
		ordering = true;

	}

	// if (h_text.indexOf("메뉴") !== -1) {
	//    console.log("네~");
	//    h_speech.onend;
	//    speech.start();
	// }
	if (h_text.indexOf("메인 화면") !== -1) {
		location.href = "http://127.0.0.1:5500/src/main/webapp/index.html";
	}


	



	console.log(amount_list)
	console.log(orderedMenus)

	voiceOrder();

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
	list.style = "height:80px "
	list.innerHTML = `
   <div class="wrapper ${name.replace(" ", "")}">
     <span class="orderCount position1" style="color:white">${name}</span>
     <br>
     <span style="color:white" class="material-symbols-outlined downCount position3">  do_not_disturb_on&nbsp; </span> 
     <span style="color:white"class="position2 count"> ${orderCounts} </span>
     <span style="color:white" class="material-symbols-outlined upCount position4"> &nbsp;add_circle </span>
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
