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
	.carousel-item{
		height: 600px;
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
	<div class="container-md" >
		<h1>인덱스 페이지 입니다.</h1>
		<div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
		 	<div class="carousel-inner">
	   			<div class="carousel-item active">
	   				<a href="${pageContext.request.contextPath }/private/game.jsp" target="_blank">
	     				<img src="https://img.freepik.com/premium-photo/top-view-of-colorful-magnetic-building-blocks-on-yellow-background_74333-1350.jpg?w=1800" class="d-block w-100" alt="...">
	     			</a>	
	    		</div>
	    		<div class="carousel-item">
	    			<a href="${pageContext.request.contextPath }/private/study" target="_blank">
	     				<img src="https://img.freepik.com/free-photo/school-supplies-on-the-table-composition_23-2148939177.jpg?w=2000&t=st=1669566888~exp=1669567488~hmac=6e421a527ccda92171e512bcf258b8593170befdec35d5ba5dcb1d1429edfb52" class="d-block w-100" alt="...">
	     			</a>	
				</div>
	    		<div class="carousel-item">
	    			<a href="https://us02web.zoom.us/j/2385516187?pwd=NE5aMG5BNGhRMmgrTTRVR1ExMGlpZz09" target="_blank">
	      				<img src="https://cdn.pixabay.com/photo/2015/02/26/23/52/teacher-651318_960_720.png" class="d-block w-100" alt="...">
	      			</a>
	      		</div>
	      		<div class="carousel-item">
	    			<a href="http://acornedu.atosoft.net" target="_blank">
	      				<img src="https://media.istockphoto.com/id/963192098/ko/%EC%82%AC%EC%A7%84/%ED%95%99%EA%B5%90-%ED%95%99%EC%83%9D-%EA%B5%90%EC%9C%A1-%ED%85%8C%EC%8A%A4%ED%8A%B8-%EB%8D%B0-%EC%83%9D%EA%B0%81-%ED%95%98%EB%93%9C-%EB%8C%80%ED%95%99-%EA%B5%90%EC%9C%A1-%EC%9E%85%ED%95%99-%EB%B0%8F-%EC%84%B8%EA%B3%84-%EB%AC%B8-%EB%A7%B9-%ED%87%B4%EC%B9%98-%EB%82%A0-%EA%B0%9C%EB%85%90%EC%97%90-%EB%8C%80-%ED%95%9C-%EA%B5%90%EC%8B%A4%EC%97%90%EC%84%9C-%EB%8B%B5%EB%B3%80-%EC%93%B0%EA%B8%B0-%EC%8B%9C%ED%97%98.jpg?s=612x612&w=is&k=20&c=-DQ3ovDGYawHyL4LmbyvdBFKQQnOunAe-TUKgLE5cgw=" class="d-block w-100" alt="...">
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
		<br />
		<div>
			<button class="btn btn-primary" type="button" data-bs-toggle="collapse" data-bs-target="#collapseColor" aria-expanded="false" aria-controls="collapseColor">
				color
  			</button>
  			<div class="collapse" id="collapseColor">
				<h2>bootstrap의 버튼 색상</h2>        
	            <button class="btn btn-primary">primary</button>
	            <button class="btn-lg btn-secondary">secondary</button>
	            <button class="btn btn-success">success</button>
	            <button class="btn btn-danger">danger</button>
	            <button class="btn btn-warning">warning</button>
	            <button class="btn btn-info">info</button>
	            <button class="btn btn-outline-dark">dark</button>
	            <button class="btn btn-light">light</button>
            </div>
		</div>   	
      	<br />
      	
      	
      	
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