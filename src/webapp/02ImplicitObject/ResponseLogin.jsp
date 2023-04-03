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
	String id = request.getParameter("userId");
	String pw = request.getParameter("userPw");
	if(id.equalsIgnoreCase("user")&&pw.equalsIgnoreCase("1234")){
		//reponse.sendRedirect()
		response.sendRedirect("ResponseOK.jsp");
	}else{
		//request.getRequestDispatcher()
		request.getRequestDispatcher("ResponseMain.jsp?logErr=1");
	}
%>
</body>
</html>