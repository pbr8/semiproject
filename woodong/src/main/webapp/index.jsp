<%@page import="org.apache.commons.collections4.bag.SynchronizedSortedBag"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page import="woodong.user.*" %>
<%@page import="woodong.product.*"%>
<%@page import="java.util.*"%>
<%@page import="java.io.*" %>

<jsp:useBean id="pdao" class="woodong.product.ProductDAO" scope="session"></jsp:useBean>
<jsp:useBean id="phdao" class="woodong.product.heart.ProductHeartDAO" scope="session"></jsp:useBean>
<jsp:useBean id="udao" class="woodong.user.UserDAO" scope="session"></jsp:useBean>
<%
pdao.deleteNotSavedImg();

String userid=(String)session.getAttribute("sid");
UserDTO udto=udao.findUserInfoByUserId(userid);
String myaddr="전체";
if(udto.getUser_addr()!=null){
	myaddr=udto.getUser_addr().substring(0, 2);
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/woodong/css/index.css">
</head>
<body>
	<%@include file="/header.jsp"%>
	<section id="test">
		<article>
			<div style="text-align: center;">
				<video src="media/index_media.mp4" width="1000px" height="600px"
					controls autoplay muted loop style="pointer-events: none;"></video>
			</div>
		</article>
	</section>

	<hr>

	<div class="main_bc">
		<h1>
			<%=udto.getUser_addr()==null?"중고거래 인기매물":"우리동네 인기매물" %>
		</h1>

		<div id="popular_list">
			<%
			ArrayList<ProductDTO> arr = pdao.mainHotList(myaddr);
			if (arr == null || arr.size() == 0) {
			%>
			<h3 style="text-align: center;">등록된 상품이 없습니다.</h3>
			<%
			} else {
			for (int i = 0; i < arr.size(); i++) {
				
			%>
			<div class="product_card">
				<a href="/woodong/product/productInfo.jsp?pidx=<%=arr.get(i).getProduct_idx()%>">
					<div class="product_card_imgDiv">
						<img
							src="/woodong/product/img/productImg/<%=arr.get(i).getProduct_img()%>"
							alt="상품 이미지"><br>
					</div>
					<div class="product_card_title">
						<%=arr.get(i).getProduct_subject()%>
					</div>
					<div class="product_card_price_div">
						<%=arr.get(i).getProduct_price()%>원
					</div>
					<div class="product_card_seller">
						판매자 :
						<%=arr.get(i).getUser_nickname()%>
					<div class="product_card_seller" style="color: gray; margin-top: 3px;">
	          			<%=arr.get(i).getUser_addr() %>
	          		</div>
					</div> <span class="zzim">찜 <%=phdao.zzimCount(arr.get(i).getProduct_idx())%>
						| <%
 int ptime = pdao.passedTime(arr.get(i).getProduct_idx());
 String s_ptime = "";
 if (ptime < 24) {
 	s_ptime = ptime + "시간 ";
 } else if (ptime < 24 * 7) {
 	s_ptime = (ptime / 24) + "일 ";
 } else if (ptime < 24 * 30) {
 	s_ptime = (ptime / (24 * 7)) + "주 ";
 } else if (ptime < 24 * 30 * 12) {
 	s_ptime = (ptime / (24 * 30)) + "달 ";
 } else {
 	s_ptime = (ptime / (24 * 30 * 12)) + "년 ";
 }
 %> <%=s_ptime%>전
				</span>
				</a>
			</div>
			<%
			}
			}
			%>
		</div>
		<%@include file="/footer.jsp"%>
</body>
</html>