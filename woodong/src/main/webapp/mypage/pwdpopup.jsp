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
}

div input {
	width: 150px;
	height: 30px;
	background-color: white;
	transition: 1.0s;
}

#sm:hover {
	background-color: black;
	color: white;
	transform: scale(1.0);
}

</style>
</head>
<body>
	<form action="pwdpopup_ok.jsp" method="post">
		<fieldset>
			<legend style="width: 150px;">
				<img src="/woodong/img/logo.png">
				<h5>비밀번호확인</h5>
			</legend>
			<br> 회원 정보를 변경하시려면<br>아래에 현재의 비밀번호를 입력하세요. <br> <br>
			<br> <input type="password" placeholder="비밀번호" id="pwd_input" name="user_pwd">
			<br> <br>
			<div>
				<input type="submit" value="확인" id="sm">
			</div>
			<br>
		</fieldset>
	</form>
</body>
</html>