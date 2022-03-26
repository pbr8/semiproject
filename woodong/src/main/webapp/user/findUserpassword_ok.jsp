<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="udao" class="woodong.user.UserDAO"></jsp:useBean>

<%
String id=request.getParameter("id");
String name=request.getParameter("name");
String resident_num=request.getParameter("resident_num");
String email=request.getParameter("email");

boolean result=udao.findUserPassword(name, resident_num, email, id);

if(!result){
	%>
	<script>
		window.alert('잘못 입력 하셧거나 존재하지 않는 아이디 입니다.');
		location.href='findUserpassword.jsp';
	</script>
	<%	
}else{
	%>
	<script>
		location.href='changeUserpassword.jsp?id=<%=id%>';
	</script>
	<%
	
}
%>