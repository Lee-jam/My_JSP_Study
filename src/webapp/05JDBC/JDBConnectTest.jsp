<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="common.JDBConnect"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JDBC</title>
</head>
<body>
	<h2>TDBC connect test1</h2>
<%
	JDBConnect jdbc1 = new JDBConnect();
	jdbc1.close();
	
%>
<%
	String driver ="oracle.jdbc.OracleDriver";
	String url="jdbc:oracle:thin:@localhost:1521:xe";
	String id = "jmlee";
	String pw = "1234";
	JDBConnect jdbc2 = new JDBConnect(driver,url,id,pw);
	jdbc2.close();
	
%>
<%
	JDBConnect jdbc3 = new JDBConnect(application);
	jdbc3.close();
%>

</body>
</html>