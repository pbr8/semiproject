<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.*" %>
<%@ page import="woodong.bbs.report.*" %>

<jsp:useBean id="bbs_report_dao" class="woodong.bbs.report.BbsReportDAO" scope="session"></jsp:useBean>
<%
	String[] ck_idx = request.getParameterValues("ck");
	if(ck_idx==null||ck_idx.length==0){
%>
	<script>
		alert('삭제할 게시물을 선택해 주세요.');
		location.href = "admin_page_bbs_report.jsp";
	</script>
<%
	}else{
		bbs_report_dao.bbs_report_delete(ck_idx);
%>
		<script>
			alert('삭제되었습니다.');
			location.href = "admin_page_bbs_report.jsp";
		</script>
<%
	}
	
%>