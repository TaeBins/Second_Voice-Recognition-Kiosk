<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main</title>

</head>
<body>

	<!-- contenteditable : div태그에서도 text기능을 가능하게해줌 -->
	<div class="words" contenteditable="true"></div>
	
	<form id="formTag" action="/menu">
		<input name="menu" placeholder="메뉴명" />
		<input name="amount" placeholder="주문수량" />	
		<input type="submit" value="주문"/>
	</form>

	<select id="select-lang">
		<option value="ko-KR" selected>한국어</option>
		<option value="ja-JP">일본어</option>
		<option value="en-US">영어</option>
	</select>
	<textarea id="text" rows="5" cols="20"></textarea>
	<button id="btn-read">읽기</button>

</body>
</html>