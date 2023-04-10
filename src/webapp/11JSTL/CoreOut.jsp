<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL core out</title>
</head>
<body>
	<c:set var="iTag">
		i 태그는 <i>기울림</i>을 표현합니다.
	</c:set>
	<h4>기본 사용</h4>
	<c:out value="${iTag}" />
	<br>
	${iTag}
	<h4>escapeXml 속성</h4>
	<c:out value="${iTag}" escapeXml="false" />
	
	<c:out value="${param.name}" default="이름 없음"></c:out>
	<c:out value="" default="빈 문자열도 값으로 처리"/>
</body>
</html>