<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.BoardDAO" %>
<%@ page import="board.BoardDTO" %>
<%@ include file="../07LoginOutPrac/LoginCheck.jsp" %>
<%@ page import="utils.AlertFunc"%>
<%
	String num=request.getParameter("num");
	BoardDAO dao = new BoardDAO();
	int res = dao.deletePost(num);
	dao.close();
	
	if(res==1){
		AlertFunc.alertLocation(response, "삭제 완료", "List.jsp");
	}else{
		AlertFunc.alertBack("삭제 실패", out);
	}
%>