<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="common.Person" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL core ForEach</title>
</head>
<body>
	<h4>일반 for 문</h4>
	<c:forEach var="i" begin="1" end="3" step="1">
		<p>반복 ${i}</p>
	</c:forEach>
	
	<h4>반복문 속성</h4>
	<table border="1">
	<c:forEach begin="3" end="7" var="i" varStatus="loop">
		<tr>
			<td>count:${loop.count}</td>
			<td>index:${loop.index}</td>
			<td>current:${loop.current}</td>
			<td>first:${loop.first}</td>
			<td>last:${loop.last}</td>
			<td>i:${i}</td>
		</tr>
	</c:forEach>
	</table>
	
	<h4>enhanced for문</h4>
	<%
		String[] rainbow={"빨","주","노","초","파","남","보"};
	%>
	<c:forEach items="<%=rainbow%>" var="color">
	<span>${color}</span><br>
	</c:forEach>
	
		<%
		String[] rainbow2={"빨","주","노","초","파","남","보"};
	%>
	<h4>반복문 속성2</h4>
	<table border="1">
	<c:forEach items="<%=rainbow2%>" var="color2" varStatus="loop">
		<tr>
			<td>count:${loop.count}</td>
			<td>index:${loop.index}</td>
			<td>current:${loop.current}</td>
			<td>first:${loop.first}</td>
			<td>last:${loop.last}</td>
			<td style="color:${color2};">color2:${color2}</td>
		</tr>
	</c:forEach>
	</table>
</body>
</html>