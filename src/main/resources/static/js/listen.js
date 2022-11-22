//TTS API 불러오기

/**
 * 
 */
 const synth = window.speechSynthesis;
 const voices = synth.getVoices();
 var audio = new Audio('js/testvoice.mp3');

 
 const speechMsg = new SpeechSynthesisUtterance()
 console.dir(window.speechSynthesis.getVoices());
 function speak(text) {
	

	window.speechSynthesis.cancel() // 현재 읽고있다면 초기화

	

	
	speechMsg.rate =  1 // 속도: 0.1 ~ 10      
	speechMsg.pitch = 1 // 음높이: 0 ~ 2
	speechMsg.lang =  "ko-KR"
	speechMsg.text = text

	// SpeechSynthesisUtterance에 저장된 내용을 바탕으로 음성합성 실행
	window.speechSynthesis.speak(speechMsg)
}






// index 화면
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
const formTag = document.createElement("form")



//하이키코를 불렀을 경우 starting을 true로 바꿔서 인삿말 출력
//ordering을 true로 바꿔서 주문모드로 진입
let starting = false;
let ordering = false;

//formTag 생성 및 이동할 url 설정
const goMainMenu = () => {

	formTag.action = "/menu";
	document.getElementById("formContainer").appendChild(formTag);
	formTag.submit();
	restart();

}

const goIndex = () => {

	formTag.action = "/";
	document.getElementById("formContainer").appendChild(formTag);
	formTag.submit();
	restart();
}


//speech api로 받은 transcript 로직처리
h_speech.onresult = function(e) {

	//transcript 값들 join으로 하나의 문장으로 바꿔주기
	let h_text = Array.from(e.results).map(result => result[0].transcript).join("");
	console.log(h_text);
	//main_menu request 함수


	//하이 키코 라는 단어가 존재하지 않아 하이코 or 하이킥으로 인식함으로 하이코 및 하이킥으로 인식 처리
	if (!starting) {
		if (h_text.indexOf("하이코") !== -1 || h_text.indexOf("하이킥") !== -1) {
			 audio.play();
			setTimeout(() => { starting = true }, 1000);
			h_speech.interimResults = false;
			//하이 키코가 인식되면 transcript 초기화
			
			restart();

		}
	} else {
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
	}


};