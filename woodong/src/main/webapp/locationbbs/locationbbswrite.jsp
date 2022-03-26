<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body{
	width: 1500px;
	margin: 0px auto;
	padding-top: 200px;
}
textarea{
	width: 740px;
	height: 500px;
}
label{
	font-size: medium;
}
.button{
	background-color: #ff0000;
	border-radius: 5px;
	width: 80px;
	height: 35px;
	color: white;
	border: none;
}
#btset{
	text-align: center;
}
</style>
</head>
<%@include file="/header.jsp" %>
<body>
<%@include file="/subview.jsp" %>
<section>
	<article id="leftside">
	<form name="bbsWrite" action="locationbbswrite_ok.jsp">
	<h5 style="color:#ff0000">서울 게시판</h5>
		<fieldset>
			<label>제목 : </label>
			<input type="text" name="bbs_subject" placeholder="제목을 입력해주세요." style="width: 698px;"><hr>
			<textarea name="bbs_content" placeholder="내용을 입력해주세요."></textarea>
		</fieldset>
		<br>
		<div id="btset">
		<input type="submit" class="button" value="글 올리기">
		<input type="button" class="button" value="돌아가기" onclick="location.href='bbsList.jsp'">
		</div>
		</form>
	</article>
</section>
</body>
</html>