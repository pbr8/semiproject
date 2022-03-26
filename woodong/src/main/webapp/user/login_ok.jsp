<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="woodong.user.UserDAO" %>
<jsp:useBean id="udao" class="woodong.user.UserDAO" scope="page"></jsp:useBean>

<%
String id=request.getParameter("user_id");
String pwd=request.getParameter("user_pwd");
String save_id=request.getParameter("save_id");


boolean result=udao.loginCheck(id, pwd);

if(result){
	String name=udao.getUserName(id);
	
	if(id.equals("admin")&&pwd.equals("1234")){
		session.setAttribute("admin", id);
		%>
		<script>
		opener.location.href='/woodong/admin/adminPage.jsp';
		window.self.close();
		</script>
		<%
	}
	
	session.setAttribute("sid", id);
	session.setAttribute("sname", name);
	
	if(save_id==null){
		Cookie ck=new Cookie("save_id",id);
		ck.setMaxAge(0);
		response.addCookie(ck);
	}else{
		Cookie ck=new Cookie("save_id",id);
		ck.setMaxAge(60*60*24*30);
		response.addCookie(ck);
	}
	%>
	<script>
	window.alert('<%=name%>님 환영합니다.');
	opener.location.reload();
	window.self.close();
	</script>
	<%
}else{
	%>
	<script>
	window.alert('아이디 또는 비밀번호가 잘못되었습니다.');
	location.href='login.jsp';
	</script>
	<%
}

%>