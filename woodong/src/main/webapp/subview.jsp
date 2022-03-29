<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="woodong.bbs.*" %>
<%@ page import="woodong.product.*" %>
<jsp:useBean id="bdao2" class="woodong.bbs.BbsDAO" scope="session"></jsp:useBean>
<jsp:useBean id="pdao" class="woodong.product.ProductDAO" scope="session"></jsp:useBean>
<style>
h3{
	text-align: center;
}
.product_card a{
	text-decoration: none;
	color: black;
}
.product_card{
	margin-left: 20px;
	margin-right: 20px;
	margin-bottom: 40px;
	width: 150px;
}
#fsize:hover{
	width: 160px;
	height: 320px;
	border: 1px solid black;
}
.product_card img{
	width: 150px;
	height: 150px;
	border-radius: 10%;
}
.product_card strong{
	font-size: 18px;
}
.product_card_title{
	width: 180px;
	font-size: 15px;
	margin-top: 4px;
}
.product_card_price_div{
	margin-top: 10px;
	margin-bottom: 10px;
	font-size: 18px;
	font-weight: bold;
}
.product_card_seller{
	font-size: 14px;
}
.zzim{
	font-size: 12px;
	color: gray;
}
#rightside{
	float: right;
	padding-left: 100px; 
	margin-bottom: 50px;
}
#fsize{
	width: 160px;
	height: 320px;
	border: 1px solid #DCDCDC;
}
#ftext{
	width: 190px;
	border: 1px solid #DCDCDC;
}
#hotlist{
	text-decoration: none;
	color:black;
}
#hotlist:hover{
	color: red;
}
</style>
<article id="rightside">
	<fieldset id="fsize">
		<h3>실시간 인기상품</h3>
		<%
		ArrayList<ProductDTO> parr=pdao.subView();
		%>
		<div class="product_card">
        <a href="/woodong/product/productInfo.jsp?pidx=<%=parr.get(0).getProduct_idx()%>">
          <img src="/woodong/product/img/productImg/<%=parr.get(0).getProduct_img() %>" alt="상품 이미지"><br>
          <div class="product_card_title">
            <%=parr.get(0).getProduct_subject() %>
          </div>          
          <div class="product_card_price_div">
			<%=parr.get(0).getProduct_price() %>원
          </div>
          <div class="product_card_seller">
            판매자 : <%=parr.get(0).getUser_nickname() %>
          </div>
        </a>
      </div>
      </fieldset>
      <br>
      <fieldset id="ftext">
      <label>우리 게시판 인기글</label>
      <table id="subTable">
			<tbody>
			<%
			ArrayList<BbsDTO> rarr=bdao2.readnumList();	
				for(int i=0;i<rarr.size();i++){
					%>
					<tr>
						<td>
						<%
						for(int j=1;j<=rarr.get(i).getBbs_lev();j++){
							out.println("&nbsp;&nbsp;");
						}
						%>
						<a id="hotlist" href="locationbbscontent.jsp?bbs_idx=<%=rarr.get(i).getBbs_idx() %>&bbs_readnum=<%=rarr.get(i).getBbs_readnum()%>">
						<%=rarr.get(i).getBbs_subject() %></a></td>
					</tr>
					<%
				}
			%>
			</tbody>
		</table>
     </fieldset>
     <br>
     <fieldset id="fsize">
		<h3>실시간 인기상품</h3>
		<div class="product_card">
        <a href="/woodong/product/productInfo.jsp?pidx=<%=parr.get(1).getProduct_idx()%>">
          <img src="/woodong/product/img/productImg/<%=parr.get(1).getProduct_img() %>" alt="상품 이미지"><br>
          <div class="product_card_title">
            <%=parr.get(1).getProduct_subject() %>
          </div>          
          <div class="product_card_price_div">
			<%=parr.get(1).getProduct_price() %>원
          </div>
          <div class="product_card_seller">
            판매자 : <%=parr.get(1).getUser_nickname() %>
          </div>
        </a>
      </div>
      </fieldset>
	</article>