<%@page import="java.util.Iterator"%>
<%@page import="java.util.Set"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="common.Person" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>Application 값 가져오기</h2>
	<%
		Map<String,Person> maps = (Map<String,Person>)application.getAttribute("maps");
		//이름 : ?? 나이 :?? 줄 바꿈 이름: ?? 나이:??
		Set<String> keys = maps.keySet();
		Iterator Ikeys = keys.iterator();
		while(Ikeys.hasNext()){
			Person p = maps.get(Ikeys.next());
			out.print("이름 : "+p.getName()+" 나이 : "+p.getAge()+"<br>");
		}

	%>
</body>
</html>