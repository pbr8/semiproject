<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
h2 {
	text-align: center;
}

fieldset {
	width: 800px;
	margin: 200px auto;
}
fieldset ul li{
	list-style-type: none;
	margin-left: 105px; 
}	
fieldset div {
	text-align: center;
}
.text {
	width: 500px;
	height: 60px;
	font-size: 20px;
	margin-bottom: 20px;
	border-radius: 10px;
	border: 1px solid black;
}
.button {
	height: 60px;
	font-size: 20px;
	margin-bottom: 20px;
	
	transition: 1.0s;
	border-radius: 10px;
	background-color: white;
	border: 1px solid black;
}

#button:hover {
	background-color: black;
	color: white;
	transform: scale(1.0);
}

div input {
	
	width: 150px;
	height: 30px;
	
}
</style>
</head>
<body>
<%@include file="/header.jsp" %>
<section>
	<article>	
		<fieldset>
		<h2>비밀번호 찾기</h2>
		<form action="findUserpassword_ok.jsp" name="findUserpassword">
			<ul>
				<li>
					<input type="text" name="id" placeholder="아이디 입력" class="text">
				</li>
				<li>
					<input type="text" name="name" placeholder="이름 입력" class="text">
				</li>
				<li>
					<input type="text" name="resident_num" placeholder="주민등록번호 입력" class="text" maxlength="13"
					oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
				</li>
				<li>
					<input type="text" name="email" placeholder="이메일 입력" class="text">
				</li>
				
			</ul>
			<div>
				<input type="submit" value="확인" class="button" id="button">		
			</div>
		
		</form>
		</fieldset>
	</article>

</section>
<%@include file="/footer.jsp" %>
</body>
</html>