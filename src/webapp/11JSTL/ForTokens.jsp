<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL core forTokens</title>
</head>
<body>
<%-- StringTokenizer class --%>
<%
	String rainbow = "빨,주,노,초,파,남,보";
%>
<c:forTokens items="<%=rainbow%>" delims="," var="color">
	<span style="color:${color}">${color}</span>
</c:forTokens>
</body>
</html>