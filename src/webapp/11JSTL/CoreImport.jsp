<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL core import</title>
</head>
<body>
	<c:set var="reqVar" value="park" scope="request"/>
	<c:import url="./include/OtherPage.jsp" var="contents">
		<c:param name="param1" value="JSP"/>
		<c:param name="param2" value="Java"/>
	</c:import>
	${contents}
	<c:import url="./include/OtherPage.jsp">
		<c:param name="param1" value="ultra"/>
		<c:param name="param2" value="super"/>
	</c:import>
	<iframe src="./include/OuterPage.jsp" style="width:100%;height:600px;"></iframe>
</body>
</html>