<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	pageContext.setAttribute("scopeVal","페이지 영역");
	request.setAttribute("scopeVal","요청 영역");
	session.setAttribute("scopeVal","세션 영역");
	application.setAttribute("scopeVal","어플리케이션 영역");
%>
<!-- 변수 명이 같을 경우 가장 작은 영역에 있는 것을 호출

 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>표현언어 EL 내장객체</title>
</head>
<body>
	<h2>내장객체 속성 값 출력</h2>
	<ul>
		<li>${pageScope.scopeVal}</li>
		<li>${requestScope.scopeVal}</li>
		<li>${sessionScope.scopeVal}</li>
		<li>${applicationScope.scopeVal}</li>
	<h2>영역지정없이 속성 값 출력</h2>
		<li>${scopeVal}</li>
	</ul>
	
	<jsp:forward page="ImpObjForward.jsp"/>
</body>
</html>