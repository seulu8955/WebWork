<%@page import="test.file.dto.FileDto"%>
<%@page import="test.file.dao.FileDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	int num= Integer.parseInt(request.getParameter("num"));
	
	boolean isSuccess=FileDao.getInstance().delete(num);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/file/delete.jsp</title>
</head>
<body>
	<%if(isSuccess){ %>
		<script>
			alert("<%=num %>번 파일 삭제 완료");
			location.herf="${pageContext.request.contextPath }/file/list.jsp"
		</script>
	<%}else{ %>
		<script>
			alert("<%=num %>번 파일 삭제 실패");
			location.herf="${pageContext.request.contextPath }/file/list.jsp"
		</script>
	<%} %>
	
</body>
</html>