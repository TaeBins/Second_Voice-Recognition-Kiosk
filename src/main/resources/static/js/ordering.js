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
	await setTimeout(() => h_speech.start(), 500);
}
//request 보낼 form태그 생성
const formTag = document.getElementById("formTag");


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
	
	formTag.submit();
	restart();

}

const goIndex = () => {

	formTag.action = "/menu";
	document.getElementById("formContainer").appendChild(formTag);
	formTag.submit();
	restart();
}
const order = (id, menu, count) => {
	formTag.action="/menu";
	formTag.method="post";
	formTag.submit();
	restart();
}




//speech api로 받은 transcript 로직처리
h_speech.onresult = function(e) {

	//transcript 값들 join으로 하나의 문장으로 바꿔주기
	let h_text = Array.from(e.results).map(result => result[0].transcript).join("");
	console.log(h_text);
	//main_menu request 함수
	if (h_text.indexOf("아메리카노") !== -1) {
		orderMenu.value = "아메리카노";
	}
	if (h_text.indexOf("한 잔") !== -1 || h_text.indexOf("한잔") !== -1) {
		orderCount.value = "1";
	}

	//하이 키코 라는 단어가 존재하지 않아 하이코 or 하이킥으로 인식함으로 하이코 및 하이킥으로 인식 처리


	if (h_text.indexOf("주문 완료") !== -1 || h_text.indexOf("주문완료") !== -1) {
		order();

	}
	console.log(h_text);
	if (h_text.indexOf("메인 메뉴") !== -1 || h_text.indexOf("메인메뉴") !== -1){
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

const cartButton = document.querySelectorAll(".cartbutton")
const orderList = document.querySelector("#orderList")

		const tempList = document.createElement("li")
			


let check = false;
let a = 0;
//버튼에 클릭 이벤트 생성
cartButton.forEach((cartButton) =>{
	cartButton.addEventListener("click", () => {
		
		
	
		for( i=0; i<orderList.children.length; i++){
				//만약 현재 주문해놓은 메뉴가 orderList에 존재한다면
			if(orderList.children[i].textContent.indexOf(cartButton.name) !== -1){
				// 주문해놓은 메뉴가 있다고 체크
				check=true;
				
				//주문해놓은 메뉴의 수량 가지고오기
				orderCounts = orderList.children[i].textContent.split(" ")[orderList.children[i].textContent.split(" ").length-1];
				//주문한 메뉴 수량 +1 시키기
			
				orderCounts++;
				orderList.children[i].textContent = cartButton.name + " " + orderCounts;
				
			}
		
		}
		//현재 주문한 메뉴가 orderList에 없다면?
			if(!check){
				//메뉴 추가
				const tempList = document.createElement("li");
				tempList.innerText = `${cartButton.name} 1`
				orderList.appendChild(tempList);
				
			}
			check=false;
//	children.forEach((child)=>{if(tempList.innerText != child.textContent){
//		orderList.appendChild(tempList);
//	}})
	console.dir(orderList);
	})});
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	