<%@page import="utils.AlertFunc"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="utils.ManageCookie" %>
<%
	String user_id = request.getParameter("user_id").trim();
	String user_pw = request.getParameter("user_pw").trim();
	String save_check = request.getParameter("save_check");
	
	if("user".equals(user_id)&&"1234".equals(user_pw)){
		//로그인 성공
		if(save_check!=null&&save_check.equals("Y")){
			ManageCookie.makeCookie(response, "loginId", user_id, 86400);
		}
		else{
			ManageCookie.deleteCookie(response, "loginId");
		}
		AlertFunc.alertLocation("로그인 성공", "IdSaveMain.jsp", out);
		%>
		<script>
			alert('로그인에 성공했을까안했을까');
			location.href='IdSaveMain.jsp';
		</script>
		<%
	}else{
		//로그인 실패
		AlertFunc.alertBack("로그인실패", out);
	%>
	<script>
		alert('로그인에 안했을까했을까');
		history.back();
	</script>
	<%
	}
%>