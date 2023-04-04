<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="common.Person"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>request 영역 forward</title>
</head>
<body>
	<h2>forward request area</h2>
<%
	request.setCharacterEncoding("UTF-8");
	Person rObj = (Person)(request.getAttribute("rObject"));
%>
	<ul>
		<li>문자열:<%=request.getAttribute("rString") %></li>
		<li>객체:<%=rObj.getName() %>,<%=rObj.getAge() %></li>
		<li><%=request.getParameter("com") %></li>
		<li><%=request.getParameter("fill") %></li>
	</ul>
</body>
</html>