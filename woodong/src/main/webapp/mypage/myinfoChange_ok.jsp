<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8");%>
<jsp:useBean id="udao" class="woodong.user.UserDAO"></jsp:useBean>

<%

String nickname=request.getParameter("user_nickname");
String id=request.getParameter("user_id");
String addr=request.getParameter("user_addr");
String addr2=request.getParameter("user_addr2");
int result=udao.changeUserInfo(nickname,addr,addr2,id);

String msg=(result>0)?"회원정보 수정 완료":"회원정보 수정 실패";
%>
<script type="text/javascript">
	window.alert('<%=msg%>');
	location.href='/woodong/mypage/myinfo.jsp';
</script>