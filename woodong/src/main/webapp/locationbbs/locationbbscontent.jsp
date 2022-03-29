<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="woodong.bbs.*" %>
<jsp:useBean id="bdto" class="woodong.bbs.BbsDTO" scope="page"></jsp:useBean>
<jsp:setProperty property="*" name="bdto"/>
<jsp:useBean id="bdao" class="woodong.bbs.BbsDAO" scope="session"></jsp:useBean>
<jsp:useBean id="hdto" class="woodong.heart.HeartDTO" scope="page"></jsp:useBean>
<jsp:setProperty property="*" name="hdto"/>
<jsp:useBean id="hdao" class="woodong.heart.HeartDAO" scope="session"></jsp:useBean>
<jsp:useBean id="udao" class="woodong.user.UserDAO" scope="session"></jsp:useBean>
<%
String userid=(String)session.getAttribute("sid");
int user_idx=udao.findUserIdxByUserId(userid);
String s_bbs_idx=request.getParameter("bbs_idx");
int bbs_idx=Integer.parseInt(s_bbs_idx);
%>
<%
int result=bdao.bbsReadNum(bdto);
String msg=result>0?"조회수 업":"실패";
%>
<%
String s_idx=request.getParameter("bbs_idx");
if(s_idx==null||s_idx.equals("")){
	s_idx="0";
}
int idx=Integer.parseInt(s_idx);
BbsDTO dto=bdao.bbsContent(idx);

if(dto==null){
	%>
	<script>
	window.alert('잘못된 접근 또는 삭제된 게시글입니다.');
	location.href='bbsList.jsp';
	</script>
	<%
	return;
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
	margin-bottom: 50px;
}
#rightset{
	float: right;
}
.button{
	background-color: #ff0000;
	border-radius: 5px;
	width: 80px;
	height: 25px;
	color: white;
	border: none;
}
#fs{
	width:1000px;
}
#cond{
	padding-left:150px;
}
#fo{
	clear: both;
}
</style>
</head>
<%@include file="/header.jsp" %>
<body>
<article id="rightset">
<%@include file="/subview.jsp" %>
</article>
<section>
	<article id="leftside">
		<div id="cond">
		<h5 style="color: #ff0000">자유게시판</h5>
		
			<fieldset id="fs">
				<h3><%=dto.getBbs_subject() %></h3>
				<label>홍길동</label><br>
				<label><%=dto.getBbs_writedate() %></label>
				<label id="rightset">조회수:<%=dto.getBbs_readnum() %>|추천:<%=hdao.heartCount(bbs_idx) %></label>
				<hr>
				<%=dto.getBbs_content().replaceAll("\n", "<br>") %>
				
				<%if(user_idx!=dto.getUser_idx()) {
					%><hr>
					<label><a href="report.jsp?bbs_idx=<%=dto.getBbs_idx() %>&bbs_subject=<%=dto.getBbs_subject() %>" style="text-decoration: none; color:red; font-size:20px">신고</a></label>
				<label id="rightset"><a href="heart.jsp?bbs_idx=<%=dto.getBbs_idx() %>&user_idx=<%=user_idx %>" style="text-decoration: none; color:blue; font-size:20px">추천</a></label>
				</fieldset>
				<input type="button" class="button" value="목록" id="rightset" onclick="location.href='bbsList.jsp'">
				<input type="button" class="button" value="답글" onclick="location.href='locationbbsrewrite.jsp?bbs_subject=<%=dto.getBbs_subject()%>&bbs_ref=<%=dto.getBbs_ref()%>&bbs_lev=<%=dto.getBbs_lev()%>&bbs_step=<%=dto.getBbs_step()%>'">
				<%
				}else {
					%>
			</fieldset>
			<input type="button" class="button" value="수정" onclick="location.href='bbsupdate.jsp?bbs_idx=<%=dto.getBbs_idx()%>'">
			<input type="button" class="button" value="삭제" onclick="location.href='bbsdelete.jsp?bbs_idx=<%=dto.getBbs_idx()%>'">
			<input type="button" class="button" value="목록" id="rightset" onclick="location.href='bbsList.jsp'">
				<%
				}
				%>
		</div>
	</article>
</section>
</body>
<article id="fo">
<%@include file="/footer.jsp" %>
</article>
</html>