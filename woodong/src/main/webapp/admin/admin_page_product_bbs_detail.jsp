<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="woodong.product.*" %>
<%@ page import="java.util.*" %>

<jsp:useBean id="product_dao" class="woodong.product.ProductDAO" scope="session"></jsp:useBean>
<%
	String product_idx = request.getParameter("product_idx");

	
	List<ProductDTO> dto = product_dao.product_report_detail(product_idx);
	int heart_count = product_dao.product_heart(product_idx);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/woodong/css/adminPageHeader.css">
<style type="text/css">
body{
	background-color: #F5F5F5;
	margin: 0 auto;
    width: 680px;
}
section{
	width: 680px;
	margin: 0px auto;
	margin-top: 30px;
	padding-top: 10px;
	padding-left: 10px;
	padding-right: 10px;
	background-color: white;
}
#productInfo_img{
	
	float: left;
}
#productInfo_img_div{
	margin-top: 25px;
	width: 320px;
	height: 300px;
	border: 1px solid #DCDCDC;
	padding: 1px;
	background-color: white;
	margin-right: 30px;
	margin-bottom: 5px;
	overflow: hidden;
}
#productInfo_img img{
	width: 100%;
	display: block;
}
#productInfo_info{
	width: 280px;
	float: left;
}
#productInfo_title{
	margin-top: 25px;
	width: 260px;
	font-size: 18px;
	font-weight: bold;
}
#productInfo_price{
	font-size: 30px;
	font-weight: bold;
	margin-top: 10px;
}
#productInfo_price span{
	font-weight: normal;
	font-size: 25px;
}
#productInfo_state{
	margin-top: 15px;
	margin-bottom: 15px;
	font-size: 15px;
	color: gray;
}
#productInfo_sinfo{
	width: 235px;
}
#productInfo_sinfo td{
	padding: 3px;
}
.sinfo_subject{
	color: #A9A9A9;
}
.productInfo_button{
	width: 70px;
	background-color: crimson;
	color: white;
	font-weight: bold;
	font-size: 15px;
	text-align: center;
	padding: 15px;
	margin-right: 40px;
	margin-top: 15px;
	margin-bottom: 20px;
	float: left;
}
.productInfo_hr_clear{
	clear: both;
}
#productInfo_content_title{
	font-size: 18px;
	font-weight: bold;
	margin-bottom: 20px;
}
#productInfo_content_ct{
	margin-left: 60px;
	margin-bottom: 40px;
}
</style>
</head>
<body>
<%@ include file="adminPageHeader.jsp" %>
<section>
	<article id="productInfo_img">
		<div id="productInfo_img_div">
			<img src="/woodong/product/img/productImg/<%=dto.get(0).getProduct_img() %>" alt="상품 상세 이미지" id="img">
		</div>
	</article>
	<article id="productInfo_info">
		<div id="productInfo_title">
			<%=dto.get(0).getProduct_subject() %>
		</div>
		<div id="productInfo_price">
			<%=dto.get(0).getProduct_price()%><span>원</span>
		</div>
		<hr>
		<div id="productInfo_state">
			찜 <%=heart_count %>  |  조회수 <%=dto.get(0).getProduct_readnum() %>  |  <%=dto.get(0).getProduct_writedate() %>
		</div>
		<table id="productInfo_sinfo">
			<tr>
				<td class="sinfo_subject">판매자</td><td><%=dto.get(0).getUser_name() %></td>
			</tr>
			<tr>
				<td class="sinfo_subject">연락처</td><td><%=dto.get(0).getProduct_tel() %></td>
			</tr>
			<tr>
				<td class="sinfo_subject">거래지역</td><td><%=dto.get(0).getUser_addr() %></td>
			</tr>
			<tr>
				<td class="sinfo_subject">카테고리</td><td>식품<%=dto.get(0).getProduct_category()%></td>
			</tr>
		</table>
	</article>
	<hr class="productInfo_hr_clear">
	<article>
		<div id="productInfo_content_title">상품정보</div>
		<div id="productInfo_content_ct"><%=dto.get(0).getProduct_content() %></div>
	</article>
<hr class="productInfo_hr_clear">
</section>
</body>
</html>