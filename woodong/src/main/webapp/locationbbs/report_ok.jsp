<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="rdto" class="woodong.report.ReportDTO" scope="page"></jsp:useBean>
<jsp:setProperty property="*" name="rdto"/>
<jsp:useBean id="rdao" class="woodong.report.ReportDAO" scope="session"></jsp:useBean>
<jsp:useBean id="udao" class="woodong.user.UserDAO" scope="session"></jsp:useBean>
<%
String s_bbs_idx=request.getParameter("bbs_idx");
String rcontent=request.getParameter("rcontent");
int bbs_idx=Integer.parseInt(s_bbs_idx);
String userid=(String)session.getAttribute("sid");
int user_idx=udao.findUserIdxByUserId(userid);
int result=rdao.addReport(bbs_idx, user_idx, rcontent);
String msg=result>0?"신고가 접수되었습니다":"이미 신고하신 게시물입니다.";
%>
<script>
	window.alert('<%=msg %>');
	location.href='bbsList.jsp'
</script>