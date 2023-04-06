<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="utils.AlertFunc"%>
<%
	if(session.getAttribute("UserId")==null){
		AlertFunc.alertLocation("로그인이 필요합니다", "../07LoginOutPrac/LoginForm.jsp", out);
		return; //하부동작은 더이상 진행할 이유가 없기 때문에 종료 시키기 위한 리턴
	}
%>