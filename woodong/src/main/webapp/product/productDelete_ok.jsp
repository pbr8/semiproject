<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="pdao" class="woodong.product.ProductDAO" scope="session"></jsp:useBean>

<%
String s_pidx=request.getParameter("pidx");
if(s_pidx==null||s_pidx.equals("")){
	s_pidx="0";
}
int pidx=Integer.parseInt(s_pidx);

String pimg=request.getParameter("pimg");
if(pimg==null||pimg.equals("")){
	%>
	<script>
	alert('비정상적인 접근 또는 삭제된 판매글입니다.');
	location.href='productList.jsp';
	</script>
	<%
}
pdao.productInfoImgDelete(pimg);
int result=pdao.productInfoDelete(pidx);

if(result>0){
	%>
	<script>
	alert('판매글을 삭제하였습니다.');
	location.href='productList.jsp';
	</script>
	<%
}else{
	%>
	<script>
	alert('판매글 삭제에 실패하였습니다.');
	location.href='productInfo.jsp?pidx=<%=pidx%>'
	</script>
	<%
}
%>
