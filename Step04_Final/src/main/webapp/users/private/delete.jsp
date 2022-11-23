<%@page import="test.users.dao.UsersDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	//로그인된 아이디 읽어오기
	String id=(String)request.getParameter("id");
	//2.DB 에서 삭제
	UsersDao.getInstance().delete(id);
	//3.로그아웃 처리
	session.invalidate();
	//4. 응답
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
	
	
	</div>
</body>
</html>