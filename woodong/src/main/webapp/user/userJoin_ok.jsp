<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8");%>
<jsp:useBean id="udto" class="woodong.user.UserDTO"></jsp:useBean>
<jsp:setProperty property="*" name="udto"/>
<jsp:useBean id="udao" class="woodong.user.UserDAO"></jsp:useBean>



<%
String addr2=request.getParameter("user_addr2");
String email2=request.getParameter("user_email2");
int result=udao.userJoin(udto,addr2,email2);

String msg=(result>0)?"회원가입 완료":"회원가입 실패";
%>
<script type="text/javascript">
	window.alert('<%=msg%>');
	location.href='/woodong';
</script>