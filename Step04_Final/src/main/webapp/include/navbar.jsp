<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String thisPage=request.getParameter("thisPage");
	String id=(String)session.getAttribute("id");
%>    
<%--/include/navbar.jsp --%>
<nav class="brand p-3 text-bg-dark" >
    <div class="container-fluid">
      	<div class="d-flex flex-wrap align-items-center ">
      	
	        <a href="/" class="d-flex align-items-center mb-2 mb-lg-0 text-white text-decoration-none">
	          <svg class="bi me-2" width="40" height="32" role="img" aria-label="Bootstrap"><use xlink:href="#bootstrap"/></svg>
	        </a>
	
			<ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
				<li><a href="${pageContext.request.contextPath }/index.jsp" class="nav-link px-2 text-secondary">Home</a></li>
				<li><a href="${pageContext.request.contextPath }/private/study.jsp" class="nav-link px-2 text-white">Study</a></li>
				<li><a href="${pageContext.request.contextPath }/private/game.jsp" class="nav-link px-2 text-white">Game</a></li>
				<li><a href="${pageContext.request.contextPath }/file/list.jsp" class="nav-link px-2 text-white">Reference</a></li>
				<li><a href="${pageContext.request.contextPath }/cafe/list.jsp" class="nav-link px-2 text-white">Cafe</a></li>
	        </ul>
	
			<div class="text-end">
				<%if(id!=null){ %>
				<button type="button" class="btn btn-outline-light me-2" onclick="location.href='${pageContext.request.contextPath}/users/logout.jsp';">로그아웃</button>
				<button type="button" class="btn btn-warning" onclick="location.href='${pageContext.request.contextPath}/users/private/info.jsp';">내정보</button>
				<%}else{ %>
				<button type="button" class="btn btn-outline-light me-2" onclick="location.href='${pageContext.request.contextPath}/users/loginform.jsp';">로그인</button>
				<button type="button" class="btn btn-warning" onclick="location.href='${pageContext.request.contextPath}/users/signup_form.jsp';">회원가입</button>
				<%} %>
				<%-- onclick 으로 주소를 넣을 경우onclick="location.herf=''" = 이후 쌍따옴표로 묶고 주소를 따옴표로 묶어서 총 2번 묶고 ;도 적어야 한다.  --%>
				<%-- 조건을 바꾸고 id==null 을 조건으로 하면 if함수가 제대로 작동을 안하는 이유 --%>
			</div>
		</div>
	</div>
</nav>