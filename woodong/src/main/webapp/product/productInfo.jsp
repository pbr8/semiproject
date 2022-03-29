<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="woodong.product.*" %>
<%@ page import="woodong.product.heart.*" %>
<%@ page import="woodong.user.*" %>
<jsp:useBean id="pdao" class="woodong.product.ProductDAO" scope="session"></jsp:useBean>
<jsp:useBean id="udao" class="woodong.user.UserDAO" scope="session"></jsp:useBean>
<jsp:useBean id="phdao" class="woodong.product.heart.ProductHeartDAO" scope="session"></jsp:useBean>
<%
request.setCharacterEncoding("utf-8");


String userid=(String)session.getAttribute("sid");

UserDTO udto=udao.findUserInfoByUserId(userid);

String s_pidx=request.getParameter("pidx");
if(s_pidx==null||s_pidx.equals("")){
	s_pidx="0";
}
int pidx=Integer.parseInt(s_pidx);

pdao.addProductInfoReadNum(pidx);
ProductDTO pdto=pdao.productInfo(pidx);
if(pdto==null){
	%>
	<script>
	alert('비정상적인 접근 또는 삭제된 게시글입니다.');
	location.href='productList.jsp';
	</script>
	<%
}

int ptime=pdao.passedTime(pidx);

String s_ptime="";
if(ptime<24){
	s_ptime=ptime+"시간 ";
}else if(ptime<24*7){
	s_ptime=(ptime/24)+"일 ";
}else if(ptime<24*30){
	s_ptime=(ptime/(24*7))+"주 ";
}else if(ptime<24*30*12){
	s_ptime=(ptime/(24*30))+"달 ";
}else{
	s_ptime=(ptime/(24*30*12))+"년 ";
}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/woodong/product/css/productInfoLayout.css">
<script>
function addZzim(){
	var uid='<%=userid%>';
	if(uid=='null'){
		window.alert('로그인 후 이용 가능합니다.');
		return;
	}
	window.location.href='productInfoZzim_ok.jsp?pidx=<%=pdto.getProduct_idx()%>';
}
function addReport(){
	var uid='<%=userid%>';
	if(uid=='null'){
		window.alert('로그인 후 이용 가능합니다.');
		return;
	}
	var rcontent=window.prompt('신고 내용을 입력해주십시오.');
	if(rcontent!=null){
		window.location.href='productInfoReport_ok.jsp?rcontent='+rcontent+'&pidx=<%=pdto.getProduct_idx()%>';
	}
}
function goDelete(){
	var result=window.confirm('정말로 삭제하시겠습니까?');
	if(!result){
		return;
	}else{
		location.href='productDelete_ok.jsp?pidx=<%=pdto.getProduct_idx()%>&pimg=<%=pdto.getProduct_img()%>'
	}
}
function goUpdate(){
	location.href='productUpdate.jsp?pidx=<%=pdto.getProduct_idx()%>';
}
function goList(){
	location.href='productList.jsp?pCategory=<%=pdto.getProduct_category()%>';
}
function soldOut(){
	var result=window.confirm('판매 완료 처리 하시겠습니까?');
	if(!result){
		return;
	}else{
		location.href='productSoldout_ok.jsp?pidx=<%=pdto.getProduct_idx()%>';
	}
}
</script>
</head>
<body onload="soldOutImgChange();">
<%@include file="/header.jsp" %>
<section>
	<h2 style="margin-top: 160px; text-align: center; font-size: 32px;">상세 페이지</h2>
	<div id="toListDiv">
		<input type="button" value="목록" onclick="goList()" id="toList">
	</div>
	<div id="bodysection">
		<article id="productInfo_img">
			<div id="productInfo_img_div">
			<%
			if(pdto.getProduct_state()==0){
				%>
				<img src="/woodong/product/img/soldout.png" alt="판매완료" id="soldOutImg" >
				<img src="/woodong/product/img/productImg/<%=pdto.getProduct_img() %>" alt="상품 상세 이미지" id="mainimg">
				<%
			}else{
				%>
				<img src="/woodong/product/img/productImg/<%=pdto.getProduct_img() %>" alt="상품 상세 이미지" id="mainimg">
				<%
			}
			%>
			</div>
		</article>
		<article id="productInfo_info">
			<div id="productInfo_title">
				<%=pdto.getProduct_subject() %>
			</div>
			<div id="productInfo_price">
				<%=pdto.getProduct_price() %><span>원</span>
			</div>
			<hr>
			<div id="productInfo_state">
				찜 <%=phdao.zzimCount(pidx) %>  |  조회수 <%=pdto.getProduct_readnum() %>  |  <%=s_ptime %>전
			</div>
			<table id="productInfo_sinfo">
				<tr>
					<td class="sinfo_subject">판매자</td><td><%=pdto.getUser_nickname() %></td>
				</tr>
				<tr>
					<td class="sinfo_subject">연락처</td><td><%=pdto.getProduct_tel() %></td>
				</tr>
				<tr>
					<td class="sinfo_subject">거래지역</td><td><%=pdto.getUser_addr() %></td>
				</tr>
				<tr>
					<td class="sinfo_subject">카테고리</td><td><%=pdto.getProduct_category() %></td>
				</tr>
				<tr>
					<td class="sinfo_subject">판매여부</td><td><%=pdto.getProduct_state()==1?"판매중":"판매완료" %></td>
				</tr>
			</table>
			<hr>
			
			
				<%
				if(pdto!=null&&pdto.getUser_idx()==udto.getUser_idx()){
					%>
					<div id="productInfo_button_div">
						<div id="UpDeDiv">
							<input type="button" value="수정" onclick="goUpdate();" class="toGoButtons" <%=pdto.getProduct_state()==0?"disabled style='background-color: #DCDCDC;'":"" %>>
							<input type="button" value="삭제" onclick="goDelete();" class="toGoButtons">
						</div>
						<input type="button" value="판매완료" onclick="soldOut();" class="productInfo_button" <%=pdto.getProduct_state()==0?"disabled style='background-color: #DCDCDC;'":"" %>>
					</div>
					<%
				}else{
					%>
					<div id="productInfo_button_div2">
						<input type="button" value="찜 하기" onclick="addZzim();" class="productInfo_button2">
						<input type="button" value="신고하기" onclick="addReport();" class="productInfo_button2">
					</div>
					<%
				}
				%>
		</article>
		<hr class="productInfo_hr_clear">
		<article>
			<div id="productInfo_content_title">상품정보</div>
			<div id="productInfo_content_ct"><%=pdto.getProduct_content().replaceAll("\n", "<br>") %></div>
		</article>
		<hr class="productInfo_hr_clear">
		<%
		ArrayList<ProductDTO> otherArr=pdao.ssopList(pdto.getUser_idx(),pdto.getProduct_idx());
		if(otherArr!=null&&otherArr.size()>0) {
		%>
		<article>
			<div id="product_seller_other_div">
				<div class="productInfo_other_list_title">
					<a href="productList.jsp?uidx=<%=pdto.getUser_idx()%>" style="text-decoration: none; color: black;">
						<%=pdto.getUser_nickname() %> 님의 다른 상품
					</a>
				</div>
				<%
				for(int i=0; i<otherArr.size(); i++){
					String sj=otherArr.get(i).getProduct_subject();
						if(sj.length()>10){
							sj=sj.substring(0,10)+"...";
						}
						if(i==5) break;
						%>
					<a href="productInfo.jsp?pidx=<%=otherArr.get(i).getProduct_idx()%>" style="text-decoration: none; color: black;">
					<div class="productInfo_other_img">
						<img src="/woodong/product/img/productImg/<%=otherArr.get(i).getProduct_img() %>" alt="다른 판매 상품">
						<div class="productInfo_other_title"><%=sj %></div>
					</div>
					</a>
					<%
				} 
				%>	
			</div>	
			<hr class="productInfo_hr_clear">
		</article>
		<%
		}
		
		ArrayList<ProductDTO> relatedArr=pdao.lpList(pdto.getProduct_category(),pdto.getProduct_idx());
		if(relatedArr!=null&&relatedArr.size()>0){
		%>
		<article>
			<div id="product_seller_other_div">
				<div class="productInfo_other_list_title">
				<a href="productList.jsp?pCategory=<%=pdto.getProduct_category()%>" style="text-decoration: none; color: black;">연관 상품</a>
				</div>
				<% 
				for(int i=0; i<relatedArr.size(); i++){
					String sj2=relatedArr.get(i).getProduct_subject();
					if(sj2.length()>10){
						sj2=sj2.substring(0,10)+"...";
					}
					if(i==5) break;
					%>
					<a href="productInfo.jsp?pidx=<%=relatedArr.get(i).getProduct_idx()%>" style="text-decoration: none; color: black;">
					<div class="productInfo_other_img">
						<img src="/woodong/product/img/productImg/<%=relatedArr.get(i).getProduct_img() %>" alt="다른 판매 상품">
						<div class="productInfo_other_title"><%=sj2 %></div>
					</div>
					</a>
					<%
				} 
				%>
			</div>
		</article>
		<%
		}
		%>
	</div>
</section>
<div style="margin-bottom: 40px;">&nbsp;</div>
<%@include file="/footer.jsp" %>
</body>
</html>