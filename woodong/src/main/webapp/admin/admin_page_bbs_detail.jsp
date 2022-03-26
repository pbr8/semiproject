<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="woodong.bbs.*" %>
<%@ page import="java.util.*" %>
<jsp:useBean id="bbs_dao" class="woodong.bbs.BbsDAO" scope="session"></jsp:useBean> 

<%	
	String bbs_idx = request.getParameter("bbs_idx");
	String scp = request.getParameter("scp");
	if(scp==null||scp.equals("")){
		scp="";
	}
	
	BbsDTO dto = bbs_dao.bbs_report_detail(bbs_idx);
	int bbs_heart = bbs_dao.bbs_heart(bbs_idx);

%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/woodong/css/adminPageHeader.css">
<style>
body{
     margin: 0 auto;
     width: 680px;
}
#rightset{
	float: right;
}
#center{
	margin-top: 50px; 
}
.b_css{
	border: 1px solid darkgray;
	background-color: rgb(0,0,0,0);
	color: gray;
	padding: 5px;
}
#b_div{
	margin-top: 10px;
	text-align: center;
}
fieldset {
	border: 0.5px solid gray;
}
.title{
	text-align: center;
}
</style>
</head>
<body>
<%@ include file="adminPageHeader.jsp" %>
<section>
	<article>
		<div id="center">
			<h2 class="title"><%=dto.getUser_addr() %> 게시판</h2>
			<fieldset>
				<h3 class="title"><%=dto.getBbs_subject() %></h3>
				<label><%=dto.getUser_name() %></label><br>
				<label><%=dto.getBbs_writedate() %></label>
				<label id="rightset">조회수 <%=dto.getBbs_readnum() %> | 추천 <%=bbs_heart %></label>
				<hr>
				<%=dto.getBbs_content() %>
				<hr>
			</fieldset>
			<div id="b_div">
				<input type="button" class="b_css" value="목록" onclick="location.href='admin_page_bbs.jsp?cp=<%=scp %>'">
			</div>
		</div>
	</article>
</section>
</body>
</html>