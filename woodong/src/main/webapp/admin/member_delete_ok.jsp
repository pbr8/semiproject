<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<jsp:useBean id="user_dao" class="woodong.user.UserDAO" scope="session"></jsp:useBean>
<%
	String[] ck_nickname = request.getParameterValues("ck");
	List<String> list_nickname = new ArrayList<>();
	if(ck_nickname==null||ck_nickname.length==0){
%>
	<script>
		alert('삭제할 회원을 선택해 주세요.');
		location.href = "admin_page_member_all.jsp";
	</script>
<%
	}else{
		for(String nickname : ck_nickname){
			list_nickname.add(nickname);
		}
		user_dao.user_delete(list_nickname);
%>
		<script>
			alert('삭제되었습니다.');
			location.href = "admin_page_member_all.jsp";
		</script>
<%
	}
	
%>