<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>ajax form 예제</h3>
	<form action="insert.jsp" method="post" id="myForm">
		<input type="text" name="name" placeholder="이름 입력..." />
		<input type="text" name="addr" placeholder="주소 입력..." />
		<button type="submit">추가</button>
	</form>
	<script src="${pageContext.request.contextPath }/js/gura_util.js"></script>
	
	<script>
		//id가 myForm인 요소에 submit 이벤트가 일어나면 실행할 함수 등록
		document.querySelector("#myForm").addEventListener("submit",function(event){
			//폼 제출을 강제로 막는다.
			event.preventDefault();
			//gura_util에 있는 함수를 이용해서 폼에 입력한 내용을 ajax 요청을 통해 전송
			//this 대신 doucument 이용 가능
			ajaxFormPromise(this)
			.then(function(response){
				return response.json();
			})
			.then(function(data){
				console.log(data);
			});
		});
			
	</script>
</body>
</html>