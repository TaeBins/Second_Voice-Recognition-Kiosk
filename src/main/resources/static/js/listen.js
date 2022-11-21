/**
 * 
 */
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
	await setTimeout(() => h_speech.start(), 1000);
}


//하이키코를 불렀을 경우 starting을 true로 바꿔서 인삿말 출력
//ordering을 true로 바꿔서 주문모드로 진입
let starting = false;
let ordering = false;

//speech api로 받은 transcript 로직처리
h_speech.onresult = function (e) {

//transcript 값들 join으로 하나의 문장으로 바꿔주기
	let h_text = Array.from(e.results).map(result => result[0].transcript).join("");
	console.log(h_text);
//main_menu request 함수
const goMainMenu = () => {
	
}


	//하이 키코 라는 단어가 존재하지 않아 하이코 or 하이킥으로 인식함으로 하이코 및 하이킥으로 인식 처리
	if (h_text.indexOf("하이코") !== -1 || h_text.indexOf("하이킥") !== -1) {
		starting = true;
		//하이 키코가 인식되면 transcript 초기화
		restart();
	
		speak(text.value, {
			rate: 1,
			pitch: 1.0,
			lang: selectLang.options[selectLang.selectedIndex].value
		});


	}
	let countDown = 0;
	if (h_text.indexOf("주문 완료") !== -1 || h_text.indexOf("주문완료") !== -1) {
		order.click();
		setInterval(() => {
			countDown += 1;
			if (countDown === 3) {
				orderChecked = true;
			}
			modalTextChange();

		}, 1000)
		restart();
	}

	if (h_text.indexOf("주문 종료") !== -1 || h_text.indexOf("주문종료") !== -1) {
		ordering = false;
		starting = false;
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
