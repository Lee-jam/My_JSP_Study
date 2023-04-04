<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>Cookie setting</h2>
<%
	Cookie cookie = new Cookie("cookie","뉴진스"); //내가만든쿠키 생성
	cookie.setPath(request.getContextPath()); //쿠키를 어디에 적용할 건지 적용 경로 설정
	cookie.setMaxAge(3600); //쿠기 유지기간 설정 초단위
	response.addCookie(cookie); //응답헤더에 넣어서 클라이언트에게 전달
%>
	<h2>쿠키 설정 후 쿠키값 확인</h2>
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
	<h2>page 이동 후 확인</h2>
	<a href="CookieMove.jsp">페이지 이동</a>
</body>
</html>