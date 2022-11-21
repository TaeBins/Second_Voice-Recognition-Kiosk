// speech api 불러오기
window.SpeechRecognition = window.SpeechRecognition || window.webkitSpeechRecognition;
// var : 재할당 o, 재선언o
// let : 재할당 o, 재선언x
// const : 재할당 x, 재선언x

let h_speech = new SpeechRecognition();
h_speech.interimResults = true;
h_speech.continuous = true;
h_speech.lang = "ko-KR";
const test = () => {
	console.log("안녕하세요 키스코어입니다. 무엇을 주문하시겠습니까?")
}
h_speech.start();

const restart = async () => {
	await h_speech.stop();
	await setTimeout(() => h_speech.start(), 3000);
}
function speak(text, opt_prop) {
	if (typeof SpeechSynthesisUtterance === "undefined" || typeof window.speechSynthesis === "undefined") {
		alert("이 브라우저는 음성 합성을 지원하지 않습니다.")
		return
	}

	window.speechSynthesis.cancel() // 현재 읽고있다면 초기화

	const prop = opt_prop || {}

	const speechMsg = new SpeechSynthesisUtterance()
	speechMsg.rate = prop.rate || 1 // 속도: 0.1 ~ 10
	speechMsg.pitch = prop.pitch || 1 // 음높이: 0 ~ 2
	speechMsg.lang = prop.lang || "ko-KR"
	speechMsg.text = text

	// SpeechSynthesisUtterance에 저장된 내용을 바탕으로 음성합성 실행
	window.speechSynthesis.speak(speechMsg)
}


// 이벤트 영역
const selectLang = document.getElementById("select-lang")
const text = document.getElementById("text")
const btnRead = document.getElementById("btn-read")

btnRead.addEventListener("click", e => {
	speak(text.value, {
		rate: 1,
		pitch: 1.0,
		lang: selectLang.options[selectLang.selectedIndex].value
	})
})


let starting = false;
let ordering = false;

h_speech.onresult = function(e) {
	let h_text = Array.from(e.results).map(result => result[0].transcript).join("");
	console.log(h_text);

	if (h_text.indexOf("하이코") !== -1 || h_text.indexOf("하이킥") !== -1) {
		if (!ordering) {
			restart();
		}
		starting = true;

	}
	if (starting && !ordering) {
		btnRead.click();
		starting = false;
		ordering = true;

	}

	if (h_text.indexOf("메인 화면") !== -1) {
		location.href = "http://127.0.0.1:5500/src/main/webapp/index.html";
	}
};




// 음성인식(STT) api 변수로 지정 및 설정
let speech = new SpeechRecognition();
// true : 음성인식 임시결과, 최종결과 확인(flase : 최종결과만 확인)
speech.interimResults = true;
// true : 음성인식된 문장을 하나로 합치며 중간에 쉬어도 stop되지 않음(stop을 원할경우 강제호출 필요)
speech.continuous = true;
// ko-KR : 음성인식 언어를 한국어로 설정(en-IN : 영어)
speech.lang = "ko-KR";

// newtext변수에 함수이벤트 지정
let newtext = function() {
	// p변수입력시 <p></p>태그 입력될수있는 요소생성
	p = document.createElement('p');
	// 클래스명이 words인곳에 위에서 지정한 p태그안에 음성인식된 단어들을 넣고 보내줌
	document.querySelector('.words').appendChild(p);
	// createElement : 새로운 요소 생성
	// querySelector : 괄호안에 선택자와 일치하는지(일치하는요소 없으면 null)
	// appendChild : 앞에서 지정된곳(부모)에 괄호안에값(자식)추가
};

// p를 null로 초기화
let p = null;

// 음성인식이 시작되면 발동하는 이벤트함수
speech.onstart = function() {
	// newtext 함수 작동
	newtext();
};
// 음성인식 종료되면 발생하는 이벤트함수
speech.onend = function() {
	// 음성인식 다시시작
	speech.start();
};

// 음성인식 결과도출되면 발생하는 이벤트함수
speech.onresult = function(e) {
	// Array.from(e.results) : e함수내에 results변수 값들을 새롭게 배열
	// .map(results => results[0].transcript) : results변수에 results0번 인덱스에있는 transcript값을 map타입으로 저장
	// .join("") : 앞에서 지정된 문장 양끝에 "" 넣어주기
	let texts = Array.from(e.results).map(results => results[0].transcript).join("");
	// replace : 첫번째값(/느낌표|강조|뿅/gi)에 들어간 값이 있으면 그값만 두번째값('❗️')으로 변경
	texts.replace(/느낌표|강조|뿅/gi, '❗️');
	// texts에 담은 음성인식 값을 <p></p>안에 text타입으로 작성
	p.textContent = texts;
};

const testing = document.getElementById("test");

testing.addEventListener("change", onChange)

const onChange = () =>{
	console.log(h_text);
}