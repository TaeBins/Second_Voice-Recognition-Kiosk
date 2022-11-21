/**
 * 
 */
 const speechMsg = new SpeechSynthesisUtterance()
 function speak(text) {
	

	window.speechSynthesis.cancel() // 현재 읽고있다면 초기화

	

	
	speechMsg.rate = prop.rate || 0.1 // 속도: 0.1 ~ 10      
	speechMsg.pitch = prop.pitch || 1 // 음높이: 0 ~ 2
	speechMsg.lang = prop.lang || "ko-KR"
	speechMsg.text = text

	// SpeechSynthesisUtterance에 저장된 내용을 바탕으로 음성합성 실행
	window.speechSynthesis.speak(speechMsg)
}