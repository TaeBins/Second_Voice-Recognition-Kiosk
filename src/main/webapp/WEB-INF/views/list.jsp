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
		메뉴목록
		<table border="1">
			<thead>
				<tr>
					<td>종류</td>
					<td>이름</td>
					<td>가격</td>
					<td>재고</td>
				</tr>
			</thead>
			<tbody>
 				<c:forEach var="vo" items="${list}">
					<tr>
						<td>${vo.type}</td>
						<td>${vo.name}</td>
						<td>${vo.price}원</td>
						<td>${vo.stock}개</td>
					</tr>
				</c:forEach> 
			</tbody>
		</table>
	</div>
</body>
</html>