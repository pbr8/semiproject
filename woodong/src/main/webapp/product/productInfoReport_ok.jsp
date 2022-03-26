<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="udao" class="woodong.user.UserDAO" scope="session"></jsp:useBean>
<jsp:useBean id="prdao" class="woodong.product.report.ProductReportDAO" scope="session"></jsp:useBean>
<%
String s_pidx=request.getParameter("pidx");
String userid=(String)session.getAttribute("sid");
String rcontent=request.getParameter("rcontent");
if(s_pidx==null||s_pidx.equals("")||rcontent==null||rcontent.equals("")){
	%>
	<script>
	alert('잘못된 접근입니다.');
	location.href='productList.jsp';
	</script>
	<%
}

int pidx=Integer.parseInt(s_pidx);
int uidx=udao.findUserIdxByUserId(userid);

int result=prdao.addReport(pidx, uidx, rcontent);
String msg="";
switch(result){
case 1: msg="신고가 접수되었습니다."; break;
case 0: msg="이미 신고하셨습니다."; break;
case -1: msg="신고에 실패하였습니다."; break;
}
%>
<script>
alert('<%=msg%>');
location.href='productInfo.jsp?pidx=<%=pidx%>';
</script>