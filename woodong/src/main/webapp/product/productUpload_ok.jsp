<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.*" %>
<%request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="pdto" class="woodong.product.ProductDTO"></jsp:useBean>
<jsp:setProperty property="*" name="pdto"/>
<jsp:useBean id="pdao" class="woodong.product.ProductDAO" scope="session"></jsp:useBean>
<jsp:useBean id="udao" class="woodong.user.UserDAO" scope="session"></jsp:useBean>

<%
int result=pdao.productUpload(pdto);
String userid=(String)session.getAttribute("sid");
int uidx=udao.findUserIdxByUserId(userid);
int pidx=pdao.mostRecentProductByUidx(uidx);

if(result>0){
	%>
	<script>
	alert('판매 등록 성공!');
	location.href='productInfo.jsp?pidx=<%=pidx%>';
	</script>
	<%
}else{
	%>
	<script>
	alert('판매 등록 실패!');
	location.href='productUpload.jsp';
	</script>
	<%	
}
%>
