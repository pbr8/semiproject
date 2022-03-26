<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="pdto" class="woodong.product.ProductDTO"></jsp:useBean>
<jsp:setProperty property="*" name="pdto"/>
<jsp:useBean id="pdao" class="woodong.product.ProductDAO" scope="session"></jsp:useBean>
<% 
request.setCharacterEncoding("utf-8");

String preImgName=request.getParameter("preImg");
int result=pdao.productUpdate(pdto,preImgName);

if(result>0){
	%>
	<script>
	alert('판매정보 수정 완료!');
	location.href='productInfo.jsp?pidx=<%=pdto.getProduct_idx()%>';
	</script>
	<%
}else{
	%>
	<script>
	alert('판매정보 수정 실패!!');
	location.href='productUpdate.jsp?pidx=<%=pdto.getProduct_idx()%>';
	</script>
	<%
}
%>