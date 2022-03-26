<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8");%>
<jsp:useBean id="udao" class="woodong.user.UserDAO"></jsp:useBean>

<%
String nickname=request.getParameter("nickname");

boolean result=udao.user_NicknameCheck(nickname);


if(result){
	%>
	<script>
		window.alert('<%=nickname%>은(는) 중복입니다. 재입력 바랍니다!.');
		location.href='user_nicknameCheck.jsp';
	</script>
	<%	
}else{
	%>
	<script>
		window.alert('<%=nickname%> 사용 가능!');
		opener.document.userjoin.user_nickname.value='<%=nickname%>';
		window.self.close();
	</script>
	<%
	
}
%>