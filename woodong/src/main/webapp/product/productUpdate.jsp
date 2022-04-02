<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="woodong.product.*" %>
<jsp:useBean id="pdao" class="woodong.product.ProductDAO"></jsp:useBean>>
<%
request.setCharacterEncoding("utf-8"); 
String userid=(String)session.getAttribute("sid");
if(userid==null||userid.equals("")){
	%>
	<script>
	alert('로그인 후 이용 가능합니다.');
	location.href='/woodong';
	</script>
	<%
}
String s_pidx=request.getParameter("pidx");
if(s_pidx==null||s_pidx.equals("")){
	s_pidx="0";
}
int pidx=Integer.parseInt(s_pidx);

ProductDTO pdto=pdao.productInfo(pidx);
if(pdto==null){
	%>
	<script>
	alert('비정상적인 접근 또는 삭제된 게시글입니다.');
	location.href='productList.jsp';
	</script>
	<%
}

String pCategory=pdto.getProduct_category();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/productUpdateLayout.css">
<script>
function selectA(){
    var sel = document.getElementById("category");
    for(var i=0; i<sel.length; i++){
        if(sel[i].value=='<%=pCategory%>'){
            sel[i].selected = true;
        }
    }
}
function imgUploadPop(){
	window.open('productImgUpload.jsp','imgUpload','width=400px,height=360px');
}
</script>
</head>
<body onload="selectA()">
<%@include file="/header.jsp" %>
<section id="bodysection">
<div id="div">
	<article>
		<h2>판매 등록</h2>
	</article>
	<article id="productUpdate_list">
		<form name="productUploadDateForm" action="productUpdate_ok.jsp">
		<input type="hidden" name="product_idx" value="<%=pdto.getProduct_idx()%>">
		<input type="hidden" name="product_img">
		<input type="hidden" name="preImg" value="<%=pdto.getProduct_img() %>">
			<ul>
				<li>
					<select name="product_category" id="category">
						<option value="카테고리" selected disabled="disabled">카테고리</option>
						<option value="의류">의류</option>
						<option value="디지털 / 가전">디지털 / 가전</option>
						<option value="스포츠 / 레저">스포츠 / 레저</option>
						<option value="잡화">잡화</option>
						<option value="식품">식품</option>
						<option value="문구 / 도서">문구 / 도서</option>
						<option value="완구 / 취미">완구 / 취미</option>
						<option value="반려동물 용품">반려동물 용품</option>
					</select>
				</li>
				<li>
					<input type="text" name="product_tel" class="productUpdate_tfPrice" placeholder="연락처" value="<%=pdto.getProduct_tel()%>">
				</li>
				<li>
					<input type="text" name="product_price" class="productUpdate_tfPrice" placeholder="가격" value="<%=pdto.getProduct_price()%>" required><span>&nbsp;원</span>
				</li>
				<li>
					<input type="text" name="product_subject" id="productUpdate_tfSubject" placeholder="제목" value="<%=pdto.getProduct_subject()%>" required>
				</li>
				<li>
					<textarea rows="15" cols="61" placeholder="상품 내용" name="product_content" id="productUpdate_list_ta"><%=pdto.getProduct_content() %></textarea>
				</li>
				<li>
					<table id="imgtable">
						<tr>
							<td>수정할 이미지 선택</td>
							<td>수정 전 이미지</td>
						</tr>
						<tr>
							<td>
								<img src="/woodong/product/img/productImg/imgnone.jpg" alt="이미지 미리보기" id="imgThumb">
							</td>
							<td>
								<img src="/woodong/product/img/productImg/<%=pdto.getProduct_img() %>" alt="이미지 썸네일" id="preImgThumb">
							</td>
						</tr>
						<tr>
							<td align="center">
								<input type="button" value="이미지 올리기" onclick="imgUploadPop();">
							</td>
							<td>&nbsp;</td>
						</tr>
					</table>
				</li>
			</ul>
			<div id="productUpdate_buttons">
				<input type="submit" value="정보수정" class="button_size">
				&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" value="취소" class="button_size" onclick="location.href='productInfo.jsp?pidx=<%=pidx%>'">
			</div>
		</form>
	</article>
</div>
</section>
<%@include file="/footer.jsp" %>
</body>
</html>