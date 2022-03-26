<%@page import="java.util.ArrayList"%>
<%@page import="woodong.user.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="udao" class="woodong.user.UserDAO"></jsp:useBean>
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
	margin-left: 60px; 
}	
fieldset div {
	text-align: center;
}
.text {
	width: 400px;
	height: 60px;
	font-size: 20px;
	margin-bottom: 20px;
	border-radius: 10px;
	border: 1px solid black;
	text-align: center;
	background-color: rgb(233, 233, 233);
}
.text_half{
	width: 245px;
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


.select {
	width: 253px;
	height: 60px;
	font-size: 20px;
	border-radius: 10px;
	border-color: black;
	border: 1px solid black;
}
.text_button{
	width: 400px;
	height: 60px;
	font-size: 20px;
	margin-bottom: 20px;
	border-radius: 10px;
	border: 1px solid black;
}
label {
	width: 100px;
	vertical-align: middle;
	float: left;
	font-size: 20px;
	margin-top: 20px;
}
</style>
<script type="text/javascript">
	function openNicknameCheck() {
		window.open('/woodong/user/user_nicknameCheck.jsp','nickname','width=500px,height=250px');
	}
	function openpwdpopup() {
		window.open('pwdpopup.jsp','pwdpopup','width=500px,height=300px')
	}
</script>
</head>
<body>
<%@include file="/header.jsp" %>

<section>
<article>				
<fieldset>
<h2>내 정보 보기</h2>
<form action="myinfo_ok.jsp" name="userjoin" method="post">
	<ul>
		<li>
			<% 
			ArrayList<UserDTO> dto=udao.getUserInfo(sid);
			for(int i=0;i<dto.size();i++){
				UserDTO udto=dto.get(i);
				
			%>
			
			<label>이름:</label>
			<input type="text" name="user_name" value="<%=udto.getUser_name()%>" class="text" id="read" readonly>
		</li>
		<li>
			<label>아이디:</label> 
			<input type="text" name="user_id" value="<%=udto.getUser_id() %>" class="text" id="read" readonly>
		</li>
		<li>
			<label>별명:</label>
			<input type="text" name="user_nickname" value="<%=udto.getUser_nickname() %>" class="text" id="read" readonly >
		</li>
		<li>
			<label>이메일:</label>
			<input type="text" name="user_email" value="<%=udto.getUser_email() %>" class="text" readonly id="read">
		</li>
		<li>
			<label>주소:</label>
			<input type="text" name="user_addr" value="<%=udto.getUser_addr() %>" class="text" id="read" readonly>
			<%}%>
		</li>
	</ul>
	<div>
		<input type="button" value="정보 수정" class="button" id="button" onclick="javascript:openpwdpopup()">	
		<input type="button" value="뒤로 가기" class="button" id="button" onclick="location.href='mypage.jsp'">
	</div>
</form>
</fieldset>
</article>

</section>
<%@include file="/footer.jsp" %>
</body>
</html>