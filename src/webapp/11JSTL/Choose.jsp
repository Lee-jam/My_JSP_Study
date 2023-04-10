<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL</title>
</head>
<body>
	<c:set var="num" value="99" />
	<!-- 이 조건 식을 주로 쓸 것임 -->
	<h4>choose</h4>
	<c:choose>
		<c:when test="${num mod 2 eq 0}">${num}은 짝수입니다.</c:when>
		<c:when test="${num mod 2 eq 1}">${num}은 홀수입니다.</c:when>
	</c:choose>

</body>
</html>