<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	//session scope 에 id 라는 키값으로 저장된 ㄱ밧이 있는지 읽어와 본다.(없으면 null)
	String id=(String)session.getAttribute("id");
	
	
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/index.jsp</title>
<style>
	#login{
		position:fixed;
		bottom: : 50;
	    right: 0;
	    width: 300px;
	    
	}
	
</style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</head>
<body>
	<jsp:include page="/include/navbar.jsp">
		<jsp:param value="index" name="thisPage"/>
   	</jsp:include>
	<div class="container">
		<div id="login" class="">
	   		<%if(id!=null){ %>
	   			<p >
	   				<strong><%=id %></strong>
	   				<a href="${pageContext.request.contextPath }/users/private/info.jsp"> MyPage</a><%// 이미지 넣기 %>
	   				
	   				<a href="${pageContext.request.contextPath }/users/logout.jsp">로그아웃</a>
	   			</p>	
	   		<%}else{ %>
	   		<button id="makeInfo" type="button" href="${pageContext.request.contextPath }/users/signup_form.jsp" class="btn btn-outline-secondary" >회원가입</button>
	   				<%-- <a href="${pageContext.request.contextPath }/users/signup_form.jsp" class="col-md-3 offset-md-9" >회원가입</a><%// 이미지 넣기 %> --%>
   		 <%} %>
   		 </div>
   		 <br />
      	<h1>인덱스 페이지 입니다.</h1>
      	<ul>
         	<li><a href="${pageContext.request.contextPath }/users/loginform.jsp">로그인</a></li>
         	<li><a href="${pageContext.request.contextPath }/private/study.jsp">회원전용 공간(공부)</a></li>
         	<li><a href="${pageContext.request.contextPath }/private/game.jsp">회원전용 공간(게임)</a></li>
         	<li><a href="file/list.jsp">자료실</a></li>
         	<li><a href="cafe/list.jsp">글목록보기</a></li>
      	</ul>
	</div>
</body>
</html>