<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
body {
	margin: 0px auto;
	text-align: center;
}

fieldset {
	border: 2px solid black;
}

body img {
	width: 50px;
	float: left;
}

#pwd_input {
	width: 250px;
	height: 40px;
	border-radius: 10px;
	border: 2px solid black;
}

div input {
	width: 150px;
	height: 30px;
	background-color: white;
	transition: 1.0s;
	border: 2px solid black;
}

#sm:hover {
	background-color: black;
	color: white;
	transform: scale(1.0);
}

</style>
</head>
<body>
	<form action="user_nicknameCheck_ok.jsp" name="nicknameCheck" method="post">
		<fieldset>
			<legend style="width: 150px;">
				<img src="/woodong/img/logo.png">
				<h5>중복 검사</h5>
			</legend>
			<br> 사용하실 별명을 입력해 주세요. <br> <br>
			<br> <input type="text" placeholder="별명 입력" id="pwd_input" name="nickname">
			<br> <br>
			<div>
				<input type="submit" value="확인" id="sm">
			</div>
			<br>
		</fieldset>
	</form>
</body>
</html>
