<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.*" %>
<%@ page import="woodong.product.heart.*" %>

<jsp:useBean id="sell_delete_DAO" class="woodong.product.ProductDAO" scope="session"></jsp:useBean>
<jsp:useBean id="user_int" class="woodong.user.UserDAO"></jsp:useBean>


<%
String[] sel = request.getParameterValues("sel");
if(sel==null || sel.length ==0){
%>

<script>
alert('리스트를 선택해주세요!')
location.href = "selllist.jsp"
</script>
<%}else{
sell_delete_DAO.sell_list_delete(sel);
%>
<script>
alert('판매중 목록의 물품이 삭제되었습니다')
location.href = "selllist.jsp";
</script>
<%}%>