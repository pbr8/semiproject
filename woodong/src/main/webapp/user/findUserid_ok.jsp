<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="udao" class="woodong.user.UserDAO"></jsp:useBean>

<%
String name=request.getParameter("name");
String resident_num=request.getParameter("resident_num");
String email=request.getParameter("email");

String user_id=udao.findUserId(name,resident_num,email);

if(user_id.equals("")||user_id==null){
	%>
	<script>
		window.alert('잘못 입력 하셧거나 존재하지 않는 아이디 입니다.');
		location.href='findUserid.jsp';
	</script>
	<%	
}else{
	%>
	<script>
		window.alert('<%=name%>님의 아이디는 <%=user_id%> 입니다.');
		location.href='/woodong';
		
	</script>
	<%
	
}
%>
