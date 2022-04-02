<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="pdao" class="woodong.product.ProductDAO" scope="session"></jsp:useBean>
<jsp:useBean id="udao" class="woodong.user.UserDAO" scope="session"></jsp:useBean>
<%
String s_pidx=request.getParameter("pidx");
if(s_pidx==null||s_pidx.equals("")){
	s_pidx="0";
}
int pidx=Integer.parseInt(s_pidx);

int result=pdao.soldout(pidx);

String msg=result>0?"판매 완료 처리 되었습니다.":"판매 완료 처리 실패!";
%>
<script>
alert('<%=msg%>');
location.href='productInfo.jsp?pidx=<%=pidx%>';
</script>