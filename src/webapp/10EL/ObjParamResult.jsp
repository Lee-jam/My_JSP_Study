<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="common.Person" %>
<%
	Person p = (Person)request.getAttribute("personObj");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>객체 읽기</h2>
	<ul>
		<li><%=p.getName()%>,<%=p.getAge()%></li>
		<li>${personObj.name}, ${personObj.age}</li>
		<li>String ${requestScope.stringObj}</li>
		<li>Integer ${integerObj}</li>
	</ul>
	<h2>param 매개변수</h2>
	<ul>
		<li>${param.back+param['leeback']}</li>
		<li>${param.back}+${param['leeback']}</li>
	</ul>

</body>
</html>