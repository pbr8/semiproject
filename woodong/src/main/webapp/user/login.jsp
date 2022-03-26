<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
body img {
	width: 50px;
	float: left;
}
ul li {
	list-style-type: none;
}
a {
	text-decoration: none;
	color: darkred;	
}
.text {
	width: 300px;
	height: 50px;
	margin-left: 30px;
	margin-bottom: 10px;
	border-radius: 10px;
	border: 2px solid black;
}
.button{
	margin-top:10px;
	width: 300px;
	height: 30px;
	margin-right: 40px;
	background-color: white;
	transition: 1.0s;
}
#button:hover {
	background-color: black;
	color: white;
	transform: scale(1.0);
}
</style>
<script type="text/javascript">
	function openFindId() {
		window.self.close();
		opener.location.href='/woodong/user/findUserid.jsp';
		
	}
	function openFindPassword() {
		window.self.close();
		opener.location.href='/woodong/user/findUserpassword.jsp';
	}
</script>
<%
String save_id="";

Cookie cks[]=request.getCookies();
if(cks!=null){
	for(int i=0;i<cks.length;i++){
		if(cks[i].getName().equals("save_id")){
			save_id=cks[i].getValue();
		}
	}
}
%>
</head>
<body>
<section>
	<article>
		<fieldset>
		<legend style="width:150px;text-align: center;">
		<img src="/woodong/img/logo.png">
		<h5>로그인</h5>
		</legend>
		<form action="login_ok.jsp" name="login">
		
			<div>
				<ul>
					<li><input type="text" name="user_id" placeholder="아이디" class="text" value="<%=save_id%>"></li>	
					<li><input type="password" name="user_pwd" placeholder="패스워드" class="text"></li>
					<li style="margin-left:30px;"><input type="checkbox" name="save_id" value="on" <%=save_id.equals("")?"":"checked" %>>ID 기억하기
						<label><a href="javascript:openFindId()">아이디 찾기</a>|
							   <a href="javascript:openFindPassword()">비밀번호 찾기</a>
						</label></li>
					<li style="text-align: center;"><input type="submit" value="로그인" class="button" id="button"></li>
					
				</ul>
			</div>
		</form>
		</fieldset>
	</article>
</section>
</body>
</html>