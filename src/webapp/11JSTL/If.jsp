<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL core if</title>
</head>
<body>
	<c:set var="number" value="100"/>
	<c:set var="string" value="JSP"/>
	
	<c:if test="${number mod 2 eq 0}" var="result" scope="request" > ${number}는 짝수입니다.<br></c:if>
	result:${result}<br>
	<c:if test="100">el이 아닌 정수를 지정하면 false</c:if>
	
	<c:if test="${string eq 'Java'}" var="result2">문자열은 java입니다.</c:if>
	<c:if test="${not result2}">문자열이 java가 아닙니다.</c:if> <br>
	
	<!-- 조건식안에 "" <<안에 공백이 있는 경우 false가 됨 -->
	<c:if test="tRuE" var="result3">
		"true"인 경우<br>
	</c:if>	 
	result3:${result3}<br>
	<c:if test="${true}" var="result4">
		EL 형식으로 "true"인 경우<br>
	</c:if>	 
	result4:${result4}<br>
	
	<c:if test="${string eq 'Java'}">문자열은 java입니다.</c:if>
	<c:if test="${string eq 'JSP'}">문자열은 JSP입니다.</c:if>
</body>
</html>