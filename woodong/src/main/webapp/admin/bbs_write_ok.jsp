<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="woodong.bbs.*" %>
<%@ page import="woodong.bbs.*" %>

<jsp:useBean id="bbs_dto" class="woodong.bbs.BbsDTO"></jsp:useBean>  
<jsp:setProperty property="*" name="bbs_dto"/>
<jsp:useBean id="bbs_dao" class="woodong.bbs.BbsDAO" scope="session"></jsp:useBean>
<jsp:useBean id="udao" class="woodong.user.UserDAO" scope="session"></jsp:useBean>

<%


	int bbs_result = bbs_dao.adminBbsWrite(bbs_dto);
	String msg = bbs_result > 0 ? "공지글이 등록되었습니다." : "공지글 등록에 실패하였습니다.";
%>

<script type="text/javascript">
window.alert('<%=msg %>');
window.location.href = "admin_page_bbs.jsp";
</script>