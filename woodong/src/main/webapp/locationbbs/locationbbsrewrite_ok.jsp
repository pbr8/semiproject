<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="bdto" class="woodong.bbs.BbsDTO" scope="page"></jsp:useBean>
<jsp:setProperty property="*" name="bdto"/>
<jsp:useBean id="bdao" class="woodong.bbs.BbsDAO" scope="session"></jsp:useBean>
<jsp:useBean id="udao" class="woodong.user.UserDAO" scope="session"></jsp:useBean>
<%
String userid=(String)session.getAttribute("sid");
int user_idx=udao.findUserIdxByUserId(userid);
int result=bdao.localBbsReWriter(bdto, user_idx);
String msg=result>0?"답글작성 완료!":"답글작성 실패";
%>
<script>
window.alert('<%=msg %>');
location.href='bbsList.jsp';
</script>