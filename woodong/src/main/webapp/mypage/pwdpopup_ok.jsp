<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="udao" class="woodong.user.UserDAO"></jsp:useBean>

<%
String sid=(String)session.getAttribute("sid");
String pwd=request.getParameter("user_pwd");
boolean result=udao.loginCheck(sid, pwd);

if(result){
	%>
	<script type="text/javascript">
	window.alert('비밀번호 확인 완료!');
	opener.location.href='myinfoChange.jsp';
	window.self.close();
	</script>
	<%
}else{
	%>
	<script type="text/javascript">
	window.alert('비밀번호가 일치하지 않습니다.');
	location.href='pwdpopup.jsp';
	</script>
	<%
}
%>