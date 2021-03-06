<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="woodong.bbs.*" %>
<jsp:useBean id="bdao" class="woodong.bbs.BbsDAO" scope="session"></jsp:useBean>
<%
String s_bbs_idx=request.getParameter("bbs_idx");

if(s_bbs_idx==null||s_bbs_idx.equals("")){
	s_bbs_idx="0";
}
int bbs_idx=Integer.parseInt(s_bbs_idx);

BbsDTO bdto=bdao.bbsContent(bbs_idx);

if(bdto==null){
	%>
	<script>
	alert('잘못된 접근입니다.');
	location.href='bbsList.jsp';
	</script>
	<%
}
%>
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
#fs{
	width: 680px;
}
#art{
	padding-left:330px;
}
#fo{

padding-top:250px;

}
</style>
</head>
<%@include file="/header.jsp" %>
<body>
<%@include file="/subview.jsp" %>
<section>
	<article id="art">
	<form name="update" action="bbsupdate_ok.jsp?">
		<fieldset id="fs">
			<h3 align="center">게시글 수정</h3>
			<input type=hidden name="bbs_idx" value="<%=bdto.getBbs_idx()%>">
			<label>제목 : </label>
			<input type="text" name="bbs_subject" value="<%=bdto.getBbs_subject()%>" style="width: 698px;"><hr>
			<textarea name="bbs_content"><%=bdto.getBbs_content().replaceAll("<br>", "\n") %></textarea>
		</fieldset>
		<br>
		<div id="btset">
		<input type="submit" class="button" value="수정하기">
		<input type="button" class="button" value="돌아가기" onclick="location.href='bbsList.jsp'">
		</div>
		</form>
	</article>
</section>
</body>
<article id="fo">
<%@include file="/footer.jsp"%>
</article>
</html>