<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/promise/test10.jsp</title>
</head>
<body>
	<input type="text" id="msg" placeholder="메세지 입력..." />
	<button id="sendBtn">전송</button>
	<script>
		/*
			input요소에 문자열을 입력하고 전송 버튼을 누르면 입력한 문자열이 send.jsp 페이지로
			전송이 되도록 하려고 한다.
			단, 페이지 전환이 없이
			
		*/
		let result1;
		let result2;
		
		document.querySelector("#sendBtn").addEventListener("click",function(){
			//입력한 내용 읽어오기
			let msg=document.querySelector("#msg").value;
			//fetch 함수를 호출하면서 get 방식 파라미터로 send.jsp 페이지를 요청하며 전달
			fetch("send.jsp?msg="+msg)
			.then(function(response){
				console.log(response);
				return response.text();
			})
			.then(function(data){
				console.log(data);
			})
			.then(function(data){
				console.log(data);
				//함수의 매게 변수에 전달된 문자열을 resul1에 대입
				result1=data;
				//함수ㅡ의 매개 변수에 전달된 문자열을 object 로 변환해서 result2에 대입
				result2=Json.parse(date);
				//object 를 json 문자열로 변환해서 result3에 대입
				result3=Json.stringify(result2);
			})
		});
	</script>
</body>
</html>