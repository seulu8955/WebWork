<%@page import="java.net.URLEncoder"%>
<%@page import="java.net.URL"%>
<%@page import="test.users.dao.UsersDao"%>
<%@page import="test.users.dto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	//로그인후 가야할 목적지 정보
	String url=request.getParameter("url");
	//로그인 실패를 대비해서 목적지 정보를 인코딩한 결과도 준비한다.
	String encodedUrl=URLEncoder.encode(url);
	
	//1. 폼 전송되는 아이디, 비밀번호 읽어오기
	request.setCharacterEncoding("utf-8");
	String id= request.getParameter("id");
	String pwd = request.getParameter("pwd");
	
	
	//2. db에 실존하는 정보인지 확인하기(맞는 정보면 로그인 처리)
	UsersDto dto= new UsersDto();
	UsersDao dao=UsersDao.getInstance();
	dto.setId(id);
	dto.setPwd(pwd);
	
	boolean isSuccess=dao.isValid(dto);
	
	
	
	
	//3. 응답
%>    	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/login.jsp</title>
</head>
<body>
	<%if(isSuccess){
		session.setAttribute("id", id); %>
		<p class="alert">로그인 성공
			<a href="${pageContext.request.contextPath }/index.jsp">인덱스</a>
			<a href="<%=url %>">확인</a>
		</p>
	<%}else{ %>
		<p class="alert">아이디 혹은 비밀번호가 옳지 않습니다.</p>
		<a href="${pageContext.request.contextPath }/users/loginform.jsp?url=<%=encodedUrl %>"></a>
		<%} %>
	</div>
</body>
</html>