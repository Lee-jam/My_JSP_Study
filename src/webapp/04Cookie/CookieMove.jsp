<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>cookie 확인</title>
</head>
<body>
	<h2>쿠키 값 확인</h2>
<%
	Cookie[] cookies = request.getCookies(); //요청 헤더에서 모든 쿠키를 얻기(쿠키는 1개가 아닐 수 있으니 배열 형태로)
	if(cookies!=null){
		for(Cookie c:cookies){
			String cName = c.getName();
			String cVal = c.getValue();
			out.println(String.format("%s : %s<br>",cName,cVal));
		}
	}
%>
	
</body>
</html>