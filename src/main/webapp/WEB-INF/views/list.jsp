<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>목록확인</title>
</head>
<body>
	<div>
		<h1>db연동 확인</h1>

		<table border="1">
			<thead>
				<tr>
					<th>userCode</th>
					<th>userName</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${fn:length(AllList) > 0}">
						<c:forEach items="${AllList}" var="AllList">
							<tr>
								<td>${AllList.USERCODE}</td>
								<td>${AllList.USERNAME}</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="4">조회된 결과 없음</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
	</div>
</body>
</html>