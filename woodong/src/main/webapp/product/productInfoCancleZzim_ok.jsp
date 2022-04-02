<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="phdao" class="woodong.product.heart.ProductHeartDAO" scope="session"></jsp:useBean>
<jsp:useBean id="udao" class="woodong.user.UserDAO" scope="session"></jsp:useBean>
<%
String s_pidx=request.getParameter("pidx");
if(s_pidx==null||s_pidx.equals("")){
	s_pidx="0";
}
int pidx=Integer.parseInt(s_pidx);

String userid=(String)session.getAttribute("sid");
int uidx=udao.findUserIdxByUserId(userid);

int result=phdao.cancleZzim(pidx, uidx);

String msg=result>0?"찜을 취소하였습니다.":"찜 취소 실패..";
%>
<script>
alert('<%=msg%>');
location.href='productInfo.jsp?pidx=<%=pidx%>';
</script>