<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	int status=response.getStatus();
	if(status==404){ //not found
		out.print("404에러 발생");
		out.print("<br>파일 경로를 확인하세요.");
	}else if(status==405){//method not allowed
		out.print("405에러 발생");
		out.print("<br>요청 방식(method)을 확인하세요.");
	}else if(status==500){//Internal server error 웹서버쪽 코드나 내부적인 오류 오타,로직 등..
		out.print("500에러 발생");
		out.print("<br>소스 코드의 에러를 확인하세요.");
	}
%>
</body>
</html>