<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%
String bbs_subject=request.getParameter("bbs_subject");
String bbs_ref=request.getParameter("bbs_ref");
String bbs_lev=request.getParameter("bbs_lev");
String bbs_step=request.getParameter("bbs_step");
%>
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
#fs{
	width: 680px;
}
#art{
	padding-left:330px;
}
</style>
</head>
<%@include file="/header.jsp" %>
<body>
<%@include file="/subview.jsp" %>
<section>
	<article id="art">
	<form name="bbsReWrite" action="locationbbsrewrite_ok.jsp">
		<fieldset id="fs">
			<h3>답글 작성</h3>
			<input type="hidden" name="bbs_ref" value="<%=bbs_ref %>">
			<input type="hidden" name="bbs_lev" value="<%=bbs_lev %>">
			<input type="hidden" name="bbs_step" value="<%=bbs_step %>">
			<label>제목 : </label>
			<input type="text" name="bbs_subject" value="Re:<%=bbs_subject %>" style="width: 698px;"><hr>
			<textarea name="bbs_content" placeholder="내용을 입력해주세요."></textarea>
		</fieldset>
		<br>
		<div id="btset">
		<input type="submit" class="button" value="답글쓰기">
		<input type="button" class="button" value="돌아가기" onclick="location.href='bbsList.jsp'">
		</div>
		</form>
	</article>
</section>
</body>
</html>