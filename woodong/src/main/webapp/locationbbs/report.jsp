<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="woodong.bbs.*" %>
<jsp:useBean id="bdto" class="woodong.bbs.BbsDTO" scope="page"></jsp:useBean>
<jsp:setProperty property="*" name="bdto"/>
<jsp:useBean id="bdao" class="woodong.bbs.BbsDAO" scope="session"></jsp:useBean>
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
	<form name="report" action="report_ok.jsp">
		<fieldset id="fs">
			<h3 align="center">게시글 신고</h3>
			<input type=hidden name="bbs_idx" value="<%=request.getParameter("bbs_idx") %>">
			<label>게시물 제목 : <%=request.getParameter("bbs_subject") %></label>
			<textarea name="rcontent" placeholder="신고사유를 작성해주십시오."></textarea>
		</fieldset>
		<br>
		<div id="btset">
		<input type="submit" class="button" value="신고하기">
		<input type="button" class="button" value="돌아가기" onclick="location.href='bbsList.jsp'">
		</div>
		</form>
	</article>
</section>
</body>
</html>