<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8");%>
<jsp:useBean id="udao" class="woodong.user.UserDAO"></jsp:useBean>

<%
String id=request.getParameter("id");

boolean result=udao.user_IdCheck(id);


if(result){
	%>
	<script>
		window.alert('<%=id%>은(는) 중복입니다. 재입력 바랍니다!.');
		location.href='user_idCheck.jsp';
	</script>
	<%	
}else{
	%>
	<script>
		window.alert('<%=id%> 사용 가능!');
		opener.document.userjoin.user_id.value='<%=id%>';
		window.self.close();
	</script>
	<%
	
}
%>