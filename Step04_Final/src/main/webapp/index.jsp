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
	.left{
		position: ;
	}
</style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</head>
<body>
	<jsp:include page="/include/navbar.jsp">
		<jsp:param value="index" name="thisPage"/>
   	</jsp:include>
	<div class="container" >
		<h1>인덱스 페이지 입니다.</h1>
		<div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
		 	<div class="carousel-inner">
	   			<div class="carousel-item active">
	   				<a href="${pageContext.request.contextPath }/private/game.jsp">
	     				<img src="https://img.freepik.com/premium-photo/top-view-of-colorful-magnetic-building-blocks-on-yellow-background_74333-1350.jpg?w=1800" class="d-block w-100" alt="...">
	     			</a>	
	    		</div>
	    		<div class="carousel-item">
	    			<a href="">
	     				<img src="https://img.freepik.com/free-photo/school-supplies-on-the-table-composition_23-2148939177.jpg?w=2000&t=st=1669566888~exp=1669567488~hmac=6e421a527ccda92171e512bcf258b8593170befdec35d5ba5dcb1d1429edfb52" class="d-block w-100" alt="...">
	     			</a>	
				</div>
	    		<div class="carousel-item">
	    			<a href="https://us02web.zoom.us/j/2385516187?pwd=NE5aMG5BNGhRMmgrTTRVR1ExMGlpZz09"">
	      				<img src="${pageContext.request.contextPath }/images/zoom.png" class="d-block w-100" alt="...">
	      			</a>
	      		</div>
	      		<div class="carousel-item">
	    			<a href="https://us02web.zoom.us/j/2385516187?pwd=NE5aMG5BNGhRMmgrTTRVR1ExMGlpZz09"">
	      				<img src="https://cdn.pixabay.com/photo/2014/06/03/19/38/board-361516_960_720.jpg" class="d-block w-100" alt="...">
	      			</a>
	      		</div>
			</div>
			<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
	    		<span class="carousel-control-prev-icon" aria-hidden="true"></span>
	    		<span class="visually-hidden">Previous</span>
			</button>
  			<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
			    <span class="carousel-control-next-icon" aria-hidden="true"></span>
			    <span class="visually-hidden">Next</span>
  			</button>
		</div>
		   	
      	
      	
      	
      	
      	<%-- 
	      	<ul>
	         	<li><a href="${pageContext.request.contextPath }/users/loginform.jsp">로그인</a></li>
	         	<li><a href="${pageContext.request.contextPath }/private/study.jsp">회원전용 공간(공부)</a></li>
	         	<li><a href="${pageContext.request.contextPath }/private/game.jsp">회원전용 공간(게임)</a></li>
	         	<li><a href="file/list.jsp">자료실</a></li>
	         	<li><a href="cafe/list.jsp">글목록보기</a></li>
	      	</ul>
      	--%>
	</div>
	<jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>