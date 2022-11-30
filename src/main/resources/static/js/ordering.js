// menu 화면
// speech api 불러오기
window.SpeechRecognition = window.SpeechRecognition || window.webkitSpeechRecognition;
//speech api 초기 설정
const h_speech = new SpeechRecognition();
h_speech.interimResults = true;
h_speech.continuous = true;
h_speech.lang = "ko-KR";

//speech api 시작
h_speech.start();

//speech transcript 초기화 함수
const restart = async () => {
	await h_speech.stop();
	await setTimeout(() => h_speech.start(), 100);
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

	formTag.action = "/menu";
	formTag.method = "get"
	document.getElementById("formContainer").appendChild(formTag);

	formTag.submit();
	restart();

}

const goIndex = () => {

	formTag.action = "/menu";
	formTag.submit();
	restart();
}
const order = (id, menu, count) => {
	formTag.action = "/menu";
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
// 음식 주문 갯수 받아내는 리스트
const one = [1, "한 잔", "한잔", "하나", "한개", "한 개", "한계", '1인분', '일인분']
const two = [2, "두 잔", "두잔", "둘", "두개", "두 개", '2인분', '이인분']
const three = [3, "세 잔", "세잔", "셋", "세개", "세 개", "세계", "3인분", "삼인분"]
const four = [4, "네 잔", "네잔", "넷", "네개", "네 개", "4인분", "사인분"]
const five = [5, "다섯 잔", "다섯잔", "다섯", "다섯개", "다섯 개", "5인분", "오인분"]
const six = [6, "여섯 잔", "여섯잔", "여섯", "여섯개", "여섯 개", "6인분", "육인분"]
const seven = [7, "일곱 잔", "일곱잔", "일곱", "일곱개", "일곱 개", "7인분", "칠인분"]
const amount = [one, two, three, four, five, six, seven]

//   const menu_list = [오뎅탕, 감바스, 짜파구리, 콘치즈계란말이, 계란말이]


//메뉴와 갯수를 매칭 시켜줄 오브젝트 만들기
const menus = {
	"바지락술국": 0,
	"간장불고기": 0,
	"순대술국": 0,
	"골뱅이소면": 0,
	"비빔국수": 0,
	"화덕피자": 0,
}

//음식 이름 받아내는 리스트, menu_list에 들어갈 각각의 리스트 만들기
const 바지락술국 = ["바지락술국", "바지락 술국", "바지락"]


//무슨 메뉴를 주문했는지 체크하는 함수
/*const checkMenu = (h_text) => {
	menu_list.forEach((menu) => {
		if (h_text.indexOf(menu) !== -1) {
			checkAmount(menu, h_text)
		}

	})
}*/




// 각 메뉴 몇 개 주문했는지 체크하는 함수  
const checkAmount = (menu, h_text) => {

	amount.forEach((count) => {
		count.forEach((e) => {
			if (h_text.indexOf(e) !== -1) {

				console.log(`${menu}를 ${count[0]} 개 주문하였습니다.`)
				menus[menu] = count[0]
				restart();
			}
		})

	})
}






//speech api로 받은 transcript 로직처리
h_speech.onresult = function(e) {

	//transcript 값들 join으로 하나의 문장으로 바꿔주기
	let h_text = Array.from(e.results).map(result => result[0].transcript).join("");
	console.log(h_text);
	//main_menu request 함수
	if (h_text.indexOf("아메리카노") !== -1) {

	}
	console.log(menus);
	//메뉴 읽어들이는 함수
	//	checkMenu(h_text);

	//갯수 파악하는 함수




	one.forEach((e) => {
		if (h_text.indexOf(e) !== -1) {
			console.log(h_text.indexOf(e))
		}

	})

	//하이 키코 라는 단어가 존재하지 않아 하이코 or 하이킥으로 인식함으로 하이코 및 하이킥으로 인식 처리
	if (h_text.indexOf("영수증") !== -1 || h_text.indexOf("주문 내역") !== -1) {
		goReceipt();
	}

	if (h_text.indexOf("주문 완료") !== -1 || h_text.indexOf("주문완료") !== -1) {
		order();

	}
	console.log(h_text);
	if (h_text.indexOf("메인 메뉴") !== -1 || h_text.indexOf("메인메뉴") !== -1) {
		goMainMenu();
	}



	if (h_text.indexOf("주문 종료") !== -1 || h_text.indexOf("주문종료") !== -1) {
		ordering = false;
		starting = false;
		goIndex();
		restart();
	}

	if (starting && !ordering) {

		starting = false;
		ordering = true;

	}

	// if (h_text.indexOf("메뉴") !== -1) {
	// 	console.log("네~");
	// 	h_speech.onend;
	// 	speech.start();
	// }
	if (h_text.indexOf("메인 화면") !== -1) {
		location.href = "http://127.0.0.1:5500/src/main/webapp/index.html";
	}



};
// 버튼 누르면 orderCount 값 바꾸고, DB에 저장하는 함수
const addButtonEvent = (name) => {
	//각 메뉴의 -, + 버튼 가지고 오기
	const downButtons = document.querySelectorAll("button.downCount")
	const upButtons = document.querySelectorAll("button.upCount")

	//Down 버튼 누를 경우
	downButtons.forEach((downButton) => {

		downButton.addEventListener("click", (event) => {
			//현재 입력되어 있는 개수 값 가지고오기
			const currentOrderCount = event.target.parentNode.querySelector("span:nth-child(3)")

			//개수 값에 -1 적용
			currentOrderCount.innerText -= 1;

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
	})

	//Up 버튼 누를 경우

	upButtons.forEach((upButton) => {
		upButton.addEventListener("click", (event) => {
			const currentOrderCount = event.target.parentNode.querySelector("span:nth-child(3)")
			//개수 값에 +1 적용
			currentOrderCount.innerText = parseInt(currentOrderCount.innerText) + 1;

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

		//만약 현재 주문해놓은 메뉴가 listContainer에 존재한다면
		for (j = 0; j < listContainer.children.length; j++) {
			const newOrderName = document.querySelector(`#listContainer > div:nth-child(${j + 1}) > div > span:nth-child(1)`)
			if (newOrderName.textContent.indexOf(cartButton.name) !== -1) {
				check = true;
				const newOrderCnt = document.querySelector(`#listContainer > div:nth-child(${j + 1}) > div > span:nth-child(3)`)
				newOrderCnt.innerText = parseInt(newOrderCnt.innerText) + 1
				addButtonEvent(cartButton.name);


			}

		}



		//현재 주문한 메뉴가 orderList에 없다면?
		if (!check) {
			//메뉴 추가
			const tempList = document.createElement("li");
			orderCounts = 1;
			appendList(cartButton.name, orderCounts);
			addButtonEvent(cartButton.name);
			addDeleteButtonEvent();
			if(document.querySelector("#listContainer div:last-child").offsetTop >=494){
				document.getElementById("downArrow").style.visibility = "visible"
			} else{
								document.getElementById("downArrow").style.visibility = "hidden"

			}



		}
		check = false;



		//	children.forEach((child)=>{if(tempList.innerText != child.textContent){
		//		orderList.appendChild(tempList);
		//	}})	
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
	list.style = "height:80px"
	list.innerHTML = `
	<div class="wrapper">
     <span style="color:white">${name}</span>
     <button class="downCount">-</button><span style="color:white">${orderCounts}</span><button class="upCount">+</button>
      </div>
	<i class="fa fa-shopping-cart"></i>
    </div>`

	listContainer.appendChild(list);
}

//삭제 버튼 이벤트 리스너 추가해주는 함수
const addDeleteButtonEvent = () => {
	const deleteButtons = document.querySelectorAll("i.fa")
	deleteButtons.forEach((deleteButton) => {
		deleteButton.addEventListener("click", (event) => {
			listContainer.removeChild(event.target.parentNode);
				if(document.querySelector("#listContainer div:last-child").offsetTop >=494){
				document.getElementById("downArrow").style.visibility = "visible"
			} else{
								document.getElementById("downArrow").style.visibility = "hidden"

			}
		})
	})
}




