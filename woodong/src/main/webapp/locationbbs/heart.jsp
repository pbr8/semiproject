<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="hdto" class="woodong.heart.HeartDTO" scope="page"></jsp:useBean>
<jsp:setProperty property="*" name="hdto"/>
<jsp:useBean id="hdao" class="woodong.heart.HeartDAO" scope="session"></jsp:useBean>
<%
String s_bbs_idx=request.getParameter("bbs_idx");
int bbs_idx=Integer.parseInt(s_bbs_idx);
String s_user_idx=request.getParameter("user_idx");
int user_idx=Integer.parseInt(s_user_idx);
int result=hdao.addHeart(bbs_idx, user_idx);

String msg=result>0?"추천 완료!":"이미 추천한 글입니다!";
%>
<script>
window.alert('<%=msg %>');
history.go(-1);
</script>