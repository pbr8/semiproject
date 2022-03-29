<%@page import="woodong.user.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="woodong.product.*" %>
<%@ page import="java.util.*" %>
<jsp:useBean id="pdao" class="woodong.product.ProductDAO" scope="session"></jsp:useBean>
<jsp:useBean id="phdao" class="woodong.product.heart.ProductHeartDAO" scope="session"></jsp:useBean>
<jsp:useBean id="udao" class="woodong.user.UserDAO" scope="session"></jsp:useBean>
<%


String s_uidx=request.getParameter("uidx");
if(s_uidx==null||s_uidx.equals("")){
	s_uidx="0";
}
int uidx=Integer.parseInt(s_uidx);

String pCategory=request.getParameter("pCategory");

String keyword=request.getParameter("search_text");

UserDTO udto=udao.findUserInfoByUserIdx(uidx);

int totalCnt=0;
int listSize=12;
int pageSize=5;

String s_cp=request.getParameter("cp");
if(s_cp==null||s_cp.equals("")){
	s_cp="1";
}
int cp=Integer.parseInt(s_cp);


ArrayList<ProductDTO> arr=null;
if(keyword!=null&&!keyword.equals("null")){
	arr=pdao.main_Product_Search(keyword, cp, listSize);
	totalCnt=pdao.getTotalCntS(keyword);
}else if(uidx>0){
	arr=pdao.samesellerListPage(uidx, cp, listSize);
	totalCnt=pdao.getTotalCntU(uidx);
}else{
	arr=pdao.productList(pCategory,cp,listSize);
	totalCnt=pdao.getTotalCntC(pCategory);
}

int totalPage=(totalCnt%listSize)==0?(totalCnt/listSize):(totalCnt/listSize)+1;
int userGroup=(cp%pageSize)==0?(cp/pageSize)-1:(cp/pageSize);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/woodong/product/css/productListLayout.css">
</head>
<body>
<%@include file="/header.jsp" %>
<div id="userAddr">&nbsp;</div>
<section id="bodysection">
  <article>
  	<%
     if(keyword!=null&&!keyword.equals("null")){
        %>
        <h2>"<%=keyword %>" 검색 결과 목록</h2>
        <%
     }else if(uidx>0){
        %>
        <h2>"<%=udto.getUser_nickname() %>" 님의 판매 상품 목록</h2>
        <%
     }else{
        %>
        <h2>"<%=pCategory %>" 상품 목록</h2>
        <%
     }
     %>
  </article>
  <article>
    <div id="popular_list">
    <%
    if(arr==null||arr.size()==0){
    	%>
    	<h3 style="text-align: center;">
    	등록된 상품이 없습니다.
    	</h3>
    	<%
    }else{
	    for(int i=0; i<arr.size(); i++){
		%>
	      <div class="product_card">
	        <a href="productInfo.jsp?pidx=<%=arr.get(i).getProduct_idx()%>">
	        	<div class="product_card_imgDiv">
	        	<%
	        	if(arr.get(i).getProduct_state()==0){
	        		%>
	        		<img src="/woodong/product/img/soldout.png" alt="판매완료 이미지" class="soldoutImg">
	          		<img src="/woodong/product/img/productImg/<%=arr.get(i).getProduct_img() %>" alt="상품 이미지" class="listImg"><br>
	          		<%
	        	}else{
	        		%>
	          		<img src="/woodong/product/img/productImg/<%=arr.get(i).getProduct_img() %>" alt="상품 이미지" class="listImg"><br>
	          		<%
	        	}
	        	%>
	          	</div>
	          	<div class="product_card_title">
	            	<%=arr.get(i).getProduct_subject().length()>13?arr.get(i).getProduct_subject().substring(0,13)+"...":arr.get(i).getProduct_subject() %>
	          	</div>          
	          	<div class="product_card_price_div">
	           		<%=arr.get(i).getProduct_price() %>원
	          	</div>
	          	<div class="product_card_seller">
	            	판매자 : <%=arr.get(i).getUser_nickname() %>
	          	</div>
	          	<span class="zzim">찜 <%=phdao.zzimCount(arr.get(i).getProduct_idx()) %> | 
				<%
		        int ptime=pdao.passedTime(arr.get(i).getProduct_idx());
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
				 <%=s_ptime %>전
				</span>
	        </a>
	      </div>
	   	<%
	    }
    }
    %>
    </div>
    <table id="pagingTable">
    	<tr>
    	<!-- paging -->
    	<%
    	if(userGroup!=0){ 
    		%>
    		<td class="pageList"><a href="productList.jsp?cp=<%=(userGroup-1)*pageSize+pageSize %>">&lt;&lt;</a></td>
			<%
		} 
		for(int i=(userGroup*pageSize)+1; i<=(userGroup+1)*pageSize; i++){ 
			if(i==cp){
				%>
	    		<td class="cp"><a href="productList.jsp?cp=<%=i %>&uidx=<%=uidx%>&pCategory=<%=pCategory%>&search_text=<%=keyword%>"><%=i %></a></td>
	    		<%
	    	}else{
	    		%>
		    	<td class="pageList"><a href="productList.jsp?cp=<%=i %>&uidx=<%=uidx%>&pCategory=<%=pCategory%>&search_text=<%=keyword%>"><%=i %></a></td>
		    	<%
		    }
			if(i==totalPage)break;
		}if(userGroup!=(totalPage/pageSize)-(totalPage%pageSize==0?1:0)){
			%>
			<td class="pageList"><a href="productList.jsp?cp=<%=(userGroup+1)*pageSize+1 %>">&gt;&gt;</a></td>
			<%
		}
		%>
		</tr>
	</table>
  </article>
</section>
<%@include file="/footer.jsp" %>
</body>
</html>