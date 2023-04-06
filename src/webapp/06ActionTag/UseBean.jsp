<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>자바빈즈</h2>
	<jsp:useBean id="person" class="common.Person" scope="request"/>
	<jsp:setProperty name="person" property="name" value="kang"/>
	<jsp:setProperty name="person" property="age" value="50"/>
	<ul>
		<li><jsp:getProperty property="name" name="person"/>
		<li><jsp:getProperty property="age" name="person"/>
	</ul>
</body>
</html>