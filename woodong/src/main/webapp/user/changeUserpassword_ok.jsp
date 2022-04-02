<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="udao" class="woodong.user.UserDAO"></jsp:useBean>

<%
String newpwd=request.getParameter("newpwd");
String newpwd_check=request.getParameter("newpwd_check");
String id=request.getParameter("id");

int result=udao.changeUserPassword(newpwd, newpwd_check, id);


if(result==3){
	%>
	<script>
		window.alert('비밀번호 변경 완료!');
		location.href='/woodong';
	</script>
	<%
}else if(result==2){
	%>
	<script>
		window.alert('비밀번호가 일치하지 않습니다!');
		location.href='changeUserpassword.jsp?id=<%=id%>';
	</script>
	<%
}else if(result==1){
	%>
	<script>
		window.alert('기존 비밀번호와 동일합니다!');
		location.href='changeUserpassword.jsp?id=<%=id%>';
	</script>
	<%
}else if(result<=0){
	%>
	<script>
		window.alert('비밀번호 변경 실패! 미 해결시 고객센터 문의 바람!');
		location.href='changeUserpassword.jsp?id=<%=id%>';
	</script>
	<%
}
%>