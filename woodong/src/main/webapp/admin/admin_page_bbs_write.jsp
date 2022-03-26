<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/woodong/css/adminPageHeader.css">
<style>
body{
    margin: 0 auto;
    width: 680px;
}
#fieldset{
 	margin-top: 30px;
	width: 650px
}
textarea{
	width: 680px;
	height: 500px;
}
label{
	font-size: medium;
}
.b_css{
	border: 1px solid darkgray;
	background-color: rgb(0,0,0,0);
	color: gray;
	padding: 5px;
}
#btset{
	text-align: center;
	margin-bottom: 50px;
}
#title{
	margin-bottom: 20px;
}
h3{
	text-align: center;
}

</style>
</head>
<body>
<section>
<%@ include file="adminPageHeader.jsp" %>
	<article id="leftside">
	<form name="bbs_write" action="bbs_write_ok.jsp">
		<fieldset id="fieldset">
			<h3>공지글 작성</h3>
			<div id="title">
			<label>제목 : </label>
			<input type="text" name="bbs_subject" size="90px">
			</div>
			<textarea name="bbs_content" placeholder="내용을 입력해주세요."></textarea>
		</fieldset>
		<br>
		<div id="btset">
		<input type="submit" class="b_css" value="등록">
		<input type="reset" class="b_css" value="다시 작성">
		</div>
		</form>
	</article>
</section>
</body>
</html>