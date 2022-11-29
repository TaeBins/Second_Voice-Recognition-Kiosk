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
	formTag.action="/menu";
	formTag.method="post";
	formTag.submit();
	restart();
}

const goReceipt = () => {
	formTag.action="/receipt";
	formTag.method="get";
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
  	
  	
 //음식 이름 받아내는 리스트, menu_list에 들어갈 각각의 리스트 만들기
    	const 바지락술국 = ["바지락술국", "바지락 술국", "바지락"]

   const menu_list = [오뎅탕, 감바스, 짜파구리, 콘치즈계란말이, 계란말이]
  	
  	
  	//메뉴와 갯수를 매칭 시켜줄 오브젝트 만들기
  	const menus = {
	"바지락술국" : 0,
	"간장불고기" : 0,
	"순대술국" : 0,
	"골뱅이소면" : 0,
	"비빔국수" : 0,
	"화덕피자" : 0,
}

//무슨 메뉴를 주문했는지 체크하는 함수
const checkMenu = (h_text) => {
	menu_list.forEach((menu) => {
	if(h_text.indexOf(menu) !== -1 ){
		checkAmount(menu, h_text)
	}
		
	})
}




// 각 메뉴 몇 개 주문했는지 체크하는 함수  
  const checkAmount = (menu, h_text) => {
	
	amount.forEach((count)=>{
		count.forEach((e) =>{
			if(h_text.indexOf(e) !== -1){
				
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
	checkMenu(h_text);
	
	//갯수 파악하는 함수
	


	
	one.forEach((e) => {
		if(h_text.indexOf(e) !== -1){
			console.log(h_text.indexOf(e))
		}
		
		})

	//하이 키코 라는 단어가 존재하지 않아 하이코 or 하이킥으로 인식함으로 하이코 및 하이킥으로 인식 처리
	if(h_text.indexOf("영수증") !== -1 || h_text.indexOf("주문 내역") !== -1){
		goReceipt();
	}

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
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	