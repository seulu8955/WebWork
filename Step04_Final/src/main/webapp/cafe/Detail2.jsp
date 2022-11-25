<%@page import="test.cafe.dao.CafeDao"%>
<%@page import="test.cafe.dto.CafeDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//자세히 보여줄 글의 번호 읽어 오기
	int num=Integer.parseInt(request.getParameter("num"));
	//DB에서 읽어오기
	CafeDto dto=CafeDao.getInstance().getData(num);
	//응답
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	  <div class="container">
	      <h3>글 상세 보기</h3>
		      <table>
		         <tr>
		            <th>글번호</th>
		            <td><%=dto.getNum() %></td>
		         </tr>
		         <tr>
		            <th>작성자</th>
		            <td><%=dto.getWriter() %></td>
		         </tr>
		         <tr>
		            <th>제목</th>
		            <td><%=dto.getTitle() %></td>
		         </tr>
		         <tr>
		            <th>조회수</th>
		            <td><%=dto.getViewCount() %></td>   
		         </tr>
		         <tr>
		            <th>작성일</th>
		            <td><%=dto.getRegdate() %></td>
		         </tr>
		         <tr>
		         	<th>내용</th>
		         	<td><textarea rows="10" readonly></textarea></td>
		         </tr>
		         <tr>	
		            <th>내용</th>
		           	<td>
		           		<textarea row="10" readonly><%=dto.getContent() %></textarea>
		        	</td>
				</tr>
				</table>
		</div>

</body>
</html>