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
	out.print("출력되지않는 텍스트/버퍼에 저장"); //있었지만 화면에 나오기전에 클리어되버림
	out.clearBuffer();//버퍼를 비움
	
	out.print("<h2>out 내장객체</h2>");
	//버퍼 크기 확인
	out.print("출력 버퍼의 크기 : "+out.getBufferSize()+"<br>");
	out.print("남은 버퍼의 크기 : "+out.getRemaining());
	out.flush();
	out.print("남은 버퍼의 크기: " + out.getRemaining()+"<br>");
	
	out.print(1);
	out.print(false);
	out.print('가');
%>
</body>
</html>