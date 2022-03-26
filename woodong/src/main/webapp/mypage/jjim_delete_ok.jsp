<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.*" %>
<%@ page import="woodong.product.heart.*" %>

<jsp:useBean id="jjim_list_deleteDAO" class="woodong.product.heart.ProductHeartDAO" scope="session"></jsp:useBean>
<jsp:useBean id="user_int" class="woodong.user.UserDAO"></jsp:useBean>


<%
String uid = (String)session.getAttribute("sid");
int uidx = user_int.findUserIdxByUserId(uid);
String[] sel = request.getParameterValues("sel");
if(sel==null || sel.length ==0){
%>

<script>
alert('리스트를 선택해주세요!')
location.href = "jjimlist.jsp"
</script>
<%}else{
jjim_list_deleteDAO.jjim_list_delete(sel, uidx);
%>
<script>
alert('찜 목록의 물품이 삭제되었습니다')
location.href = "jjimlist.jsp";
</script>
<%}%>