<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="bdto" class="woodong.bbs.BbsDTO" scope="page"></jsp:useBean>
<jsp:setProperty property="*" name="bdto"/>
<jsp:useBean id="bdao" class="woodong.bbs.BbsDAO" scope="session"></jsp:useBean>
<%
int result=bdao.bbsDelete(bdto);
String msg=result>0?"삭제 완료!":"삭제 실패!";
%>
<script>
window.alert('<%=msg %>');
location.href='bbsList.jsp';
</script>