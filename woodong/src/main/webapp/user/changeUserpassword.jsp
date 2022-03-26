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
	margin-left:105px; 
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
		<h2>비밀번호 변경</h2>
		<form action="changeUserpassword_ok.jsp" name="changeUserpassword">
			<ul>
				<li>
					
					<input type="password" name="newpwd" placeholder="새 비밀번호 입력" class="text">
				</li>
				<li>
				
					<input type="password" name="newpwd_check" placeholder="새 비밀번호 확인" class="text">
				</li>
				
			</ul>
			<div>
				<input type="submit" value="확인" class="button" id="button">
			</div>
				<input type="hidden" name="id" value="<%=request.getParameter("id")%>">
		</form>
		</fieldset>
	</article>

</section>
<%@include file="/footer.jsp" %>
</body>
</html>