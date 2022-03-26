<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="udao" class="woodong.user.UserDAO" scope="session"></jsp:useBean>
<jsp:useBean id="phdao" class="woodong.product.heart.ProductHeartDAO" scope="session"></jsp:useBean>
<%
String s_pidx=request.getParameter("pidx");
if(s_pidx==null||s_pidx.equals("")){
	%>
	<script>
	alert('잘못된 접근입니다.');
	location.href='productList.jsp';
	</script>
	<%
}
int pidx=Integer.parseInt(s_pidx);

String userid=(String)session.getAttribute("sid");
int uidx=udao.findUserIdxByUserId(userid);

int result=phdao.addZzim(pidx, uidx);
String msg="";
switch(result){
case 1: msg="찜 성공!!!"; break;
case 0: msg="이미 찜 한 상품이에요!"; break;
case -1: msg="찜 실패.."; break;
}
%>
<script>
alert('<%=msg%>');
location.href='productInfo.jsp?pidx=<%=pidx %>';
</script>