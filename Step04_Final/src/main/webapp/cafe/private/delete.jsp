<%@page import="test.cafe.dao.CafeDao"%>
<%@page import="test.cafe.dto.CafeDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//삭제할 글의 번호 받아오기 
	int num= Integer.parseInt(request.getParameter("num"));
	
	CafeDto dto=new CafeDto();
	dto.setNum(num);
	//작성자와 삭제 요청자가 동일한지 확인
	//id 를 세션에서 받아오고 num을 통해 작성자를 받아와서 비교
	String id=(String)session.getAttribute("id");
	String writer=CafeDao.getInstance().getData(num).getWriter();
	
	if(!id.equals(writer)){
		response.sendError(HttpServletResponse.SC_FORBIDDEN, "삭제 권한이 없습니다.");
		
	}
	
	//db에서 삭제
	CafeDao.getInstance().delete(dto);
	//응답
	String cPath=request.getContextPath();
	response.sendRedirect(cPath+"/cafe/list.jsp");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
		
	
</body>
</html>