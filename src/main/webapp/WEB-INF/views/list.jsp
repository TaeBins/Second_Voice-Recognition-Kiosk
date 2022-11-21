<%@page import="com.KSCT.work.model.*"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		주문목록
		<table border="1">
			<thead>
				<tr>
					<td>아이디</td>
					<td>메뉴</td>
					<td>수량</td>
					<td>가격</td>
			</tr>
		</thead>
			<tbody>
				<c:forEach var="vo" items="${OrderList}">
					<tr>
						<td>${vo.id}</td>
						<td>${vo.menu}</td>
						<td>${vo.count}</td>
						<td>${vo.price*vo.count}원</td>
					</tr>
				</c:forEach>
				<tr>
				<td colspan="3" style="text-align: center;">합계</td>
				<td>${vo.price*vo.count}원</td>
				</tr>
		</tbody>
		</table>
	</div>
</body>
</html>