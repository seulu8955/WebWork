<%@page import="test.cafe.dao.CafeDao"%>
<%@page import="test.cafe.dto.CafeDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int num=Integer.parseInt(request.getParameter("num"));
	CafeDto dto=CafeDao.getInstance().getData(num);
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	textarea{
	      width: 768px;
	      height: 300px;
	   }
</style>
</head>
<body>
	<jsp:include page="/include/navbar.jsp">
		<jsp:param value="index" name="thisPage"/>
   	</jsp:include>
	<div class="container">
		<a href="${pageContext.request.contextPath }/cafe/list.jsp">글목록</a>
      <h3>글 수정 폼 입니다.</h3>
      <form action="update.jsp" method="post">
      	<input type="hidden" name="num" value="<%=dto.getNum() %>" />
         <div>
            <label for="title">제목</label>
            <input type="text" name="title" id="title" value="<%=dto.getTitle()%>"/>
         </div>
         <div>
            <label for="content">내용</label>
            <textarea name="content" id="content" ><%=dto.getContent()%></textarea>
         </div>
         <button type="submit" onclick="submitContents(this)">저장</button>
         <button type="reset">리셋</button>

      </forM>
      <script src="${pageContext.request.contextPath }/SmartEditor/js/HuskyEZCreator.js"></script>
      
</body>

</html>