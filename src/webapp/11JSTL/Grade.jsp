<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h4>영어, 수학, 과학 점수 입력받아서 평균을 구하고 학점 출력</h4>
		<form action="">
			영어 : <input type="number" name="eng" min="0" max="100" value="${param.eng}"/><br>
			수학 : <input type="number" name="math" min="0" max="100" value="${param.math}"/><br>
			과학 : <input type="number" name="sci" min="0" max="100" value="${param.sci}"/><br>
			<input type="submit" value="학점구하기"/>
		</form>
		<!-- 90이상 수, 80이상 우, 70이상 미, 60이상 양 나머지 가 -->
		<!-- 평균점수 : ?? / 학점 : ?? -->
		<c:set var="eng" value="${param.eng}"/>
		<c:set var="math" value="${param.math}"/>
		<c:set var="sci" value="${param.sci}"/>
		
		${eng}<br> ${math}<br> ${sci}<br>
	
		<c:set var="avg" value="${(eng+math+sci)/3}"/>	
		평균점수 : ${avg}<br>
		<c:choose>
			<c:when test="${avg ge 90}">수</c:when>
			<c:when test="${avg ge 80}">우</c:when>
			<c:when test="${avg ge 70}">미</c:when>
			<c:when test="${avg ge 60}">양</c:when>
			<c:when test="${avg lt 60}">가</c:when>
	
		</c:choose>
</body>
</html>